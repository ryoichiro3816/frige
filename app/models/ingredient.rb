class Ingredient < ApplicationRecord
  attr_accessor :image_cache
  has_one_attached :image
  validates :name, presence: true, uniqueness: true, length: { maximum:160}
  validates :expiry, presence: true
  validate :number_or_amount
  # mount_uploader :image, ImageUploader
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_fill: [200, 100])
  end


  private 

  def number_or_amount
    return if amount.present? ^ number.present?

    errors.add(:number, 'か重量どちらかを入力してください')
    errors.add(:amount, 'か個数どちらかを入力してください')
  end  
end
