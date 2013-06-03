class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.references :session
      t.timestamps
    end
  end
end
