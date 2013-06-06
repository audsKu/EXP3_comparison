class AddTesterResponseToComparison < ActiveRecord::Migration
  def up
    add_column :comparisons, :tester_response, :integer
  end

  def down
    remove_column :comparisons, :tester_response
  end
end
