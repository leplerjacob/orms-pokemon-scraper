class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(row)
        pokemon = self
        @id = row[0]
        @name = row[1]
        @type = row[2]
        @db = row[3]
        pokemon
    end

    def self.save(name,type,db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        pokemon = db.execute(sql,name,type)
        # @id = @db.execute('SELECT last_insert_rowid() FROM students')[0][0]
    end

    def self.find(id, db)
        sql = 'SELECT * FROM pokemon WHERE id = ?'
        pokemon = db.execute(sql, id)[0].push(db)
        new(pokemon)
    end
end
