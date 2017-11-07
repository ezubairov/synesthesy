module Admin::Controllers::Photos
  class Index
    include Admin::Action

    expose :photos

    def call(_)
      @photos = PhotoRepository.new.all
    end
  end
end
