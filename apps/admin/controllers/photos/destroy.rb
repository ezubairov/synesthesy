module Admin::Controllers::Photos
  class Destroy
    include Admin::Action

    def call(params)
      PhotoRepository.new.delete(params[:id])
      redirect_to routes.photos_path
    end
  end
end
