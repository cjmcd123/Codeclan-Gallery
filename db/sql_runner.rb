require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'ccgallery', host: 'localhost' })
      # ccgallery is the database hosting this program it sands for Codeclan Gallery
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
