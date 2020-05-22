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

# => Delete all the entries of Customer class
  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|customer| Customer.new(star)}
    return result
  end


  # def delete_all()
  #   sql = "SELECT * FROM customers"
  #   customer_data = SqlRunner.run(sql)
  #   return Customer.map_items(customer_data)
  # end

end
