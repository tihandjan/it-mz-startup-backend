class RecipeImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  process :resize_to_fit => [1200, 850]

  version :thumb do
    process :resize_to_fill => [467, 350]
  end

  version :long do
    process :resize_to_fill => [467, 230]
  end

  version :square do
    process :resize_to_fill => [230, 230]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
