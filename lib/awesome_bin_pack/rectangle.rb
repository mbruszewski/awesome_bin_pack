class AwesomeBinPack::Rectangle
  attr_reader :width, :height, :rotatable, :pos_x, :pos_y

  def initialize(options = {})
    @width = options.fetch("width", nil)
    @height = options.fetch("height", nil)
    @rotatable = options.fetch("rotatable" false)
  end
end