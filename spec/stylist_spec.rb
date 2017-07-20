require("rspec")
  require("pg")
  require("stylist")

DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end
describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end
describe("#save") do
  it("lets you save stylists to the database") do
    list = Stylist.new("Jane", nil)
    list.save()
    expect(Stylist.all()).to(eq([list]))
  end
end
describe("#==") do
  it("proves it is the same stylist if they have the same name") do
    list1 = Stylist.new("Jane",nil)
    list2 = Stylist.new("Jane", nil)
    expect(list1).to(eq(list2))
  end
end
end
