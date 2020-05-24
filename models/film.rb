require_relative('../db/sql_runner.rb')

class Film

attr_reader :id
attr_accessor :title, :price

# =>  Constructor
  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end

# => Create the db by adding films
  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2)
        RETURNING id"
    values =[@title, @price]
    film = SqlRunner.run(sql,values).first
    @id = film['id'].to_i
  end

# => update the film db
  def update()
    sql = "UPDATE films SET (title, price) VALUES ($1, $2)
          RETURNING id"
    values = [@title, @price,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
# =>  not returning an array, just deleting the film from the db
  end

# =>  Display all the customers for a particular film
  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customer_id WHERE film_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

# =>  Delete all the entries from the film class
  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end

  # def delete_all()
  #   sql = "SELECT * FROM films"
  #   film_data = SqlRunner.run(sql)
  #   return Film.map_items(film_data)
  # end

# => Display the films each customer has seen

  # def customer()
  #   sql = "SELECT customer.*
  #         FROM "
  #
  # end

end
