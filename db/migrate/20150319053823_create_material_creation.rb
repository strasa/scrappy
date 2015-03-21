class CreateMaterialCreation < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.decimal :price 
    end
  end
end
