class DashboardController < ApplicationController

  before_action :require_login

  def index
  	@my_article_count = Article.count_article(current_user)
  	@article_count = Article.count_article
  	@users = User.all
  end

end
