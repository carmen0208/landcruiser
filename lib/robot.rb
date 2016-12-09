class WrongPositionError < Exception
end
class Robot
  MAX = 5
  MIN = 0
  def initialize x,y, facing
    @x,@y,@facing =  x, y, facing
    validate_axis?(@x,@y)
    @x = @x.to_i
    @y = @y.to_i
    @directions = ['SOUTH','WEST','NORTH','EAST']
    set_direction @facing
  end

  def left
    # p "turn right  #{@directions}, x: #{@x}, y: #{@y}"
    @directions.rotate! -1
  end
  def right
    # p "turn right  #{@directions}, x: #{@x}, y: #{@y}"
    @directions.rotate! 1
  end

  def move
    # p @directions
    case @directions[0]
      when 'NORTH'
        valid_movement(@y,MAX)
        @y += 1
      when 'SOUTH'
        valid_movement(@y,MIN)
        @y -= 1
      when 'EAST'
        valid_movement(@x,MAX)
        @x += 1
      when 'WEST'
        valid_movement(@x,MIN)
        @x -= 1
    end
    # p "move: #{@directions}, x: #{@x}, y: #{@y}"
  end

  def location
    # p "I AM HERE:  x: #{@x}, y: #{@y}, direction: #{@directions[0]}, "
    p "#{@x},#{@y},#{@directions[0]}"
  end

  private

  def valid_movement(current, code)
    raise WrongPositionError, "Hey, You would fall, I saved your ass, don't do it again" if current == code

  end

  def validate_axis? x, y
    # p x.to_i
    # p y.to_i
    raise WrongPositionError, "Coordinate must be choosen the integer beween 0 to 5" if !/\A\d+\z/.match(x) ||!/\A\d+\z/.match(y) || !x.to_i.between?(0,5) || !y.to_i.between?(0,5)
  end

  def set_direction face
    raise WrongPositionError, 'You much choose face to NORTH,SOUTH,EAST,WEST' unless @directions.include? face

    while @directions.first != face do
      @directions.rotate!

    end
    # p "SET DIRECTION: #{@directions}, x: #{@x}, y: #{@y}"
  end
end
