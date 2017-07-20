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
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new(name, stylist_id))
    end
    clients
  end

  define_method(:save) do
  DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
  end
end
