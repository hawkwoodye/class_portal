class AddAdminIdToCourses < ActiveRecord::Migration
  def change
	add_column :courses, :admin_id, :integer
	add_index :courses, :admin_id
  end
end
