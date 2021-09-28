require 'gosu'
require './entity/entities'

class Tutorial < Gosu::Window
    def initialize
        super 640, 480
        self.caption = "(erikfritas) tutorial from https://github.com/gosu/gosu/wiki/Ruby-Tutorial"

        @bg_image = Gosu::Image.new("src/images/bg.jpg", tileable: true)

        @player = Player.new
        @player.pos(320, 240)
    end

    def update
        if Gosu.button_down? Gosu::KB_LEFT or Gosu.button_down? Gosu::GP_LEFT
            @player.turn_left
        end
        if Gosu.button_down? Gosu::KB_RIGHT or Gosu.button_down? Gosu::GP_RIGHT
            @player.turn_right
        end
        if Gosu.button_down? Gosu::KB_UP or Gosu.button_down? Gosu::GP_UP
            @player.accelerate
        end
        @player.move
    end

    def draw
        # x, y, w, h
        @player.draw
        @bg_image.draw(0, 0, 0, 0.29, 0.29)
    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
            close
        else
            super
        end
    end
end

Tutorial.new.show

