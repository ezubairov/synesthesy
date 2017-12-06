require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :hanami
  plugin :processing
  plugin :versions
  plugin :delete_raw

  process(:store) do |io, context|
    original = io.download

    instagram_size = resize_and_pad!(original, 293, 293)

    {original: io, thumbnail: instagram_size}
  end
end