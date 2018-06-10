require_relative( '../db/sql_runner' )
# calls the sql runner file to allow running of SQL requests outside of class

class Category

  attr_reader :id
  attr_accessor :category

  def initialize(options)
    # method called when creating the class instance, populates the variables
    # from information given when creating the instance.
    @id = options["id"].to_i if options["id"]
    @category = options["category"]
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
    sql = "INSERT INTO categories
      (category)
    VALUES
      ($1)
    RETURNING id"
    values = [@category]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def exhibits()
    # method for returning all exhibits of the category:
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
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|exhibit| Exhibit.new(exhibit)}
  end

  def delete()
    # method for deleting one category from the database:
    # 1. SQL code with command "DELETE" the table selected from & the selection
    # criteria.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE * FROM categories WHERE id = $1"
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
    sql = "SELECT * FROM categories"
    results = SqlRunner.run(sql)
    return results.map {|category| Category.new(category)}
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
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first)
  end

  def self.delete_all
    # method for deleting all categories from the database, the "self." denotes
    # the method is called on the class itself:
    # 1. SQL code with command "DELETE *" & the table selected from.
    # 2. run the SQL code through the sql runner for sanatised input.
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

end
