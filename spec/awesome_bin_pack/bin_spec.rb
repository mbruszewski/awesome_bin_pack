RSpec.describe AwesomeBinPack::Bin do
  describe "#add_rectangle" do
    it "should be able to add rectangle to bin with same size" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangle = AwesomeBinPack::Rectangle.new(10, 10)
      
      result_bins, result_rect = bin.add_rectangle(rectangle)
      expect(result_bins).to eq([])
      expect(result_rect).to eq(rectangle)
      expect(result_rect.pos_x).to eq(0)
      expect(result_rect.pos_y).to eq(0)
    end

    it "shouldnt be able to add rectangle to bin with bigger size" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangle = AwesomeBinPack::Rectangle.new(15, 15)

      expect(bin.add_rectangle(rectangle)).to eq(false)
    end

    it "should be able to add rectangle to bin with lower size - two bin return" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangle = AwesomeBinPack::Rectangle.new(5, 5)

      result_bins, result_rect = bin.add_rectangle(rectangle)

      #binding.pry
      expect(result_bins.map { |bin| bin.to_s }).to match_array([
        AwesomeBinPack::Bin.new(5, 5, 5, 0).to_s,
        AwesomeBinPack::Bin.new(5, 10, 0, 5).to_s
      ])
      expect(result_rect).to eq(rectangle)
      expect(result_rect.pos_x).to eq(0)
      expect(result_rect.pos_y).to eq(0)
    end

    it "should be able to add rectangle to bin with lower size - one bin return" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangle = AwesomeBinPack::Rectangle.new(5, 10)

      result_bins, result_rect = bin.add_rectangle(rectangle)
      
      expect(result_bins.map { |bin| bin.to_s }).to match_array([
        AwesomeBinPack::Bin.new(5, 10, 5, 0).to_s
      ])
      expect(result_rect).to eq(rectangle)
      expect(result_rect.pos_x).to eq(0)
      expect(result_rect.pos_y).to eq(0)
    end
  end
end