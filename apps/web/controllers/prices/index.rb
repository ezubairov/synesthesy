module Web::Controllers::Prices
  class Index
    include Web::Action

    expose :prices

    def call(_)
      @prices = PriceRepository.new.all
    end
  end
end
