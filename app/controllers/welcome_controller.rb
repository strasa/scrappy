class WelcomeController < ApplicationController

  def index
  end

  def main
    @projects = current_user.projects 
  end

end
