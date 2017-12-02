module Web::Controllers::Gallery
  class Index
    include Web::Action

    expose :photos

    def call(_)
      @photos = PhotoRepository.new.all
    end
  end
end
