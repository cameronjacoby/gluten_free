require './person'

class Vegetarian < Person

  def initialize(name)
    super(name, ["meat"])
  end

end