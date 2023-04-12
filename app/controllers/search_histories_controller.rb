class SearchHistoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @search_histories = SearchHistory.order(count: :desc, created_at: :desc).limit(nil)
  end
  
  def trends
    @top_searches = current_user.search_histories.order(count: :desc).limit(nil)
    respond_to do |format|
      format.html
      format.json { render json: @top_searches }
    end
  end


  def analytics
    @top_searches = current_user.search_histories.order(count: :desc, created_at: :desc).limit(nil)
  end


end
