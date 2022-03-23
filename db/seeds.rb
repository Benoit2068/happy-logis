# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Material.destroy_all
Loading.destroy_all
Delivery.destroy_all
User.destroy_all
Loadingmaterial.destroy_all

john = User.create({ email: "john@gmail.com", name: 'John', function: "driver", password: "123456" })
mick = User.create({ email: "mick@gmail.com", name: 'Mick', function: "driver", password: "123456" })
nico = User.create({ email: "nico@gmail.com", name: 'Nico', function: "manager", password: "123456" })


puts "user #{john.name}, #{mick.name}, #{nico.name} create!!!!"

delivery_zurich = Delivery.new({ name: "Zurich", startdate: Date.today - 1, capacity: 33, finished: false})
delivery_zurich.user = john
delivery_zurich.save

delivery_geneve = Delivery.new({ name: "Genève", startdate: Date.today + 1, capacity: 33, finished: false})
delivery_geneve.user = john
delivery_geneve.save

delivery_sierre = Delivery.new({ name: "Sierre", startdate: Date.today, capacity: 33, finished: false})
delivery_sierre.user = john
delivery_sierre.save

delivery_sierre2 = Delivery.new({ name: "Sierre 2", startdate: Date.today, capacity: 33, finished: false})
delivery_sierre2.user = mick
delivery_sierre2.save


puts "delivery #{delivery_zurich.name} create"
puts "delivery #{delivery_geneve.name} create"
puts "delivery #{delivery_sierre.name} create"
puts "delivery #{delivery_sierre2.name} create"

load_1 = Loading.create({date: Date.today, name: "Moulin de la Pallanterie SA", address: "Rte de Thonon 154, 1222 Vésenaz", done: true, delivery_id: delivery_zurich.id})
load_2 = Loading.create({date: Date.today, name: "Singh Handel", address: "Hofstattstrasse 4A, 4552 Derendingen", done: true, delivery_id: delivery_zurich.id})
load_3 = Loading.create({date: Date.today, name: "Beerhub GmbH", address: "Zwickystrasse 2, 8304 Wallisellen", done: false, delivery_id: delivery_zurich.id})
load_4 = Loading.create({date: Date.today, name: "Centrale Coop Schafisheim", address: "Rupperswilerstrasse 2, 5503 Schafisheim", done: false, delivery_id: delivery_zurich.id})
load_5 = Loading.create({date: Date.today, name: "Centrale Coop Aclens", address: "Route de la Plaine, 1123 Aclens", done: false, delivery_id: delivery_zurich.id})

puts "load #{load_1.address}, #{load_2.address}, #{load_3.address}, #{load_4.address}, #{load_5.address},  create"


material_meal_load = Material.create({ name: 'meal', quantity: 4 })
material_egg_load = Material.create({ name: 'egg', quantity: 2 })
material_beer_load = Material.create({ name: 'beer', quantity: 9 })

material_meal_unload_1 = Material.create({ name: 'meal', quantity: -2 })
material_meal_unload_2 = Material.create({ name: 'meal', quantity: -2 })
material_egg_unload = Material.create({ name: 'egg', quantity: -2 })
material_beer_unload = Material.create({ name: 'beer', quantity: -9 })

puts "material #{material_meal_load.name}: #{material_meal_load.quantity}  create"
puts "material #{material_egg_load.name}: #{material_egg_load.quantity}  create"
puts "material #{material_beer_load.name}: #{material_beer_load.quantity}  create"
puts "material #{material_meal_unload_1.name}: #{material_meal_unload_1.quantity}  create"
puts "material #{material_meal_unload_2.name}: #{material_meal_unload_2.quantity}  create"
puts "material #{material_egg_unload.name}: #{material_egg_unload.quantity}  create"
puts "material #{material_beer_unload.name}: #{material_beer_unload.quantity}  create"




loading_material_meal = Loadingmaterial.new
loading_material_meal.loading = load_1
loading_material_meal.material = material_meal_load
loading_material_meal.save

loading_material_egg = Loadingmaterial.new
loading_material_egg.loading = load_2
loading_material_egg.material = material_egg_load
loading_material_egg.save

loading_material_beer = Loadingmaterial.create({loading_id: load_3, material_id: material_beer_load})
loading_material_beer.loading = load_3
loading_material_beer.material = material_beer_load
loading_material_beer.save

unloading_material_meal_1 = Loadingmaterial.new
unloading_material_meal_1.loading = load_4
unloading_material_meal_1.material = material_meal_unload_1
unloading_material_meal_1.save

unloading_material_meal_2 = Loadingmaterial.new
unloading_material_meal_2.loading = load_5
unloading_material_meal_2.material = material_meal_unload_2
unloading_material_meal_2.save

unloading_material_egg = Loadingmaterial.new
unloading_material_egg.loading = load_5
unloading_material_egg.material = material_egg_unload
unloading_material_egg.save

unloading_material_beer = Loadingmaterial.new
unloading_material_beer.loading = load_5
unloading_material_beer.material = material_beer_unload
unloading_material_beer.save

puts "seed create"
