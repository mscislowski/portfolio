class ProjectsController < ApplicationController
  before_action :get_projects

  def new
  end

  def get_projects
    @projects = Project.all
  end
end
