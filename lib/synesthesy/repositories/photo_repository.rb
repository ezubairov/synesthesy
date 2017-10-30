class PhotoRepository < Hanami::Repository
  prepend ImageUploader.repository(:image)

  def home_page_photos
    photos.where(favorite: true)
  end
end
