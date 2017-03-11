class ContentController < ApplicationController
  include HighVoltage::StaticPage

  def show
    @projects = Project.all

  end
  def projects
    @projects = Project.all
  end
end
