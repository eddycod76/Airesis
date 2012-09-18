#encoding: utf-8
class ProposalCommentsController < ApplicationController
 
  #carica la proposta
  before_filter :load_proposal
  #carica il commento
  before_filter :load_proposal_comment, :only => [:show, :edit, :update, :delete, :adestroy, :rankup, :rankdown]
  
###SICUREZZA###

  #l'utente deve aver fatto login
  before_filter :authenticate_user!, :only => [ :edit, :update, :delete, :new]
  before_filter :save_post_and_authenticate_user, :only => [:create]
  before_filter :check_author, :only => [:edit, :update, :delete]
  before_filter :already_ranked, :only => [:rankup, :rankdown]
  
  #questo metodo permette di verificare che l'utente collegato sia l'autore del commento
   def check_author
    @proposal_comment = ProposalComment.find(params[:id])
    if ! current_user.is_mine? @proposal_comment
      flash[:notice] = 'Non puoi modificare commenti che non siano i tuoi.'
      redirect_to :back
    end
   end
  
  def load_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end  
  
  def load_proposal_comment
    @proposal_comment = @proposal.comments.find(params[:id])
  end  
  
  
  
  def index
    @proposal_comments = ProposalComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proposal_comments }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proposal_comment }
    end
  end
  
  #mostra tutti i suggerimenti dati ad un contributo
  def show_all_replies
    @proposal_comment = ProposalComment.find_by_id(params[:id]) 
    @replies = @proposal_comment.replies(:order => 'created_at ASC')[0..-6]
  end

  def new
    @proposal_comment =  @proposal.comments.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proposal_comment }
    end
  end

 
  def edit

  end

 
  def create
    parent_id = params[:proposal_comment][:parent_proposal_comment_id] 
    is_reply = parent_id != nil
    post_contribute
    
    
    respond_to do |format|
      @proposal_comments = @proposal.contributes.paginate(:page => params[:page], :per_page => COMMENTS_PER_PAGE,:order => 'created_at DESC')
      @my_nickname = current_user.proposal_nicknames.find_by_proposal_id(@proposal.id)
      unless (is_reply)
        @saved = @proposal_comments.find { |comment| comment.id == @proposal_comment.id }
        @saved.collapsed = true
      end
      format.js  
      format.html { redirect_to @proposal }        
    end
    
    rescue Exception => e
      log_error(e)
      respond_to do |format|
        puts e
        flash[:error] = 'Errore durante l\'inserimento.'
        format.js   { render :update do |page|
                        if (is_reply)
                          flash[:error] = @proposal_comment.errors.full_messages.join(",")
                          page.replace_html parent_id.to_s + "_reply_area_msg", :partial => 'layouts/flash', :locals => {:flash => flash}
                        else
                          page.replace_html "flash_messages", :partial => 'layouts/flash', :locals => {:flash => flash}
                          page.replace "proposalNewComment", :partial => 'proposal_comments/proposal_comment', :locals => {:proposal_comment => @proposal_comment}
                        end
                      end
                    }
      end
  end


  def update
    respond_to do |format|
      if @proposal_comment.update_attributes(params[:proposal_comment])
        flash[:notice] = 'Il tuo commento è stato aggiornato con successo.'
        format.html { redirect_to(@proposal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proposal_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def delete
    @proposal_comment.destroy

    respond_to do |format|
      flash[:notice] = 'Commento eliminato.'
      format.js
      format.html { redirect_to @proposal }
      format.xml  { head :ok }
    end
  end
  
   def adestroy     
    @proposal_comment.logical_delete
    @proposal_comment.destroy
    @proposal_comments = @proposal.comments.paginate(:page => params[:page],:per_page => COMMENTS_PER_PAGE, :order => 'created_at DESC')
    
    respond_to do |format|      
        flash[:notice] = 'Il commento è stato cancellato'
        format.js   { render :update do |page|
                        page.replace_html "flash_messages_comments", :partial => 'layouts/flash', :locals => {:flash => flash}
                        page.replace_html "proposalCommentsContainer", :partial => "proposals/comments"                                          
                      end
                    }
        format.html { redirect_to @proposal }
    end
  end
  
  
   def rankup 
    rank 1
  end
  
  def rankdown
    rank 3
  end
  
  
  protected
  
  def save_post_and_authenticate_user
    if (!current_user)
      session[:proposal_comment] = params[:proposal_comment]
      session[:proposal_id] = params[:proposal_id]
      flash[:info] = t('login_to_post_contribute')
      respond_to do |format|
        format.js { render :update do |page|
                      page.redirect_to new_user_session_path
                    end
        }
      end
    end
  end
  
  
  def rank(rank_type)
    if @my_ranking
      @ranking = @my_ranking
    else
      @ranking = ProposalCommentRanking.new
      @ranking.user_id = current_user.id
      @ranking.proposal_comment_id = params[:id]
    end
    @ranking.ranking_type_id = rank_type
    
    
    respond_to do |format|
      if @ranking.save
        flash[:notice] = t(:proposal_comment_rank_registered)
        format.js { render :update do |page|                    
                    page.replace_html "flash_messages_comment_#{params[:id]}", :partial => 'layouts/flash', :locals => {:flash => flash}
                    page.replace_html "rankingpanelcontainer#{params[:id]}", :partial => 'proposal_comments/ranking_panel', :locals => {:comment => @proposal_comment}
                    end
                  }
        format.html { redirect_to @proposal }
      else        
        flash[:notice] = t(:error_on_proposal_comment_rank)
        format.js { render :update do |page|
                    page.replace_html "flash_messages_comment_#{params[:id]}", :partial => 'layouts/flash', :locals => {:flash => flash}
                    end
                  }       
        format.html { redirect_to @proposal }
      end
    end
  end
  
  #viene eseguita prima della registrazione della valutazione dell'utente.
  #se un utente ha già valutato la proposta ed essa non è più stata modifica successivamente
  #allora l'operazione viene annullata e viene mostrato un messagio di errore.
  def already_ranked
    my_ranking = ProposalCommentRanking.find_by_user_id_and_proposal_comment_id(current_user.id,params[:id])
    my_rank = my_ranking.ranking_type_id if my_ranking
    if my_rank && my_ranking.updated_at > @proposal_comment.updated_at
      flash[:notice] = t(:error_proposal_comment_already_ranked)
      respond_to do |format|     
      format.js { render :update do |page|
                     page.replace_html "flash_messages_comment_#{params[:id]}", :partial => 'layouts/flash', :locals => {:flash => flash}
                  end                  
                  }
      format.html {
        redirect_to proposal_path(params[:proposal_id])
       }
      end
    else
      return true
    end
  end
  
  
end
