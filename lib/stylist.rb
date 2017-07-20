class Stylist do
  attr_reader(:name, :id)
  define_method(:initialize) do |name, id|
    @name = name
    @id = id
  end
end
