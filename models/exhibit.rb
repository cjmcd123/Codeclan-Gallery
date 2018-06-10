require_relative( '../db/sql_runner' )
# calls the sql runner file to allow running of SQL requests outside of class

class Exhibit

  attr_reader :id
  attr_accessor :title, :year, :artist_id, :type_id

  def initialize(options)
    # method called when creating the class instance, populates the variables
    # from information given when creating the instance.
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @year = options["year"]
    @artist_id = options["artist_id"]
    @type_id = options["type_id"]
  end

  def save()
    # method for saving information in to the database tables:
    # 1. SQL code with command "INSERT", the fields being inserted & the
    # database to insert the data into.
    # 2. pass in the values to be inserted, seperated to allow for sanatised
    # input.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the id created by the serial field of the database table to the
    # instance of the class.
    sql = "INSERT INTO exhibits
      (title, year, artist_id, type_id)
    VALUES
      ($1, $2, $3, $4)
    RETURNING id"
    values = [@title, @year, @artist_id, @type_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE exhibits SET
      (title, year, artist_id, type_id) =
      ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@title, @year, @artist_id, @type_id, @id]
    SqlRunner.run(sql, values)
  end

  def artist_name()
    # method for returning the name of the artist as the table only saves the id:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and transform it into an instances
    # of the class.
    sql = "SELECT name FROM artist WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    answer = Artist.new(results.first)
    return answer.name
  end

  def type_name()
    # method for returning the type of exhibit as the table only saves the id:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and transform it into an instance
    # of the class.
    sql = "SELECT name FROM type WHERE id = $1"
    values = [@type_id]
    results = SqlRunner.run(sql, values)
    answer = Type.new(results.first)
    return answer.type
  end

  def categories()
    # method for returning the categories of the exhibit:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # note this SQL code will use an INNER JOIN as the relationship between
    # exhibits & categories is many-to-many
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM categories WHERE exhibit_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|exhibit| Exhibit.new(exhibit)}
  end

  def delete()
    # method for deleting one category from the database:
    # 1. SQL code with command "DELETE" the table selected from & the selection
    # criteria.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE * FROM exhibits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    # method for returning all categories in the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "SELECT *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    # 3. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM exhibits"
    results = SqlRunner.run(sql)
    return results.map {|exhibit| Exhibit.new(exhibit)}
  end

  def self.find(id)
    # method for returning one category from the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria
    # 2. passing in the value for selection
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and transform it into an instance
    # of the class.
    sql = "SELECT * FROM exhibits WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Exhibit.new(results.first)
  end

  def self.delete_all
    # method for deleting all categories from the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "DELETE *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end

end
