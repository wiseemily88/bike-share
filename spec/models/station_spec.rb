describe Station do
  describe "Class Methods" do
    describe "method" do
      it ""
    end
  end

  describe "Validation" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 1, city: "Denver", installation_date: 10/3/2017)

      expect(station).to_not be_valid
    end
  end
end
