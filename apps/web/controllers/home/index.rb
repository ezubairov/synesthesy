module Web::Controllers::Home
  class Index
    include Web::Action

    expose :pages

    def call(_)
      @pages = PageRepository.new.all
    end
  end
end