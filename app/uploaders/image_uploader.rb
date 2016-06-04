class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :aws

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  version :thumbnail, if: :is_vehicle? do
    process resize_to_fit: [64, 64]
  end

  def is_vehicle?(picture)
    model.is_a?(Vehicle)
  end
end
