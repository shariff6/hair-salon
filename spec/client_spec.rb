require("rspec")
  require("pg")
  require("client")

DB = PG.connect({:dbname => "hair_salon_test"})

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
end
