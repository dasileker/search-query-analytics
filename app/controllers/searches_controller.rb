class SearchesController < ApplicationController
  before_action :authenticate_user!

  def new
    @last_search = current_user.search_histories.order(created_at: :desc).first
  end

  def create
    @query = params[:query]
    @articles = Article.where("title LIKE ?", "%#{@query}%")

    query_segments = @query.split(/\s+/)
    query_segments.each do |segment|
    search_history = current_user.search_histories.find_or_initialize_by(query: @query)
      if search_history.new_record?
        # color = "#{"red"}"
        search_history.count = 1
      else
        search_history.count += 1
      end
      search_history.save
      
      flash.now[:success] = "Search added successfully!" if @query.present?
      @last_search = current_user.search_histories.order(created_at: :desc).first
    end
  end

  def last_search
    @last_search = current_user.search_histories.order(created_at: :desc).first
  end
end
