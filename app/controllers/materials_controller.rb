class MaterialsController < ApplicationController
  respond_to :html

  def index
    @materials = Material.all
  end

  def update
    material = Material.find(params[:id])
    material.price = params[:material][:price]
    material.save
    respond_with material, location: materials_path
  end

  def create
    material = Material.create(name: params[:material][:name], price: params[:material][:price])
    respond_with material, location: materials_path
  end
end
