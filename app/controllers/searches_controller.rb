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
      search_history = current_user.search_histories.find_or_initialize_by(query: segment)
      if search_history.new_record?
        search_history.count = 1
      else
        search_history.count += 1
      end
      search_history.save
    end

    flash.now[:success] = "Search added successfully!" if @query.present?
    @last_search = current_user.search_histories.order(created_at: :desc).first
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end


  def last_search
    @last_search = current_user.search_histories.order(created_at: :desc).first
  end
end
