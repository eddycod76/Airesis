#encoding: utf-8
#TODO questi metodi devono essere eseguiti in background e non vi deve essere attesa lato client perchè siano completati
module NotificationHelper
  
  #invia una notifica ad un utente.
  #se l'utente ha bloccato il tipo di notifica allora non viene inviata
  #se l'utente ha abilitato anche l'invio via mail allora viene inviata via mail
  def send_notification_to_user(notification,user)
     unless user.blocked_notifications.include?notification.notification_type #se il tipo non è bloccato
      alert = UserAlert.new(:user_id => user.id, :notification_id => notification.id, :checked => false);
      alert.save! #invia la notifica
      res = PrivatePub.publish_to("/notifications/#{user.id}", pull: 'hello') rescue nil  #todo send specific alert to be included
      if user.email_alerts && (!user.blocked_email_notifications.include?notification.notification_type) && user.email
        ResqueMailer.notification(alert.id).deliver
      end
     end
     true
  end
  
  
  #invia le notifiche quando un utente valuta la proposta
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_user_valutate_proposal(proposal_ranking)
    proposal = proposal_ranking.proposal
    msg = "La tua proposta <b>"+proposal.title+"</b> ha ricevuto una nuova valutazione!";
      notification_a = Notification.new(:notification_type_id => 20,:message => msg, :url => proposal_path(proposal))
      notification_a.save
    proposal.users.each do |user|
      if user != proposal_ranking.user
        send_notification_to_user(notification_a,user)
      end
    end
    msg = "La proposta <b>"+proposal.title+"</b> ha ricevuto una nuova valutazione!";
    notification_b = Notification.create(:notification_type_id => 21,:message => msg,:url => proposal_path(proposal))
    proposal.partecipants.each do |user|
      if (user != proposal_ranking.user) && (!proposal.users.include?user)
        send_notification_to_user(notification_b,user)
      end
    end
    
  end

  #send notifications when a user insert a comment to a proposal
  #notifications are sent to authors and partecipants
  def notify_user_comment_proposal(comment)
    proposal = comment.proposal
    comment_user = comment.user
    nickname = ProposalNickname.find_by_user_id_and_proposal_id(comment_user.id,proposal.id)
    name = (nickname && proposal.is_anonima?) ? nickname.nickname : comment_user.fullname #send nickname if proposal is anonymous
    msg = "<b>"+name+"</b> ha inserito un contributo alla tua proposta <b>"+proposal.title+"</b>!";
    subject = proposal.private? ? "[#{proposal.presentation_groups.first.name}]" : ''
    subject +=  " #{proposal.title} - Nuovo contributo"
    data = {'comment_id' => comment.id.to_s, 'proposal_id' => proposal.id.to_s, 'to_id' => "proposal_c_#{proposal.id}", 'subject' => subject, 'username' => name}
    notification_a = Notification.new(:notification_type_id => NotificationType::NEW_CONTRIBUTES_MINE,:message => msg, :url => proposal_path(proposal) +"#comment"+comment.id.to_s, :data => data)
    notification_a.save
    proposal.users.each do |user|
      if user != comment_user
        send_notification_to_user(notification_a,user)
      end
    end
    
    msg = "<b>"+name+"</b> ha inserito un contributo alla proposta <b>"+proposal.title+"</b>!";
    notification_b = Notification.create(:notification_type_id => NotificationType::NEW_CONTRIBUTES,:message => msg,:url => proposal_path(proposal) +"#comment"+comment.id.to_s, :data => data)
    proposal.partecipants.each do |user|
      if (user != comment_user) && (!proposal.users.include?user)
        send_notification_to_user(notification_b,user)
      end
    end
  end

  #invia le notifiche quando un una proposta viene creata

  def notify_proposal_has_been_created(proposal,group = nil)
    if group
      subject =  "[#{group.name}] #{proposal.title}"
      msg = "E' stata creata una proposta <b>" + proposal.title + "</b> nel gruppo <b>" + group.name + "</b>"
      data = {'group_id' => group.id.to_s, 'proposal_id' => proposal.id.to_s, 'subject' => subject}
      notification_a = Notification.new(:notification_type_id => 10,:message => msg, :url => group_proposal_path(group,proposal), :data => data)
      notification_a.save
      #le notifiche vengono inviate ai partecipanti al gruppo che possono visualizzare le proposte
      group.scoped_partecipants(GroupAction::PROPOSAL_VIEW).each do |user|
        if user != current_user
          send_notification_to_user(notification_a,user)
        end
      end
    else
      subject =  "#{proposal.title}"
      msg = "E' stata creata una proposta <b>" + proposal.title + "</b> nello spazio comune"
      data = {'proposal_id' => proposal.id.to_s, 'subject' => subject}
      notification_a = Notification.new(:notification_type_id => 3,:message => msg, :url => proposal_path(proposal), :data => data)
      notification_a.save
      User.where("id not in (#{User.select("users.id").joins(:blocked_alerts).where("blocked_alerts.notification_type_id = 3").to_sql})").each do |user|
        if user != current_user
          send_notification_to_user(notification_a,user)
        end
      end
    end
  end
  
  
  #invia le notifiche quando un una proposta viene modificata
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_proposal_has_been_updated(proposal,group=nil)
    subject = ''
    subject +=  "[#{group.name}] " if group
    subject +="#{proposal.title} - Il testo è stato modificato"

    msg = "La proposta <b>" + proposal.title + "</b> è stata aggiornata!"

    data = {'proposal_id' => proposal.id.to_s, 'subject' => subject, 'revision_id' => (proposal.last_revision ? proposal.last_revision.id : nil)}
    notification_a = Notification.new(:notification_type_id => NotificationType::TEXT_UPDATE,:message => msg, :url => proposal_path(proposal), :data => data)
    notification_a.save
    proposal.partecipants.each do |user|
      if user != current_user
        #non inviare la notifica se l'utente ne ha già una uguale sulla stessa proposta che ancora non ha letto
        another = Notification.first(:joins => [:notification_data, :user_alerts => [:user]],:conditions => ['notification_data.name = ? and notification_data.value = ? and notifications.notification_type_id = ? and users.id = ? and user_alerts.checked = false','proposal_id',proposal.id.to_s,2,user.id.to_s])
        send_notification_to_user(notification_a,user) unless another
      end
    end    
  end



  def notify_user_unintegrated_contribute(proposal_comment)
    @proposal = proposal_comment.proposal
    @group = @proposal.private ? @proposal.presentation_groups.first : nil
    comment_user = proposal_comment.user
    nickname = ProposalNickname.find_by_user_id_and_proposal_id(comment_user.id,@proposal.id)
    name = (nickname && @proposal.is_anonima?) ? nickname.nickname : comment_user.fullname #send nickname if proposal is anonymous

    subject = ''
    subject +=  "[#{@group.name}] " if @group
    subject +="#{@proposal.title} - Contributo rimesso in dibattito"

    msg = "Un contributo che avevi integrato è stato rimesso in dibattito"

    data = {'proposal_id' => @proposal.id.to_s, 'subject' => subject, 'comment_id' => proposal_comment.id.to_s, 'username' => name}
    notification_a = Notification.new(:notification_type_id => NotificationType::UNINTEGRATED_CONTRIBUTE,:message => msg, :url => proposal_path(@proposal), :data => data)
    notification_a.save
    @proposal.users.each do |user|
      if user != current_user
        send_notification_to_user(notification_a,user)
      end
    end
  end


   #invia le notifiche quando viene scelta una data di votazione per la proposta
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_proposal_waiting_for_date(proposal,group = nil)
    subject = ''
    subject +=  "[#{group.name}] "     if group
    subject +="#{proposal.title} - è stata scelta la data di votazione"

    nickname = ProposalNickname.find_by_user_id_and_proposal_id(current_user.id,proposal.id)
    name = nickname ? nickname.nickname : current_user.fullname
    msg = name+" ha scelto la data di votazione per la proposta <b>" + proposal.title + "</b>!"
    data = {'proposal_id' => proposal.id.to_s, 'subject' => subject}
    notification_a = Notification.new(:notification_type_id => 4,:message => msg, :url => proposal_path(proposal), :data => data)
    notification_a.save
    proposal.partecipants.each do |user|
      if user != current_user
        send_notification_to_user(notification_a,user)
      end
    end    
  end
  
    #invia le notifiche quando la proposta è pronta per essere messa in votazione
   #le notifiche vengono inviate ai creatori  della proposta
  def notify_proposal_ready_for_vote(proposal,group=nil)
    subject = ''
    subject +=  "[#{group.name}] "  if group
    subject +="#{proposal.title} - scegli la data di votazione!"

    msg = "La proposta <b>" + proposal.title + "</b> ha passato la fase di valutazione ed è ora in attesa che tu scelga quando votarla."
    data = {'proposal_id' => proposal.id.to_s, 'subject' => subject}
    notification_a = Notification.new(notification_type_id: 6,:message => msg, url: proposal_path(proposal), data: data)
    notification_a.save
    proposal.users.each do |user|
      if !(defined? current_user) || (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end    
  end

  #invia le notifihe per dire che la proposta è in votazione
  def notify_proposal_in_vote(proposal,group=nil)
    subject = ''
    subject +=  "[#{group.name}] " if group
    subject +="#{proposal.title} - VIENI A VOTARE!"

    msg = "La proposta <b>" + proposal.title + "</b> è in votazione da adesso!"
    data = {'proposal_id' => proposal.id.to_s, 'subject' => subject}
    notification_a = Notification.new(notification_type_id: 4, message: msg, url: proposal_path(proposal), data: data)
    notification_a.save

    users = group ?
      group.scoped_partecipants(GroupAction::PROPOSAL_VOTE) :
      proposal.partecipants

    users.each do |user|
      if !(defined? current_user) || (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end


  end


  #invia le notifiche quando la proposta è stata abbandonata
  #le notifiche vengono inviate ai partecipanti
  def notify_proposal_abandoned(proposal,group=nil)
    subject = ''
    subject +=  "[#{group.name}] " if group
    subject +="#{proposal.title} non ha superato il dibattito"
    data = {'proposal_id' => proposal.id.to_s, 'subject' => subject}

    msg = "La tua proposta <b>" + proposal.title + "</b> non ha superato il dibattito ed è stata abbandonata, spiacente."
    notification_a = Notification.new(notification_type_id: NotificationType::CHANGE_STATUS_MINE, message: msg, url: proposal_path(proposal), :data => data)
    notification_a.save
    proposal.users.each do |user|
      if !(defined? current_user) || (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end

    msg = "La proposta <b>" + proposal.title + "</b> non ha superato il dibattito ed è stata abbandonata."
    notification_b = Notification.create(:notification_type_id => NotificationType::CHANGE_STATUS,:message => msg,:url => proposal_path(proposal), :data => data)
    proposal.partecipants.each do |user|
      unless proposal.users.include? user
        send_notification_to_user(notification_b,user)
      end
    end
  end

  #invia le notifiche quando la proposta è stata rigettata
  #le notifiche vengono inviate ai partecipanti
  def notify_proposal_rejected(proposal,group=nil)
    subject = ''
    subject +=  "[#{group.name}] " if group
    subject +="#{proposal.title} è stata respinta"
    data = {'proposal_id' => proposal.id.to_s, 'subject' => subject}

    msg = "La tua proposta <b>" + proposal.title + "</b> è stata respinta dai partecipanti, spiacente."
    notification_a = Notification.new(notification_type_id: NotificationType::CHANGE_STATUS_MINE, message: msg, url: proposal_path(proposal), :data => data)
    notification_a.save
    proposal.users.each do |user|
      if !(defined? current_user) || (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end

    msg = "La proposta <b>" + proposal.title + "</b> è stata respinta dai partecipanti."
    notification_b = Notification.create(:notification_type_id => NotificationType::CHANGE_STATUS,:message => msg,:url => proposal_path(proposal), :data => data)
    proposal.partecipants.each do |user|
      unless proposal.users.include? user
        send_notification_to_user(notification_b,user)
      end
    end
  end
  
  #invia una notifica agli utenti che possono accettare membri che l'utente corrente ha effettuato una richiesta di partecipazione al gruppo
  def notify_user_asked_for_partecipation(group)
    msg = "L'utente <b>#{current_user.fullname}</b> ha richiesto di partecipare al gruppo <b>#{group.name}</b>."
    notification_a = Notification.new(notification_type_id: 12, message: msg, url: group_path(group))
    notification_a.save
    group.scoped_partecipants(GroupAction::REQUEST_ACCEPT).each do |user|
      if user != current_user
        send_notification_to_user(notification_a,user)
      end
    end    
  end
    
  #invia le notifiche quando un utente inserisce un post sul proprio blog
  #le notifiche vengono inviate agli utenti che seguono il blog dell'autore,
  #agli utenti che seguono o partecipano ai gruppi in cui il post è stato inserito
  def notify_user_insert_blog_post(blog_post)
    post_user = blog_post.user
    user_followers = post_user.followers  #utenti che seguono il blog
    sent_users = []
    msg = "<b>"+ post_user.fullname + "</b> ha inserito un nuovo post nel proprio blog <b>"+blog_post.title+"</b>!";
    notification_a = Notification.new(:notification_type_id => 15,:message => msg, :url => blog_blog_post_path(blog_post.blog, blog_post))
    notification_a.save
    user_followers.each do |user|
      if (user != post_user) && (!sent_users.include?user)
        if send_notification_to_user(notification_a,user)
          sent_users << user
        end
      end
    end
    
    blog_post.groups.each do |group|
      msg = "<b>"+ post_user.fullname + "</b> ha inserito un nuovo post nella pagina del gruppo <b>"+group.name+"</b>!";
      #notifica a chi segue il gruppo
      notification_b = Notification.create(:notification_type_id => 8,:message => msg,:url => group_blog_post_path(group, blog_post))
      group.followers.each do |user|
        if (user != post_user) && (!sent_users.include?user)
          if send_notification_to_user(notification_b,user)
            sent_users << user
          end
        end
      end
      
      #notifica a chi partecipa al gruppo
      notification_b = Notification.create(:notification_type_id => 9,:message => msg,:url => group_blog_post_path(group, blog_post))
      group.partecipants.each do |user|
        if (user != post_user) && (!sent_users.include?user)
          if send_notification_to_user(notification_b,user)
            sent_users << user
          end
        end
      end
    end    
  end


  #invia una notifica ai redattori della proposta che qualcuno si è offerto per redigere la sintesi
  def notify_user_available_authors(proposal)
    msg = "L'utente <b>#{current_user.fullname}</b> si è offerto come redattore della proposta <b>#{proposal.title}</b>."
    data = {'proposal_id' => proposal.id.to_s}
    notification_a = Notification.new(:notification_type_id => 22,:message => msg, :url => proposal_path(proposal), data: data)
    notification_a.save
    proposal.users.each do |user|
      if user != current_user
        send_notification_to_user(notification_a,user)
      end
    end
  end

  #invia una notifica all'utente che è stato accettato come redattore di una proposta
  def notify_user_choosed_as_author(user,proposal)
    msg = "Sei stato scelto come redattore alla sintesi della proposta <b>#{proposal.title}</b>.<br/>
           Ricordati che per essere un buon redattore dovrai recepire i contributi degli altri utenti e migliorare il testo secondo i consigli ricevuti.<br/>
           Buon lavoro! "
    notification_a = Notification.new(notification_type_id: 23, message: msg, url: proposal_path(proposal))
    notification_a.save
    send_notification_to_user(notification_a,user)

    msg = "L'utente <b>#{user.fullname}</b> è stato scelto come redattore alla sintesi della proposta <b>#{proposal.title}</b>."
    notification_b = Notification.new(notification_type_id: 24, message: msg, url: proposal_path(proposal))
    notification_b.save
    proposal.partecipants.each do |partecipant|
      unless partecipant == current_user || partecipant == user #invia la notifica a tutti tranne a chi è stato scelto e ha chi ha scelto
        send_notification_to_user(notification_b,partecipant)
      end
    end
  end


  #invia una notifica agli utenti che è stato creato un nuovo evento
  def notify_new_event(event)
    if event.private
      organizer = event.organizers.first
      data = {'event_id' => event.id.to_s, 'subject' => "[#{organizer.name}] Nuovo evento: #{event.title}"}
      msg = "E' stato creato un nuovo evento nel gruppo #{organizer.name}!<br/> Vai alla pagina di <b>#{event.title}</b> per visualizzarlo."
      notification_a = Notification.new(notification_type_id: 14, message: msg, :url => event_path(event), data: data)
      notification_a.save

      organizer.partecipants.each do |user|
        unless user == current_user #invia la notifica a tutti tranne a chi ha creato l'evento
          send_notification_to_user(notification_a,user)
        end
      end
    else
      data = {'event_id' => event.id.to_s, 'subject' => "Nuovo evento: #{event.title}"}
      msg = "E' stato creato un nuovo evento pubblico!<br/> Vai alla pagina di <b>#{event.title}</b> per visualizzarlo."
      notification_a = Notification.new(notification_type_id: 13,:message => msg, url: event_path(event), data: data)
      notification_a.save

      User.where("id not in (#{User.select("users.id").joins(:blocked_alerts).where("blocked_alerts.notification_type_id = 13").to_sql})").each do |user|
        unless user == current_user #invia la notifica a tutti tranne a chi ha creato l'evento
          send_notification_to_user(notification_a,user)
        end
      end
    end
  end


  #send an alert to the author that there is a new comments in his blog
  def notify_new_blog_post_comment(blog_comment)
    blog_post = blog_comment.blog_post
    user = blog_comment.user
    unless blog_post.user == user #don't send a notification to myself
      data = {'blog_post_id' => blog_post.id.to_s,'blog_comment_id' => blog_comment.id.to_s, 'subject' => "[#{blog_post.title}] Nuovo commento di #{user.fullname}"}
      msg = "#{user.fullname} ha inserito un nuovo commento al tuo post #{blog_post.title}<br/> Vai alla pagina di <b>#{blog_post.title}</b> per visualizzarlo."
      notification_a = Notification.new(notification_type_id: NotificationType::NEW_BLOG_COMMENT, message: msg, :url => blog_blog_post_path(blog_post.blog,blog_post), data: data)
      notification_a.save
      send_notification_to_user(notification_a,blog_post.user)
    end
  end

end
