class CashRegister
  attr_reader :products

  def initialize(products_raw)
    @products = format_products(products_raw)
  end

  def show_receipt

  end

  private
  def format_products(products_raw)
    products_raw.map do |product|
      products_arr = product.split
       {
        quantity: products_arr.first().to_i,
        imported: products_arr.include?('imported'),
        exception: isAnException?(product),
        name:  products_arr.slice(1, products_arr.length - 3).join(' '),
        value: products_arr.last().to_f
      }
    end
  end

  def isAnException?(product)
    all_exceptions = [
      'chocolate',
      'pill',
      'book',
    ]
    all_exceptions.each { |p_expection| return true if product.include?(p_expection) }

    false
  end

  def calculate_taxes(product)
    imported = product[:imported] ? 0.05 : 0.0
    base = product[:exception] ? 0.0 : 0.1

    return round_to_50((imported + base) * product[:quantity] * product[:value])
  end

  def round_to_50(amount)
    decimal_floor = amount.floor(1)
    last_decimal = (amount - decimal_floor)% 1
    decimal_rounded = 0.05

    decimal_rounded = 0.0 if last_decimal < 0.025
    decimal_rounded = 0.1 if last_decimal > 0.075

    return (decimal_floor + decimal_rounded).round(2)
  end
end

