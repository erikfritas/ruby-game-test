class Player
    def initialize
        @image = Gosu::Image.new("src/images/player.png")
        @x = @y = @speed_x = @speed_y = @angle = 0.0
        @score = 0
    end

    def pos(x, y)
        @x, @y = x, y
    end

    def turn_left
        @angle -= 4.5
    end

    def turn_right
        @angle += 4.5
    end

    def accelerate
        @speed_x += Gosu.offset_x(@angle, 0.5)
        @speed_y += Gosu.offset_y(@angle, 0.5)
    end

    def move
        @x += @speed_x
        @y += @speed_y

        @x %= 640
        @y %= 480

        @speed_x *= 0.95
        @speed_y *= 0.95
    end

    def draw
        @image.draw_rot(@x, @y, 1, @angle)
    end
end
