#encoding: utf-8
module NotificationHelper
  
  #invia una notifica ad un utente.
  #se l'utente ha bloccato il tipo di notifica allora non viene inviata
  #se l'utente ha abilitato anche l'invio via mail allora viene inviata via mail TODO
  def send_notification_to_user(notification,user)
     if (!user.blocked_notifications.include?notification.notification_type) #se il tipo nnon è bloccato
      alert = UserAlert.new(:user_id => user.id, :notification_id => notification.id, :checked => false);
      alert.save #invia la notifica
      if (user.email_alerts)
        ResqueMailer.notification(alert.id).deliver
      end
      
      return true
     end
     return false
  end
  
  
  #invia le notifiche quando un utente valuta la proposta
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_user_valutate_proposal(proposal_ranking)
    proposal = proposal_ranking.proposal
    msg = "La tua proposta <b>"+proposal.title+"</b> ha ricevuto una nuova valutazione!";
      notification_a = Notification.new(:notification_type_id => 20,:message => msg, :url => proposal_path(proposal))
      notification_a.save
    proposal.users.each do |user|
      if (user != proposal_ranking.user)
        send_notification_to_user(notification_a,user)
      end
    end
    msg = "La proposta <b>"+proposal.title+"</b> ha ricevuto una nuova valutazione!";
    notification_b = Notification.create(:notification_type_id => 21,:message => msg,:url => proposal_path(proposal))
    proposal.partecipants.each do |user|
      if ((user != proposal_ranking.user) && (!proposal.users.include?user))
        send_notification_to_user(notification_b,user)
      end
    end
    
  end

  #invia le notifiche quando un utente inserisce un commento alla proposta
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_user_comment_proposal(comment)
    proposal = comment.proposal
    comment_user = comment.user
    nickname = ProposalNickname.find_by_user_id_and_proposal_id(comment_user.id,proposal.id)
    name = nickname || comment_user.fullname
    msg = "<b>#{name}</b> ha inserito un commento alla tua proposta <b>"+proposal.title+"</b>!";
      notification_a = Notification.new(:notification_type_id => 5,:message => msg, :url => proposal_path(proposal) +"#comment"+comment.id.to_s)
      notification_a.save
    proposal.users.each do |user|
      if (user != comment_user)
        send_notification_to_user(notification_a,user)
      end
    end
    
    msg = "<b>#{name}</b> ha inserito un commento alla proposta <b>"+proposal.title+"</b>!";
    notification_b = Notification.create(:notification_type_id => 1,:message => msg,:url => proposal_path(proposal) +"#comment"+comment.id.to_s)
    proposal.partecipants.each do |user|
      if ((user != comment_user) && (!proposal.users.include?user))
        send_notification_to_user(notification_b,user)
      end
    end
    
  end
  
  
  #invia le notifiche quando un una proposta viene modificata
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_proposal_has_been_updated(proposal)
    msg = "La proposta <b>" + proposal.title + "</b> è stata aggiornata!"
    notification_a = Notification.new(:notification_type_id => 2,:message => msg, :url => proposal_path(proposal))
    notification_a.save
    proposal.partecipants.each do |user|
      if (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end    
  end
  
   #invia le notifiche quando viene scelta una data di votazione per la proposta
  #le notifiche vengono inviate ai creatori e ai partecipanti alla proposta
  def notify_proposal_waiting_for_date(proposal)
    nickname = ProposalNickname.find_by_user_id_and_proposal_id(current_user.id,proposal.id)
    name = nickname || current_user.fullname
    msg = "#{name} ha scelto la data di votazione per la proposta <b>" + proposal.title + "</b>!"
    notification_a = Notification.new(:notification_type_id => 4,:message => msg, :url => proposal_path(proposal))
    notification_a.save
    proposal.partecipants.each do |user|
      if (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end    
  end
  
    #invia le notifiche quando la proposta è pronta per essere messa in votazione
   #le notifiche vengono inviate ai creatori  della proposta
  def notify_proposal_ready_for_vote(proposal)
    msg = "La proposta <b>" + proposal.title + "</b> ha passato la fase di valutazione ed è ora in attesa che tu scelga quando votarla."
    notification_a = Notification.new(:notification_type_id => 6,:message => msg, :url => proposal_path(proposal))
    notification_a.save
    proposal.users.each do |user|
      if (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end    
  end
  
     #invia le notifiche quando la proposta è stata rigettata
   #le notifiche vengono inviate ai partecipanti
  def notify_proposal_rejected(proposal)
    msg = "La proposta <b>" + proposal.title + "</b> è stata rigettata dagli utenti, spiacente."
    notification_a = Notification.new(:notification_type_id => 4,:message => msg, :url => proposal_path(proposal))
    notification_a.save
    proposal.users.each do |user|
      if (user != current_user)
        send_notification_to_user(notification_a,user)
      end
    end    
  end
  
  #invia una notifica ai portavoce del gruppo che l'utente corrente ha effettuato una richiesta di partecipazione
  def notify_user_asked_for_partecipation(group)
    msg = "L'utente <b>#{current_user.fullname}</b> ha richiesto di partecipare al gruppo <b>#{group.name}</b>."
    notification_a = Notification.new(:notification_type_id => 12,:message => msg, :url => group_path(group))
    notification_a.save
    group.portavoce.each do |user|
      if (user != current_user)
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
      if ((user != post_user) && (!sent_users.include?user))
        if send_notification_to_user(notification_a,user)
          sent_users << user
        end
      end
    end
    
    blog_post.groups.each do |group|
      msg = "<b>"+ post_user.fullname + "</b> ha inserito un nuovo post nella pagina del gruppo <b>"+group.name+"</b>!";
      #notifica a chi segue il gruppo
      notification_b = Notification.create(:notification_type_id => 8,:message => msg,:url => blog_blog_post_path(blog_post.blog, blog_post))
      group.followers.each do |user|
        if ((user != post_user) && (!sent_users.include?user))
          if send_notification_to_user(notification_b,user)
            sent_users << user
          end
        end
      end
      
      #notifica a chi partecipa al gruppo
      notification_b = Notification.create(:notification_type_id => 9,:message => msg,:url => blog_blog_post_path(blog_post.blog, blog_post))
      group.partecipants.each do |user|
        if ((user != post_user) && (!sent_users.include?user))
          if send_notification_to_user(notification_b,user)
            sent_users << user
          end
        end
      end
    end    
  end
end
