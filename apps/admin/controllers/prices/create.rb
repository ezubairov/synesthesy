module Admin::Controllers::Prices
  class Create
    include Admin::Action

    params do
      required(:price).schema do
        required(:title).filled
        required(:price).filled
        optional(:additional).filled
      end
    end

    def call(params)
      if params.valid?
        params[:price][:additional] = params[:price][:additional] == '1' if params.dig(:price, :additional)
        PriceRepository.new.create(params[:price])
      end
      redirect_to routes.prices_path
    end
  end
end
