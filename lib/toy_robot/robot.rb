module ToyRobot
  class Robot
    attr_reader :east, :north, :direction

    DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

    def initialize(east = 0, north = 0, direction = "NORTH")
      @east = east
      @north = north
      @direction = direction
    end

    def move_east
      @east += 1
    end

    def move_west
      @east -= 1
    end

    def move_north
      @north += 1
    end

    def move_south
      @north -= 1
    end

    def move
      send("move_#{@direction.downcase}")
    end

    def turn_left
      turn(:left)
    end

    def turn_right
      turn(:right)
    end

    def report
      {
        north: north,
        east: east,
        direction: direction,
      }
    end

    def next_move
      case @direction
      when "NORTH"
        [@east, @north + 1]
      when "SOUTH"
        [@east, @north - 1]
      when "EAST"
        [@east + 1, @north]
      when "WEST"
        [@east - 1, @north]
      end
    end

    private

    def turn(turn_direction)
      rotation = turn_direction == :right ? 1 : -1
      index = (DIRECTIONS.index(@direction) + rotation) % DIRECTIONS.size
      @direction = DIRECTIONS[index]
    end
  end
end
