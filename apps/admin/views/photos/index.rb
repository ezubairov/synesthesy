module Admin::Views::Photos
  class Index
    include Admin::View

    def link_to_photo(photo)
      link_to routes.edit_photo_path(photo.id) do
        html.img(src: photo.image[:thumbnail].url)
      end
    end
  end
end
