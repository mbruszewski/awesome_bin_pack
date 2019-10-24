describe AwesomeBinPack::Rectangle do 
  describe "#initialize" do
    it "rotatable should be false by default" do
      rectangle = AwesomeBinPack::Rectangle.new({ width: 10, height: 15 })

      expect(rectangle.rotatable).to eq(false)
    end
    
    it "should accept string as parameters" do
      rectangle = AwesomeBinPack::Rectangle.new({ width: 10, height: 15, rotatable: false })

      expect(rectangle.width).to eq(10)
      expect(rectangle.height).to eq(15)
      expect(rectangle.rotatable).to eq(false)
    end
  end
end