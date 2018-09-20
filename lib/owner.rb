class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader  :species

  @@all=[]

  def initialize(name="")
    @name = name
    @@all << self
    @species = "human"
    @pets = {
      fishes:[],
      dogs:[],
      cats:[]
    }
  end

  def self.all
    @@all
  end

  def buy_fish(name)
    fishie = Fish.new(name)
    @pets[:fishes] << fishie
  end

  def buy_cat(name)
    kittie = Cat.new(name)
    @pets[:cats] << kittie
  end

  def buy_dog(name)
    doggo = Dog.new(name)
    @pets[:dogs] << doggo
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species,pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def self.count
    @@all.length
  end

  def list_pets
    rtn_string = "I have "
    @pets.each do |species,pet|
      if species == :fishes
        rtn_string += "#{pet.count} fish, "
      elsif species == :dogs
        rtn_string += "#{pet.count} dog(s), "
      elsif species == :cats
        rtn_string += "and #{pet.count} cat(s)."
      end
    end
    rtn_string
  end

end
