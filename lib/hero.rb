class Hero
  attr_reader :strength, :health

  def initialize(attr = {})
    @strength = attr.fetch(:strength, 3)
    @health = 10
  end
end
