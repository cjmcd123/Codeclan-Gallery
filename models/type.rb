require_relative( '../db/sql_runner' )
# calls the sql runner file to allow running of SQL requests outside of class

class Type

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    # method called when creating the class instance, populates the variables
    # from information given when creating the instance.
    @id = options["id"].to_i if options["id"]
    @type = options["type"]
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
    sql = "INSERT INTO types
      (type)
    VALUES
      ($1)
    RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def exhibits()
    # method for returning all exhibits of the type:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria.
    # 2. pass in the value for selection.
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM exhibits WHERE type_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|type| Type.new(type)}
  end

  def delete()
    # method for deleting one type from the database:
    # 1. SQL code with command "DELETE" the table selected from & the selection
    # criteria.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE * FROM types WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    # method for returning all types in the database, the "self." denotes the
    # method is called on the class itself:
    # 1. SQL code with command "SELECT *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    # 3. return the the data from the database and map it to an array of class
    # instances.
    sql = "SELECT * FROM types"
    results = SqlRunner.run(sql)
    return results.map {|type| Type.new(type)}
  end

  def self.find(id)
    # method for returning one type from the database, the "self." denotes the
    # method is called on the class itself:
    # 1. SQL code with command "SELECT", the table selected from & the selection
    # criteria
    # 2. passing in the value for selection
    # 3. run the SQL code with the values through the sql runner for sanatised
    # input.
    # 4. return the the data from the database and transform it into an instance
    # of the class.
    sql = "SELECT * FROM types WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Type.new(results.first)
  end

  def self.delete_all
    # method for deleting all types from the database, the "self." denotes the
    # method is called on the class itself:
    # 1. SQL code with command "DELETE *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE FROM types"
    SqlRunner.run(sql)
  end

end
