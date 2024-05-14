class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Automatically resize the picture to a fixed size
  process resize_to_fill: [600, 400]

  # Create different versions with specified sizes
  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :large do
    process resize_to_fit: [800, 800]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
