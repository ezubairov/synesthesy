module Admin::Controllers::Photos
  class Index
    include Admin::Action

    expose :photos

    def call(params)
      @photos = PhotoRepository.new.all
    end
  end
end
