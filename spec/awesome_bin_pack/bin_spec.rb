describe AwesomeBinPack::Bin do
  describe "#add_rectangle" do
    it "if bin pack width and height is larger than item should return true" do
      AwesomeBinPack::Rectangle.new({ width: 10, height: 10, rotatable: false })
    end

    it "if bin pack width is lower and height larger than item should return false" do
    end

    it "if bin pack width is larger and height is lower than item should return false" do
    end
  end
end