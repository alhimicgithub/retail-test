rails generate scaffold Product code:string name:string price:float
rails generate scaffold Rule name:string product_number:float product:references value:float measurment:string
rails generate scaffold Checkout number:string
rails generate model CheckoutProduct checkout:references product:references value:float
rails generate model CheckoutRule checkout:references rule:references discount_value:float

