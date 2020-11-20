class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id


    def initialize(id:, name:, type:, db:"nil") 
        @id = id 
        @name = name 
        @type = type 
        @db = db
    end


    def self.save(name, type, db)	
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(num,db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", num).first
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2])
        
    end



end
