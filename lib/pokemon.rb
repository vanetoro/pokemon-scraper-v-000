# require 'pry'
class Pokemon
  attr_accessor  :id, :name, :type, :db

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    poke =   db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    binding.pry

  end

  def alter_hp(new_hp)
      db.execute("SELECT hp FROM pokemon WHERE = ?", @id)
  end

end
