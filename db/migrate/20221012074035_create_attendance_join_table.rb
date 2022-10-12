class CreateAttendanceJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :attendance do |t|
      t.references :attendee, foreign_key: { to_table: :users}
      t.references :event

      t.timestamps
    end
  end
end
