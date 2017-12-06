module Web::Controllers::Gallery
  class Index
    include Web::Action

    expose :photos

    def call(_)
      @photos = PhotoRepository.new.all_newest_first
    end
  end
end
