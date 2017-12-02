module Admin::Controllers::Prices
  class Index
    include Admin::Action

    expose :prices

    def call(_)
      @prices = PriceRepository.new.all
    end
  end
end
