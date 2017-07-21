require "spec_helper"
describe(Client) do
  describe("name")do
    it("lets you see the clients") do
      test_client = Client.new("mary", nil)
      expect(test_client.name()).to(eq("mary"))
    end
  end
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end
  describe("#stylist_id") do
   it("lets you read the stylist ID out") do
      test_client = Client.new("Jane", 1)
     expect(test_client.stylist_id()).to(eq(1))
   end
 end
 describe("#save") do
  it("adds a client to the array of saved clients") do
    test_client = Client.new("jack" , 1)
    test_client.save()
    expect(Client.all()).to(eq([test_client]))
  end
end
describe("#==") do
  it("is the same client if it has the same description") do
    client1 = Client.new("Jane", nil)
    client2 = Client.new("Jane", nil)
    expect(client1).to(eq(client2))
  end
end
describe(".find") do
it("returns a client by its name") do
  test_stylist = Stylist.new("jack", nil)
  test_stylist.save()
  test_client = Client.new("Jane", test_stylist.id)
  test_client.save()
  test_client2 = Client.new("June",test_stylist.id)
  test_client2.save()
  expect(Client.find(test_client2.name())).to(eq(test_client2))
end
end
describe("#delete") do
  it "deletes a client" do
    test_stylist = Stylist.new("jack", nil)
    test_stylist.save()
    test_client = Client.new("Jane", test_stylist.id)
    test_client.save()
    Client.delete(test_client)
    expect(Client.all()).to(eq([]))
  end
end
describe("#update") do
  it "updates a client" do
    test_stylist = Stylist.new("jack", nil)
    test_stylist.save()
    test_client = Client.new("Jane", test_stylist.id)
    test_client.save()
    test_client.update("john")
    expect(test_client.name()).to(eq("john"))
    end
  end
end
