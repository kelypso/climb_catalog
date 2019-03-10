class ClimbCatalog::Destination 
  
  attr_accessor :name, :type, :description
  
  @@all = []
  
  def self.new_from_web#(name)
    #Climb.new.tap do |climb|
      #Scraper.get_page.each do |x, y|
        #climb.send("#{x}=", y)
      #end
    #end
    
    #self.new(
      #name.css("h3").text.strip, #name
      #name.css("h2").text.strip, #type
      #name.css("p").text.strip #description
      #)
    ClimbCatalog::Scraper.get_destinations.each do |location|
      destination = Destination.new
      destination.name = location.css("h3").text
      destination.type = location.css("h2").text
      destination.description = location.css("p").text
    end
  end
  
  def initialize(name, type, description)
    @name = name
    @type = type
    @description = description
    save
  end
  
  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_index(index)
    self.all[index]
  end
  
  def self.find_by_name(name)
   self.all[name]
  end
  
  def self.find_by_type(type)
   self.all[type]
  end
    
end