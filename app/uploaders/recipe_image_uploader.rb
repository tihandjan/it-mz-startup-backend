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

  version :show do
    process :resize_to_fill => [700, 420]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
     "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end

end
