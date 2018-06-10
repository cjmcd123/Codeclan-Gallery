require_relative( '../db/sql_runner' )

class Relation

  attr_reader( :zombie_id, :victim_id, :id )

  def initialize(options)
    # method called when creating the class instance, populates the variables
    # from information given when creating the instance.
    @id = options["id"].to_i if options["id"]
    @exhibit_id = options["exhibit"]
    @category_id = options["category"]
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
    sql = "INSERT INTO relations
      (exhibit_id, category_id)
    VALUES
      ($1, $2)
    RETURNING id"
    values = [@exhibit_id, @category_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def exhibit()
    # method for returning the exhibit:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and transform it into an instance
    # of the class.
    sql = "SELECT * FROM exhibit WHERE id = $1"
    values = [@exhibit_id]
    results = SqlRunner.run(sql, values)
    return Exhibit.new(results.first)
  end

  def category()
    # method for returning the category:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first)
  end

  def delete()
    # method for deleting one relation from the database:
    # 1. SQL code with command "DELETE" the table selected from & the selection
    # criteria.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE * FROM relations WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    # method for returning all relations in the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "SELECT *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    # 3. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM relations"
    results = SqlRunner.run(sql)
    return results.map {|relation| Relation.new(relation)}
  end

  def self.find(id)
    # method for returning one relation from the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria
    # 2. passing in the value for selection
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and transform it into an instance
    # of the class.
    sql = "SELECT * FROM relations WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Relation.new(results.first)
  end

  def self.delete_all
    # method for deleting all relations from the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "DELETE *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE FROM relations"
    SqlRunner.run(sql)
  end
end
