require './main'

RSpec.describe CashRegister do

  before(:each) do 
    @cash_register = CashRegister.new([
      "1 imported box of chocolates at 10.00",
      "1 imported bottle of perfume at 47.50"
    ])
  end 

  it 'convert information str in hash information' do

    expect(@cash_register.products).to eq([
      {
        quantity: 1,
        imported: true,
        exception: true,
        name: 'imported box of chocolates',
        value: 10.00
      },
      {
        quantity: 1,
        imported: true,
        exception: false,
        name: 'imported bottle of perfume',
        value: 47.50
      }
    ])
  end

  it 'Calculate a product tax' do
    expect(@cash_register.send(:calculate_taxes, @cash_register.products[0])).to eq(0.5)
    expect(@cash_register.send(:calculate_taxes, @cash_register.products[1])).to eq(7.15)
  end
end