class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date_time
      t.string :venue

      t.timestamps
    end
  end
end
