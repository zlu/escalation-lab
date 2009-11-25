class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :twitter_screen_name

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
