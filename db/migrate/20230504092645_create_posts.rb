class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_day
      t.date :end_day
      t.boolean :allday
      t.string :schedule
      t.string :erase
      t.timestamps
    end
  end
end

