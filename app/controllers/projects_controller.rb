class ProjectsController < ApplicationController
  respond_to :html

  def create
    @project = current_user.projects.create(name: params[:project][:name], description: params[:project][:description])
    respond_with @project, location: main_path
  end

end
