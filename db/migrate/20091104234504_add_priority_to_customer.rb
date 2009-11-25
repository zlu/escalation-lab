class AddPriorityToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :priority, :integer
  end

  def self.down
    remove_column :customers, :priority
  end
end
