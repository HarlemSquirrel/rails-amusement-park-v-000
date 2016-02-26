class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :happiness
      t.integer :height
      t.integer :nausea
      t.integer :tickets
      t.boolean :admin, default: false
    end
  end
end
