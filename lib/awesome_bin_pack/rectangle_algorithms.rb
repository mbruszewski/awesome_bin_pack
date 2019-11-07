module AwesomeBinPack
  class RectangleAlgorithms

    attr_accessor :orig_bin, :orig_rectangles

    def initialize(bin, rectangles)
      @orig_bin = bin
      @orig_rectangles = rectangles
    end

    def calculate_by_lower_square
      bin = @orig_bin.dup
    end

    def calculate_by_higher_area
      bin = @orig_bin.dup
      bin.pos_z = 1
      rectangles = orig_rectangles.sort_by { |rectangle| rectangle.area }

      full_bins_used = 1
      bins = [bin]
      used_rectangles = []

      rectangles.each do |rectangle|
        spare_bins = []
        used_bin = nil

        # sort bins by lowest area
        bins.sort_by! { |bin| bin.area }.reverse
        # try to put our rectangle in any of bins we have
        bins.each do |bin|
          if !rectangle.used
            spare_bins, used_rectangle = bin.add(rectangle)

            if used_rectangle
              rectangle.used = true
              used_bin = bin
            end
          end
        end
        # if rectangle does fit any bin, create a new one
        if !rectangle.used
          bin = orig_bin.dup
          bin.pos_z = full_bins_used + 1

          spare_bins, used_rectangle = bin.add(rectangle)

          if used_rectangle
            full_bins_used += 1
            rectangle.used = true
          end
        end

        if rectangle.used
          bins -= [used_bin] if used_bin
          bins = bins + spare_bins
          used_rectangles << rectangle
        end
      end

      binding.pry
      
      return { rectangles: used_rectangles, bin_count: full_bins_used }
    end
  end
end