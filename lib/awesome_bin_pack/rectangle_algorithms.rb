module AwesomeBinPack
  class RectangleAlgorithms

    attr_accessible :orig_bin, :orig_rectangles

    def initialize(bin, rectangles)
      @orig_bin = bin
      @orig_rectangles = rectangles
    end

    def calculate_by_lower_square
      bin = @orig_bin.dup
    end

    def calculate_by_higher_square
      bin = @orig_bin.dup
    end
  end
end