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

customer4 = Customer.new({
  'name' => 'Douglas Smart',
  'funds' => 25})

# # => Save the customer objects
customer1.save()
customer2.save()
customer3.save()
customer4.save()

# =>  Create the film objects
film1 = Film.new({
  'title' => 'Spys in Disguise',
  'price' => 10})

film2 = Film.new({
  'title' => 'Avengers: End Game',
  'price' => 25})

film3 = Film.new({
  'title' => '1917',
  'price' => 15})

film4 = Film.new({
  'title' => 'Skyfall',
  'price' => 25})

# # => Save the film objects
film1.save()
film2.save()
film3.save()
film4.save()

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

ticket4 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id})

ticket5 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id})

ticket6 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id})

ticket7 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film3.id})

ticket8 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film4.id})

ticket9 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film4.id})

# =>  Save the ticket objects
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()
ticket8.save()
ticket9.save()

binding.pry
nil
