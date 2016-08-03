class Robot

  attr_accessor :orientation

  def facing f
    if [:north, :south, :east, :west].include? f
      self.orientation = f
    else
      nil
    end
  end

  def left
    self.orientation = {north: :west, south: :east, east: :north, west: :south}[self.orientation]
  end

  def right
    self.orientation = {north: :east, south: :west, east: :south, west: :north}[self.orientation]
  end
  
  def coordinates
    case self.orientation
      when :north
        {:x => 0, :y => 1}
      when :east
        {:x => 1, :y => 0}
      when :south
        {:x => 0, :y => -1}
      when :west
        {:x => -1, :y => 0}
      else
        nil
    end
  end
end