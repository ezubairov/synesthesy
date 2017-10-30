module Web::Controllers::Home
  class Index
    include Web::Action

    expose :pages
    expose :photos

    def call(params)
      @pages = PageRepository.new.all
      @photos = PhotoRepository.new.home_page_photos
    end
  end
end