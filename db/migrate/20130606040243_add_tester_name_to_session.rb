class AddTesterNameToSession < ActiveRecord::Migration
  def up
    add_column :comparisons, :tester_name, :string
  end

  def down
    remove_column :comparisons, :tester_name
  end
end
