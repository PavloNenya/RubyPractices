# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    # Check if there are any Service records
    unless Service.exists?
      # Delete all existing Service records to reset the primary key sequence
      Service.delete_all

      # Manually set the sequence to start from 1
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name = 'services'")

      # If no records exist, create them
      BusinessModel.all.each_with_index do |model, index|
        Service.create(name: model.name)
      end
    end

    # Load business models for display
    @business_models = BusinessModel.all
  end

  def search
    if params[:search].present?
      @business_models = BusinessModel.where("name LIKE ?", "#{params[:search]}%")
    else
      @business_models = []
    end
    render 'index'
  end
end
