require_relative 'robot'

class Simulator

  def initialize
    @robot = Robot.new
  end

  def execute c
    command, args = c.split(" ")
    case command.downcase.to_sym
      when :place
        x,y,facing = args.split(",")
        set_place x,y
        set_facing facing
        if !placed?
          [true, "Requires to initialize Place first"]
        end
      when :move
        unless placed?
          [true, "Requires to initialize Place first"]
        else
          move
        end
      when :left
        unless placed?
          [true, "Requires to initialize Place first"]
        else
          left
        end
      when :right
        unless placed?
          [true, "Requires to initialize Place first"]
        else
          right
        end
      when :report
        unless placed?
          [true, "Requires to initialize Place first"]
        else
          return "Output: #{[@position[:x], @position[:y], @facing].join(",").upcase}"
        end
      else
        [true, "Command not found"]
    end
  end

  def set_place x,y
    place x.to_i, y.to_i
  end

  def set_facing f
    facing f.downcase.to_sym
  end

  def placed?
    if @position.nil?
      false
    else
      true
    end
  end

  def valid_facing?
    if @facing.nil?
      false
    else
      true
    end
  end

  def move
    @position = {x: @position[:x] + @robot.coordinates[:x], y: @position[:y] + @robot.coordinates[:y]}
  end

  def left
    @facing = @robot.left
  end

  def right
    @facing = @robot.right
    
  end

  def coordinates
    @robot.coordinates
  end

  
  private

  def place x,y
    @position = {x: x, y: y} if valid_coords(x, y)
  end

  def facing f
    @facing = @robot.facing f
  end

  def valid_coords(x, y)
    (x >= 0 && x <= 4 && y >= 0 && y <= 4)
  end
end
