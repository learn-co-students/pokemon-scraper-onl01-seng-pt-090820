class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(hash)
        hash.each {|k,v| self.send(("#{k}="),v)}
    end

    # Why is this a class method?
    def self.save(name, type, db)
        @db = db
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        @db.execute(sql, name, type)
    end

    def self.find(id, db)
        @db = db
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        pokemon_array = @db.execute(sql, id).flatten
        hash = {}
        hash[:id] = pokemon_array[0]
        hash[:name] = pokemon_array[1]
        hash[:type] = pokemon_array[2]
        hash[:db] = db
        # binding.pry
        new_pokemon = self.new(hash)
    end
end
