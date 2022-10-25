require "./cash_register"


def init
  puts "Welcome to the market"
  puts "Hi, describe your product, if you don't need write 'no'"
  
  
  raw = gets.chomp
  products = [raw]

  while raw != "no"
    puts "What else?"
    raw = gets.chomp
    products << raw if raw != "no"
  end


  puts "This is your reciept:"
  register = CashRegister.new(products)

  puts "-"*50
  puts register.show_receipt()
  puts "-"*50
end


init()

