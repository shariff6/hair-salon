class Client
  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |name, stylist_id|
    @name = name
    @stylist_id = stylist_id
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("names")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new(name, stylist_id))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_singleton_method(:delete) do |name|
    DB.exec("DELETE FROM clients WHERE names = ('#{name.name()}');")
  end

define_singleton_method(:find) do |name|
  found_client = nil
   Client.all().each() do |client|
  if client.name().==(name)
    found_client = client
  end
end
 found_client
end

define_method(:save) do
DB.exec("INSERT INTO clients (names, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
end
end
