class Step < ApplicationRecord
  belongs_to :recipe
  mount_base64_uploader :image, StepImageUploader

  validates :content, presence: true
  validates :step, presence: true
end
