module Admin::Controllers::Photos
  class Create
    include Admin::Action

    params do
      required(:photo).schema do
        optional(:name).filled
        optional(:comment).filled
        required(:favorite).filled
        required(:image).filled
      end
    end

    def call(params)
      if params.valid?
        params[:photo][:favorite] = params[:photo][:favorite] == '1'
        photo = Photo.new(params[:photo])
        PhotoRepository.new.create(photo)
      end
      redirect_to routes.photos_path
    end
  end
end
