class Micropost < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.microposts.content.maximum}
  validate  :picture_size

  default_scope -> {order(created_at: :desc)}

  private

  def picture_size
    if picture.size > picture_size.size.megabytes
      errors.add :picture, t(".error")
    end
  end
end
