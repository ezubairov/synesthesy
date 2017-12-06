class PhotoRepository < Hanami::Repository
  prepend ImageUploader.repository(:image)

  def all_newest_first
    photos.order { created_at.desc }.to_a
  end
end
