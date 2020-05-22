require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require ('pry')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

# => Create the customers
customer1 = Customer.new({
  'name' => 'Keith Campbell',
  'funds' => 100})

customer2 = Customer.new({
  'name' => 'Ellie Campbell',
  'funds' => 150})

customer3 = Customer.new({
  'name' => 'Gregor Campbell',
  'funds' => 10})

# # => Save the customer objects
customer1.save()
customer2.save()
customer3.save()

# =>  Create the film objects
film1 = Film.new({
  'title' => 'Spys in Disguise',
  'price' => 10})

film2 = Film.new({
  'title' => 'Avengers: End Game',
  'price' => 25})

# # => Save the film objects
film1.save()
film2.save()

# =>  Create the tickets object for film1
ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id})

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id})

ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film1.id})

# => Ticket objects for film2
ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id})

ticket5 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id})

ticket6 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id})

# =>  Save the ticket objects
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()

binding.pry
nil
