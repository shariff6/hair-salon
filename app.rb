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
post("/clients") do
    @stylists =Stylist.all()
    name = params.fetch("name")
    stylist_id = params.fetch("stylist_id").to_i()
    @stylist = Stylist.find(stylist_id)
    @client = Client.new(name, stylist_id)
    @client.save()
    erb(:index)
end
get("/stylists/:id") do
 @stylists = Stylist.all()
 @clients = Client.all()
 @stylist = Stylist.find(params.fetch("id").to_i())
 @clienties = @stylist.clients()
 erb(:stylist)
end
delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end
get("/clients/:name") do
   erb(:client_edit)
 end
