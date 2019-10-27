RSpec.describe AwesomeBinPack::Rectangle do 
  describe "#initialize" do
    it "rotatable should be false by default" do
      rectangle = AwesomeBinPack::Rectangle.new(10, 15)

      expect(rectangle.rotatable).to eq(false)
    end
    
    it "should accept string as parameters" do
      rectangle = AwesomeBinPack::Rectangle.new(10, 15, false)

      expect(rectangle.width).to eq(10)
      expect(rectangle.height).to eq(15)
      expect(rectangle.rotatable).to eq(false)
    end
  end

  describe "#fit_in?" do
    let!(:bin) { AwesomeBinPack::Bin.new(15, 10) }
    
    it "if bin pack width and height is larger than item should return true" do
      rectangle = AwesomeBinPack::Rectangle.new(5, 5)

      expect(rectangle.fit_in?(bin)).to eq(true)
    end

    it "if bin pack width is lower and height larger than item should return false (not rotatable)" do
      rectangle = AwesomeBinPack::Rectangle.new(15, 11)

      expect(rectangle.fit_in?(bin)).to eq(false)
    end

    it "if bin pack width is larger and height is lower than item should return false  (not rotatable)" do
      rectangle = AwesomeBinPack::Rectangle.new(16, 10)

      expect(rectangle.fit_in?(bin)).to eq(false)
    end

    it "it should fit if rotated rectangle is lower than bin" do
      rectangle = AwesomeBinPack::Rectangle.new(10, 15, true)

      expect(rectangle.fit_in?(bin)).to eq(true)
    end
  end

  describe "#need_rotate?" do
    let!(:bin) { AwesomeBinPack::Bin.new(15, 10) }
    
    it "if bin pack width and height is larger than item should return true" do
      rectangle = AwesomeBinPack::Rectangle.new(5, 5)

      expect(rectangle.need_rotate?(bin)).to eq(false)
    end

    it "if bin pack width is lower and height larger than item should return false (not rotatable)" do
      rectangle = AwesomeBinPack::Rectangle.new(15, 11)

      expect(rectangle.need_rotate?(bin)).to eq(false)
    end

    it "if bin pack width is larger and height is lower than item should return false  (not rotatable)" do
      rectangle = AwesomeBinPack::Rectangle.new(16, 10)

      expect(rectangle.need_rotate?(bin)).to eq(false)
    end

    it "it should fit if rotated rectangle is lower than bin" do
      rectangle = AwesomeBinPack::Rectangle.new(10, 15, true)

      expect(rectangle.need_rotate?(bin)).to eq(true)
    end
  end
end