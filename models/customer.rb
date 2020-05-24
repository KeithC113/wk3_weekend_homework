require_relative('../db/Sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

# =>  Constructor of the customer object
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options ['funds']
  end

# =>  Save the customer details to the db
  def save()
    sql = "INSERT INTO customers
          (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name,@funds]
    customer = SqlRunner.run(sql,values).first
    @id = customer['id'].to_i
  end

# => Update the customer object
  def update()
    sql = "UPDATE customers (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql,values)
# =>  Updating only, no need to return any array
  end

# =>  Delete customer from db
  def delete()
    sql = "DELETE from customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
# => Deleting customer record, nothing to return
  end

# => Display all the films a particular customer has bought ticket for
  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data)
  end

  # =>  This method returns array of tickets bought per film
  def tickets()
  sql = "SELECT * FROM tickets where film_id = $1"
  values = [@id]
  ticket_data = SqlRunner.run(sql, values)
  return ticket_data.map{|ticket| Ticket.new(ticket)}
end

# => buy a ticket, deducts price of ticket per film from customer funds
  def buy_a_ticket()
    tickets = self.tickets()
    binding.pry
    ticket_price = tickets.map{|ticket| ticket.price}
    binding.pry
    return @funds - ticket_price
  end

# => Delete all the entries of Customer class
  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|customer| Customer.new(customer)}
    return result
  end

end
