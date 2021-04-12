class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title,null: false
      t.text :content
      t.string :worktime
      t.datetime :start_time
      t.references :user,   foreign_key: true
      t.timestamps
    end
  end
end
