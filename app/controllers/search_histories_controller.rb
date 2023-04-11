class SearchHistoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @search_histories = SearchHistory.order(count: :desc, created_at: :desc).limit(10)
  end
  
  def trends
    @top_searches = SearchHistory.order(count: :desc).limit(10)
  end

end
