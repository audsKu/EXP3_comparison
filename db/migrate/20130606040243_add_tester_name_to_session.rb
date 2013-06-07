class AddTesterNameToSession < ActiveRecord::Migration
  def up
    add_column :sessions, :tester_name, :string
  end

  def down
    remove_column :sessions, :tester_name
  end
end
