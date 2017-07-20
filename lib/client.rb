class Client
  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |description, stylist_id|
    @description = description
    @stylist_id = stylist_id
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch("name")
      stylist_id = name.fetch("stylist_id").to_i()
      clients.push(Client.new(name, stylist_id))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (description, stylist_id) VALUES ('#{@description}', #{@stylist_id_});")
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end
end
