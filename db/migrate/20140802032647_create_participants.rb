class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :full_name
      t.string :email
      t.string :mobile
      t.references :event, index: true

      t.timestamps
    end
  end
end
