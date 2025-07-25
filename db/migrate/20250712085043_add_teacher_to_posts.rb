class AddTeacherToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :teacher_id, :integer
  end
end
