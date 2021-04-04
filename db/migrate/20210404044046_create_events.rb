class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :content,null: false
      t.datetime :start_time
      t.timestamps
    end
  end
end
