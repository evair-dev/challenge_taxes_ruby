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

  it 'get the correct rounded number' do
    expect(@cash_register.send(:round_to_50, 1.22)).to eq(1.20)
    expect(@cash_register.send(:round_to_50, 1.24)).to eq(1.25)
    expect(@cash_register.send(:round_to_50, 1.28)).to eq(1.30)
  end

  it 'show reciept' do
    expect(@cash_register.show_receipt).to eq([
      '1 imported box of chocolates: 10.50',
      '1 imported bottle of perfume: 54.65',
      'Sales Taxes: 7.65',
      'Total: 65.15'
    ])
  end
end