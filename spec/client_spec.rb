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
end
