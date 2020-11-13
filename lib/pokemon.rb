require"pry"
class Pokemon

  attr_accessor :id, :name, :type
  attr_reader :db

  def initialize(name:, type:, db: "nil", id:)
    @id = id
    @name = name
    @type = type
    @db = db
    self
  end

  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS db (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        type TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon
    WHERE id=?", id).first
    self.new(id: row[0], name: row[1], type: row[2])
  end


end
