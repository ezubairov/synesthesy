module Web::Controllers::Page
  class Show
    include Web::Action

    expose :page

    def call(params)
      @page = PageRepository.new.get_by_slug(params[:slug])
    end
  end
end
