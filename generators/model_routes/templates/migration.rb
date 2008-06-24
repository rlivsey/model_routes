class CreateModelRoutes < ActiveRecord::Migration
  def self.up
    create_table :model_routes, :force => true do |t|
      t.column :external_path, :string
      t.column :internal_path, :string
    end
  end

  def self.down
    drop_table :model_routes
  end
end
