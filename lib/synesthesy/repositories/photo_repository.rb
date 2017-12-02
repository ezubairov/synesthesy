class PhotoRepository < Hanami::Repository
  prepend ImageUploader.repository(:image)
end
