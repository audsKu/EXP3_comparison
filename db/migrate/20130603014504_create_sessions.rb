class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :tester
      t.timestamps
    end
  end
end
