module Admin::Controllers::Photos
  class Edit
    include Admin::Action

    expose :photo

    def call(params)
      @photo = PhotoRepository.new.find(params[:id])
    end
  end
end
