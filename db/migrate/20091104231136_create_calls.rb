class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.string :channel
      t.string :conf_guid
      t.string :state
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :calls
  end
end
