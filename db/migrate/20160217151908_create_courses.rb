class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :couse_number
      t.string :title
      t.text :description
      t.string :instructor
      t.date :start_date
      t.date :end_date
      t.boolean :status
      t.belongs_to :admin

      t.timestamps null: false
    end
  end

  def down
    delete_table :courses
  end
end
