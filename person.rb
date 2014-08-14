class Person

  def initialize(name, restrictions)
    @name = name

    regex = "/"
    restrictions.each do |restriction|
      if restriction == restrictions[restrictions.length - 1]
        regex += restriction + "/i"
      else
        regex += restriction + "|"
      end
    end

    @restrictions = regex
    @stomach = []
  end

  def eat(food)
    matches = []

    food[:ingredients].each do |ingredient|
      if @restrictions.match(ingredient)
        matches.push(ingredient)
      end
    end

    if matches.length > 0
      puts "#{@name} cannot eat #{matches.join(" and ")}!!!"
      pump
      return

    elsif @stomach.length == 5
      puts "#{@name} is too full to eat #{food[:name]} right now. Make sure #{@name} is hungry first."

    else
      # split up food array to make it readable
      puts "#{@name} is eating #{food[:name]}."
      @stomach.push(food)
    end
  end

  def hungry
    puts "#{@name} is hungry!"
    @stomach = []
  end

  def pump
    puts "Pumping #{@name}'s stomach..."
    @stomach = []
  end

end