class UpdateComparisons < ActiveRecord::Migration
  def up
    add_column :comparisons, :original_id, :integer
  end

  def down
    remove_column :comparisons, :original_id
  end
end
