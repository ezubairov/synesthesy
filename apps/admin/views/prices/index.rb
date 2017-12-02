module Admin::Views::Prices
  class Index
    include Admin::View

    def main_services
      @main_services ||= prices.select { |price| !price.additional }
    end

    def additional_services
      @additional_services ||= prices.select { |price| price.additional }
    end
  end
end
