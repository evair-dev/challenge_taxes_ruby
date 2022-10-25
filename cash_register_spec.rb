require "./cash_register"

RSpec.describe CashRegister do

  before(:each) do 
    @cash_register = CashRegister.new([
      "1 imported box of chocolates at 10.00",
      "1 imported bottle of perfume at 47.50"
    ])

    @cash_register_1 = CashRegister.new([
      "2 book at 12.49",
      "1 music CD at 14.99",
      "1 chocolate bar at 0.85"
    ])

    @cash_register_2 = CashRegister.new([
      "1 imported bottle of perfume at 27.99",
      "1 bottle of perfume at 18.99",
      "1 packet of headache pills at 9.75",
      "3 imported boxes of chocolates at 11.25"
    ])
  end 

  it "convert information str in hash information" do

    expect(@cash_register.products).to eq([
      {
        quantity: 1,
        imported: true,
        exception: true,
        name: "imported box of chocolates",
        value: 10.00
      },
      {
        quantity: 1,
        imported: true,
        exception: false,
        name: "imported bottle of perfume",
        value: 47.50
      }
    ])
  end

  it "Calculate a product tax" do
    expect(@cash_register.send(:calculate_taxes, @cash_register.products[0])).to eq(0.5)
    expect(@cash_register.send(:calculate_taxes, @cash_register.products[1])).to eq(7.15)
  end

  it "get the correct rounded number" do
    expect(@cash_register.send(:round_to_50, 1.20)).to eq(1.20)
    expect(@cash_register.send(:round_to_50, 1.24)).to eq(1.25)
    expect(@cash_register.send(:round_to_50, 1.28)).to eq(1.30)
  end

  it "show reciept" do
    expect(@cash_register.show_receipt).to eq([
      "1 imported box of chocolates: 10.50",
      "1 imported bottle of perfume: 54.65",
      "Sales Taxes: 7.65",
      "Total: 65.15"
    ])

    expect(@cash_register_1.show_receipt).to eq([
      "2 book: 24.98",
      "1 music CD: 16.49",
      "1 chocolate bar: 0.85",
      "Sales Taxes: 1.50",
      "Total: 42.32"
    ])

    expect(@cash_register_2.show_receipt).to eq([
      "1 imported bottle of perfume: 32.19",
      "1 bottle of perfume: 20.89",
      "1 packet of headache pills: 9.75",
      "3 imported boxes of chocolates: 35.55",
      "Sales Taxes: 7.90",
      "Total: 98.38"
    ])
  end
end