class Step < ApplicationRecord
  belongs_to :recipe
  mount_base64_uploader :image, StepImageUploader

  validates :content, presence: true, length: {minimum: 5, maximum: 450}
  validates :step, presence: true
end
