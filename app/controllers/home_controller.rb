class HomeController < ApplicationController
  def index
    @articles = Article.accessible_by(current_ability)
  end
end
