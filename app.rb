require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @clients = Client.all()
  @stylists = Stylist.all()

  erb(:index)
end
post("/stylists") do
  @clients = Client.all()
  @stylists = Stylist.all()
  name = params.fetch("name")
  stylist = Stylist.new(name, nil)
  stylist.save
  erb(:index)
end
get("/stylists") do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:stylists)
end
post("/clients") do
    @stylists =Stylist.all()
    name = params.fetch("name")
    stylist_id = params.fetch("stylist_id").to_i()
    @stylist = Stylist.find(stylist_id)
    @client = Client.new(name, stylist_id, nil)
    @client.save()
    erb(:index)
end
get("/clients") do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:clients)
end
get("/stylists/:id") do
 @stylists = Stylist.all()
 @clients = Client.all()
 @stylist = Stylist.find(params.fetch("id").to_i())
 @clienties = @stylist.clients()
 erb(:stylist)
end
get("/stylists/:id/edit") do
 @stylists = Stylist.all()
 @clients = Client.all()
 @stylist = Stylist.find(params.fetch("id").to_i())
 erb(:stylist_edit)
end
delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end
get("/clients/:name") do
  @clients = Client.all()
  @client = Client.find(params.fetch("name"))
  erb(:client_edit)
 end

 delete("/clients/:name") do
   @clients = Client.all()
   @client = Client.find(params.fetch("name"))
   Client.delete(@client)
   erb(:success)
 end
 patch("/clients/:name") do
  @client = Client.find(params.fetch("name"))
  nam = params.fetch("new_name")
  @client.update(nam)
  erb(:success)
end
patch("/stylists/:id") do
  @stylists = Stylist.all()
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update(name)
  @clienties = @stylist.clients()
  erb(:stylist)
end
