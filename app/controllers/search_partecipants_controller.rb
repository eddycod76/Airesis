class SearchPartecipantsController < ApplicationController

  before_filter :load_group

  def create
    @partecipants = @group.search_partecipants.build(params[:search_partecipant]).results
    flash[:notice] = 'Ricerca eseguita. Risultati aggiornati'
    respond_to do |format|
      format.js
    end
  end

  protected

  def load_group
    @group = Group.find(params[:group_id])
  end
end