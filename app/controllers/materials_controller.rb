class MaterialsController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def index
  end

  def update
    @material.price = params[:material][:price]
    @material.save
    respond_with @material, location: materials_path
  end

  def create
    respond_with @material, location: materials_path
  end
end
