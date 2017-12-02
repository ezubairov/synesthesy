module Admin::Controllers::Prices
  class Destroy
    include Admin::Action

    def call(params)
      PriceRepository.new.delete(params[:id])
      redirect_to routes.prices_path
    end
  end
end
