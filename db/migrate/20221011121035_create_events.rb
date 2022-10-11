class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.belongs_to :organizer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
