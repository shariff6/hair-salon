require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require('pg')

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new(name, nil)
  stylist.save
  erb(:index)
end
