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
    stylist = Stylist.new("Jane", nil)
    stylist.save()
    expect(Stylist.all()).to(eq([list]))
  end
end
describe("#==") do
  it("proves it is the same stylist if they have the same name") do
    stylist1 = Stylist.new("Jane",nil)
    stylist2 = Stylist.new("Jane", nil)
    expect(stylist1).to(eq(stylist2))
  end
end
describe(".find") do
it("returns a Stylist by its ID") do
  test_stylist = Stylist.new("Jane", nil)
  test_stylist.save()
  test_stylist2 = Stylist.new("Jack",nil)
  test_stylist2.save()
  expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
end
end
end
