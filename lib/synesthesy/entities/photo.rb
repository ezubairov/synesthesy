require_relative '../../../config/initializers/shrine'
require_relative '../uploaders/image_uploader'

class Photo < Hanami::Entity
  include ImageUploader[:image]
end
