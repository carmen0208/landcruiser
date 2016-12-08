class Robot
  def initialize x,y, facing
    @x,@y,@facing =  x, y, facing
    validate_axis?(@x,@y)
    @x = @x.to_i
    @y = @y.to_i
    @directions = ['SOUTH','WEST','NORTH','EAST']
    set_direction @facing
  end

  private

  def validate_axis? x, y
    # p x.to_i
    # p y.to_i
    raise "Coordinate must choosing the integer beween 0 to 5" if !/\A\d+\z/.match(x) ||!/\A\d+\z/.match(y) || !x.to_i.between?(0,5) || !y.to_i.between?(0,5)
  end

  def set_direction face
    raise 'You much choose face to NORTH,SOUTH,EAST,WEST' unless @directions.include? face

    while @directions.first != face do
      @directions.rotate!

    end
    # p "SET DIRECTION: #{@directions}, x: #{@x}, y: #{@y}"
  end
end
