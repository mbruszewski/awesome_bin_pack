module AwesomeBinPack
  class Rectangle
    attr_reader :width, :height, :rotatable, :area
    attr_accessor :pos_x, :pos_y

    def initialize(width, height, rotatable = false)
      @width = width
      @height = height
      @rotatable = rotatable
      @pos_x = nil
      @pos_y = nil

      @area = width * height
    end

    def fit_in?(bin)
      if self.width <= bin.width && self.height <= bin.height
        return true
      elsif self.rotatable && self.width <= bin.height && self.height <= bin.width
        return true
      else
        return false
      end
    end

    def need_rotate?(bin)
      if self.width <= bin.width && self.height <= bin.height
        return false
      elsif self.rotatable && self.width <= bin.height && self.height <= bin.width
        return true
      else
        return false
      end
    end

    def rotate
      @width, @height = @height, @width
    end
  end
end