class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :happiness_rating
      t.integer :min_height
      t.integer :nausea_rating
      t.integer :tickets
      t.integer :attraction_id
      t.integer :user_id
    end
  end
end
