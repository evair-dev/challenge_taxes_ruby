require './main'

RSpec.describe CashRegister do
  describe '#initialize' do
    it 'convert information str in hash information' do
      cashRegister = CashRegister.new([
        "1 imported box of chocolates at 10.00",
        "1 imported bottle of perfume at 47.50"
      ])

      expect(cashRegister.products).to eq([
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
          value:47.50
        }
      ])
    end
  end
end