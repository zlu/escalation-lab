class AddExtensionToAgent < ActiveRecord::Migration
  def self.up
    add_column :agents, :extension, :string
  end

  def self.down
    remove_column :agents, :extension
  end
end
