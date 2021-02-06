class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize name
    @name = name
    @species = "human"

    @@all << self
  end
  
  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.filter { |el| el.owner == self }
  end

  def dogs
    Dog.all.filter { |el| el.owner == self }
  end

  def buy_cat cat_name
    cat_name = Cat.new(cat_name, self)
  end

  def buy_dog dog_name
    dog_name = Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map { |el| el.mood = "happy" }
  end

  def feed_cats
    cats.map { |el| el.mood = "happy" }
  end

  def sell_pets
    cats.map { |el| el.mood = "nervous" }
    dogs.map { |el| el.mood = "nervous" }
    cats.map { |el| el.owner = nil }
    dogs.map { |el| el.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end