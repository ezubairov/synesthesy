module Admin::Controllers::Prices
  class Edit
    include Admin::Action

    expose :price

    def call(params)
      @price = PriceRepository.new.find(params[:id])
    end
  end
end
