# Technologies
ruby 3.1.2

# RUN THE PROJECT

Run this command in the root of the project:

To install gems:
```bash
  bundle install --binstubs
```


To run the project:
```bash
  ruby cash_register.rb
```


To run the tests:
```bash
  rspec cash_register_spec.rb
```

## Some considerations
1. I assume that I allways recieve the product in the format:
```bash
  (int) (imported)? (name) at (float)
```
  ** "?" means optional

2. I identify the product type depending on the name contained:  1 packet of headache pills (is a medicine beacuse is has "pills")

3. The name of the 3rd output is "3 imported box of chocolates: 35.55" but the input is "3 imported boxes of chocolates at 11.25" (box != boxes)

