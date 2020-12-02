class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    pokemon = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
    
  def self.find(id, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: attributes[0], name: attributes[1], type: attributes[2], db: db)
  end
  
end