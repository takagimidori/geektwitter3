class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  before_save :set_default_start_time

  def set_default_start_time
    self.start_time ||= Time.current
  end

  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"

end
