require_relative( '../db/sql_runner' )
# calls the sql runner file to allow running of SQL requests outside of class

class Exhibit

  attr_reader :id
  attr_accessor :title, :year, :artist_id, :type_id, :url

  def initialize(options)
    # method called when creating the class instance, populates the variables
    # from information given when creating the instance.
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @year = options["year"]
    @artist_id = options["artist_id"]
    @type_id = options["type_id"]
    @url = options["url"]
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
      (title, year, artist_id, type_id, url)
    VALUES
      ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@title, @year, @artist_id, @type_id, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE exhibits SET
      (title, year, artist_id, type_id, url) =
      ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@title, @year, @artist_id, @type_id, @url, @id]
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
    sql = "SELECT name FROM artists WHERE id = $1"
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
    sql = "SELECT type FROM types WHERE id = $1"
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
    sql = "SELECT categories.* FROM categories
    INNER JOIN relations
    ON categories.id = relations.category_id
    WHERE relations.exhibit_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|category| Category.new(category)}
  end

  def delete()
    # method for deleting one category from the database:
    # 1. SQL code with command "DELETE" the table selected from & the selection
    # criteria.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE FROM exhibits WHERE id = $1"
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
    sql = "SELECT * FROM exhibits ORDER BY id"
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

  def self.filter_by_artist(id)
    # method for returning the exhibits relating to a particular artist:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM exhibits WHERE artist_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|exhibit| Exhibit.new(exhibit)}
  end

  def self.filter_by_type(id)
    # method for returning the exhibits relating to a particular type:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM exhibits WHERE type_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|exhibit| Exhibit.new(exhibit)}
  end

  def self.filter_by_category(id)
    # method for returning the exhibits relating to a particular category:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # note this SQL code will use an INNER JOIN as the relationship between
    # exhibits & categories is many-to-many
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT exhibits.* FROM exhibits
    INNER JOIN relations
    ON exhibits.id = relations.exhibit_id
    WHERE relations.category_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map {|exhibit| Exhibit.new(exhibit)}
  end

end
