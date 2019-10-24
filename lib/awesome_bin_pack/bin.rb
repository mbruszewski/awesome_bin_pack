class AwesomeBinPack::Bin
  attr_reader :width, :height, :items

  def initialize(width = 0, height = 0)
    @width = width
    @height = height
    @items = []
  end

  def add(item)
    if item.class == Rectangle
      add_rectangle(item)
    end
  end

  def add_rectangle(item)
    if item.width <= self.width && item.height <= self.height
      
      return true
    else
      return false
    end
  end
end