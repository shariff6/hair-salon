require "spec_helper"
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
    expect(Stylist.all()).to(eq([stylist]))
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
describe("#update") do
    it("lets you update lists in the database") do
      stylist = Stylist.new("Jack", nil)
      stylist.save()
      stylist.update("Jane")
      expect(stylist.name()).to(eq("Jane"))
    end
  end
  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new("Jane", nil)
      stylist.save()
      stylist2 = Stylist.new("jill", nil)
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
    it("deletes a stylist's clients from the database") do
     stylist = Stylist.new("Jane", nil)
     stylist.save()
     client = Client.new("jack", stylist.id())
     client.save()
     client2 = Client.new("john", stylist.id())
     client2.save()
     stylist.delete()
    expect(Client.all()).to(eq([]))
   end
  end

  describe("#clients") do
      it("returns an array of clients for that Stylist") do
        test_stylist = Stylist.new("Jane",nil)
        test_stylist.save()
        test_client = Client.new("jill", test_stylist.id())
        test_client.save()
        test_client2 = Client.new("Ruby", test_stylist.id())
        test_client2.save()
        expect(test_stylist.clients()).to(eq([test_client, test_client2]))
      end
    end
end
