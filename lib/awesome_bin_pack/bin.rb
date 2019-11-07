module AwesomeBinPack
  class Bin
    attr_reader :width, :height, :area
    attr_accessor :items, :pos_x, :pos_y, :pos_z

    def initialize(width, height, pos_x = 0, pos_y = 0, pos_z = 0)
      @width = width
      @height = height
      @items = []
      @pos_x = pos_x
      @pos_y = pos_y
      @pos_z = pos_z

      @area = width * height
    end

    def to_s
      "width: #{width}, height: #{height}, pos_x: #{pos_x}, pos_y: #{pos_y}"
    end

    def add(item)
      if item.class == Rectangle
        add_rectangle(item)
      end
    end

    def add_rectangle(rectangle)
      if rectangle.fit_in?(self)
        rectangle = rectangle.rotate if rectangle.need_rotate?(self)
        rectangle.pos_x = self.pos_x
        rectangle.pos_y = self.pos_y
        rectangle.pos_z = self.pos_z

        bins = []
        
        if rectangle.width == self.width && rectangle.height == self.height
          # return 0 bins, 1 rectangle  
          return [], rectangle
        elsif rectangle.width == self.width
          # return 1 bin, 1 rectangle
          bins << AwesomeBinPack::Bin.new(
            self.width,
            self.height - rectangle.height,
            pos_x,
            rectangle.height + pos_y,
            pos_z
          )
        elsif rectangle.height == self.height
          # return 1 bin, 1 rectangle
          bins << AwesomeBinPack::Bin.new(
            self.width - rectangle.width,
            self.height,
            rectangle.width + pos_x,
            pos_y,
            pos_z
          )
        else
          # return 2 bins, 1 rectangle
          bins << AwesomeBinPack::Bin.new(
            self.width - rectangle.width,
            self.height,
            pos_x,
            rectangle.height + pos_y,
            pos_z
          )
          bins << AwesomeBinPack::Bin.new(
            self.width - rectangle.width,
            self.height - rectangle.height,
            rectangle.width + pos_x,
            pos_y,
            pos_z
          )
        end

        return bins, rectangle
      else
        return false 
      end
    end
  end
end