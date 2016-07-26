class Robot

  attr_accessor :facing
  
  def coordinates coord
    case coord
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

  def orientation facing
    if [:north, :south, :east, :west].include? facing
      case facing
        when :north
          {left: :west, right: :east}
        when :south
          {left: :east, right: :west}
        when :east
          {left: :north, right: :south}
        when :west
          {left: :south, right: :north}
        else
          nil
      end
    else
      nil
    end
  end

  def commands command
    if [:move, :left, :right, :report].include? command
      true
    else
      false
    end
  end
end