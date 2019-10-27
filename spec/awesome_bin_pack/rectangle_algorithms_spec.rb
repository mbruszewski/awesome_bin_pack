RSpec.describe AwesomeBinPack::RectangleAlgorithms do
  describe "#calculate_by_higher_area" do
    subject { AwesomeBinPack::RectangleAlgorithms }

    it "should be albe to put 1 item inside" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangle = AwesomeBinPack::Rectangle.new(5, 5)
      
      alg = subject.new(bin, [rectangle])
      ret = alg.calculate_by_higher_area
      
      expect(ret[:bin_count]).to eq(1)
    end

    it "should be able to fill whole bin" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangles = []
      4.times { rectangles << AwesomeBinPack::Rectangle.new(5, 5) }
      
      alg = subject.new(bin, rectangles)
      ret = alg.calculate_by_higher_area
      
      expect(ret[:bin_count]).to eq(1)
    end

    it "should be able to fill two bins" do
      bin = AwesomeBinPack::Bin.new(10, 10)
      rectangles = []
      6.times { rectangles << AwesomeBinPack::Rectangle.new(5, 5) }
      
      alg = subject.new(bin, rectangles)
      ret = alg.calculate_by_higher_area
      
      expect(ret[:bin_count]).to eq(2)
    end
  end
end