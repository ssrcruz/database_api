class RepositoriesController < ApplicationController
  # before_action :check_logged_in, only: [:index]
  caches_action :index
  # caches_page :public
  # caches_action :index

  # def public
  #   @repositories = Repository.where(private: false).limit(10)
  #   render :index
  # end

  def index
    @repositories = Repository.find(:all)
  end

  def show
    @profile = Profile.new(params[:username])
    if @profile.username.blank?
      redirect_to root_path
    else
      @repositories = RepositoryList.new(params[:username]).repositories
    end
  end

  # private def check_logged_in
  #   redirect_to action: 'public' unless logged_in?
  # end

end
