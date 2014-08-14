require './person'

class GlutenFree < Person

  def initialize(name)
    super(name, ["gluten"])
  end

end