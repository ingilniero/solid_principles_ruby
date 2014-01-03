class BlackKingBar
  include Actionable

  def action_attributes
    @attribute = :magic
    @difficulty = :magic_resistance
  end

end
