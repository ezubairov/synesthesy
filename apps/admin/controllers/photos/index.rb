module Admin::Controllers::Photos
  class Index
    include Admin::Action

    expose :photos

    def call(_)
      @photos = PhotoRepository.new.all_newest_first
    end
  end
end
