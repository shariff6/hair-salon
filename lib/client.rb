class Client
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |name, stylist_id, id|
    @name = name
    @stylist_id = stylist_id
    @id = id
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("names")
      stylist_id = client.fetch("stylist_id").to_i()
      id = client.fetch("id").to_i()
      clients.push(Client.new(name, stylist_id,id))
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
  result = DB.exec("INSERT INTO clients (names, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
  @id = result.first().fetch("id").to_i()

end
define_method(:update) do |name|
  @name = name
  DB.exec("UPDATE clients SET names = '#{@name}' WHERE id = ('#{self.id()}');")
end

end
