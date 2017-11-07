module Web::Controllers::Home
  class Index
    include Web::Action

    expose :pages
    expose :photos

    def call(_)
      @pages = PageRepository.new.all
      @photos = PhotoRepository.new.home_page_photos
    end
  end
end