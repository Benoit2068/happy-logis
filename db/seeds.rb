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

meat = Material.create({ name: 'meat' })
wheat = Material.create({ name: 'wheat' })
egg = Material.create({ name: 'egg' })
beer = Material.create({ name: 'beer' })
milk = Material.create({ name: 'milk' })
wood = Material.create({ name: 'wood' })

puts "material #{meat.name} created"
puts "material #{wheat.name} created"
puts "material #{egg.name}  created"
puts "material #{beer.name} created"
puts "material #{milk.name} created"
puts "material #{wood.name} created"



loading_material1 = Loadingmaterial.create({ loading_id: load_1.id, material_id: meat.id, quantity: 15 })
loading_material2 = Loadingmaterial.create({ loading_id: load_2.id, material_id: egg.id, quantity: 10 })
loading_material3 = Loadingmaterial.create({ loading_id: load_3.id, material_id: beer.id, quantity: 8 })

puts "loadingmaterial #{loading_material1.material.name}: #{loading_material1.quantity}  created"
puts "loadingmaterial #{loading_material2.material.name}: #{loading_material2.quantity}  created"
puts "loadingmaterial #{loading_material3.material.name}: #{loading_material3.quantity}  created"

loading_material4 = Loadingmaterial.create({ loading_id: load_4.id, material_id: wheat.id, quantity: -10 })
loading_material5 = Loadingmaterial.create({ loading_id: load_5.id, material_id: milk.id, quantity: -8 })
loading_material6 = Loadingmaterial.create({ loading_id: load_3.id, material_id: wood.id, quantity: -15 })

puts "unloadingmaterial #{loading_material4.material.name}: #{loading_material4.quantity}  created"
puts "unloadingmaterial #{loading_material5.material.name}: #{loading_material5.quantity}  created"
puts "unloadingmaterial #{loading_material6.material.name}: #{loading_material6.quantity}  created"

puts "seed created"
