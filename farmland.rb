
class Farm

  def initialize
    puts "=" * 30
    puts "Hello Headmaster Farmer"
    puts "=" * 30
    farm_menu

  end

  def farm_menu
    loop do
      puts "Please select one of these fine options to manage your farm better"
      puts "Press 1 to check the status of your fields"
      puts "Press 2 to check the amount of food you have collected"
      puts "Press 3 add a new field"
      puts "Press 4 to harvest the fields"
      puts "Press 5 to relax"
      puts "Press 6 to exit"
      farm_choice
    end
  end

  def farm_choice
    print "Make your selection ===> "
    user_selection = gets.chomp.to_i
    if user_selection == 1
      check_status
    elsif user_selection == 2
      check_stock
    elsif user_selection == 3
      add_field
    elsif user_selection == 4
      harvest_time
    elsif user_selection == 5
      relax
    elsif user_selection == 6
      puts "It was a pleasure working with you today, see you next time"
      exit!
    else
      puts "I didn't quite understand that, could you input the number again?"
      puts "press any key to continue"
      gets
    end
  end

  def check_status
    Field.all
  end

  def check_stock
    Field.stock
  end

  def add_field
    puts "What type of field would you like?"
    type = gets.chomp.to_s
    puts "How many hectares is the field?"
    size = gets.chomp.to_i
    puts "What is the yield of the new field?"
    yielding = gets.chomp.to_i
    Field.create_field(type, size, yielding)
  end

  def harvest_time
    food = Field.harvest
    puts "=" * 20
    puts "You harvested #{food} food"
    puts "=" * 20
  end

  def relax
    puts "========== RELAX =========="
    puts "Rocking back and forth in your rickety rocking chair..."
    puts Field.sentencer
    puts "=========== END ==========="
  end


end






class Field

  @@all_fields = []
  @@stock = 0

  def initialize(type, size, yielding)
    @type = type
    @size = size
    @yielding = yielding
  end

  def self.create_field(type, size, yielding)
    new_field = Field.new(type, size, yielding)
    @@all_fields << new_field
    return new_field
  end

  def self.all
    puts "========= LIST OF FIEEELLLLDS ========="
    id = 0
    @@all_fields.each do |field|
      id += 1
      puts "Field #{id}   type: #{field.type}   size: #{field.size} hectares    yield: #{field.yielding}"
    end
    puts "   ========= END OF LIST ========="
    # return @@all_fields.inspect
  end

  def self.stock
    puts "-" * 40
    puts "====== You currently have #{@@stock} food ======"
    puts "-" * 40
  end

  def self.total_hectares
    hectares = 0
    @@all_fields.each do |field|
      hectares += field.size
    end
    @@stock += hectares
    return hectares
  end

  def self.harvest
    tots_food = 0
    @@all_fields.each do |field|
      tots_food += (field.yielding * field.size)
    end
    @@stock += tots_food
    return tots_food
  end

  def type
    @type
  end

  def size
    @size
  end

  def yielding
    @yielding
  end


  def self.sentencer
    gets.chomp
    if @@all_fields.count == 0
      puts "You look out you see a barren patch of land, interrupted only by a dustball rolling by. Time to get off your lazy ass and do some farming!!!"
    else
      s1 = @@all_fields.sample
      s2 = @@all_fields.sample
      sample_1 = s1.type
      sample_2 = s2.type
      a_1 = "You look out over your land appreciating the hard work you've done with your #{sample_1} field"
      a_2 = "Your eyes pass over your #{sample_1} field, both looking forward to and dreading the harvest to come"
      a_array = [a_1, a_2]
      b_1 = "You crack open a beer, then another, and another and another. You wonder if the #{sample_2} field could be converted to a beer field, but that's ridiculous, how could a crop be converted to beer?"
      b_2 = "Looking at the #{sample_2} field, you're reminded of your spouse, was it really a good idea to sell your house, leave your family and come out here to farm?"
      b_array = [b_1, b_2]
      last_1 = "Time to get back to some farmin"
      last_2 = "Refreshed after a good sittin, you feel ready for more farmin"
      last_3 = "Feeling restless and unproductive, you are eager to jump back into farm work"
      last_array = [last_1, last_2, last_3]
      if @@all_fields.count == 1
        puts a_array.sample
        gets.chomp
        puts last_array.sample
      else
        puts a_array.sample
        gets.chomp
        puts b_array.sample
        gets.chomp
        puts last_array.sample
      end
    end
  end

end





billy_farm = Farm.new
