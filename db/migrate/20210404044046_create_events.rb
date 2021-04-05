class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title,null: false
      t.text :content,null: false
      t.integer :worktime
      t.datetime :start_time
      t.timestamps
    end
  end
end
