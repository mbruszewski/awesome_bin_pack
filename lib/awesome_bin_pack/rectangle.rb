module AwesomeBinPack
  class Rectangle
    attr_reader :width, :height, :rotatable, :area
    attr_accessor :pos_x, :pos_y, :bin_index, :used

    def initialize(width, height, rotatable = false)
      @width = width
      @height = height
      @area = width * height
      @rotatable = rotatable

      @pos_x = nil
      @pos_y = nil
      @bin_index = nil

      @used = false
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