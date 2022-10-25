class CashRegister
  attr_reader :products

  def initialize(products_raw)
    @products = format_products(products_raw)
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
end

x = CashRegister.new([
  "1 imported box of chocolates at 10.00",
  "1 imported bottle of perfume at 47.50"
])

pp x.products