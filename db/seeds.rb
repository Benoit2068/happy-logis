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
manu = User.create({ email: "manu@gmail.com", name: 'Manu', function: "driver", password: "123456" })


puts "user #{john.name} create as #{john.function}"
puts "user #{mick.name} create as #{mick.function}"
puts "user #{nico.name} create as #{nico.function}"
puts "user #{manu.name} create as #{manu.function}"


meat = Material.create({ name: 'Meat' })
wheat = Material.create({ name: 'Wheat' })
egg = Material.create({ name: 'Egg' })
beer = Material.create({ name: 'Beer' })
milk = Material.create({ name: 'Milk' })
wine = Material.create({ name: 'Red Wine' })
fruit_juice = Material.create({ name: 'Fruit juice' })
rhum = Material.create({ name: 'Rhum' })
coca_cola = Material.create({ name: 'Coca Cola' })
chips = Material.create({ name: 'Chips' })
flour = Material.create({ name: 'Flour' })

puts "material #{meat.name} created"
puts "material #{wheat.name} created"
puts "material #{egg.name}  created"
puts "material #{beer.name} created"
puts "material #{milk.name} created"
puts "material #{wine.name} created"
puts "material #{fruit_juice.name} created"
puts "material #{rhum.name} created"
puts "material #{coca_cola.name} created"
puts "material #{chips.name} created"
puts "material #{flour.name} created"

delivery_zurich = Delivery.new({ name: "Zurich", startdate: Date.today - 1 , capacity: 33, finished: false})
delivery_zurich.user = manu
delivery_zurich.save

delivery_lausanne = Delivery.new({ name: "Lausanne", startdate: Date.today + 1, capacity: 33, finished: true})
delivery_lausanne.user = john


delivery_geneve = Delivery.new({ name: "Genève", startdate: Date.today, capacity: 33, finished: false})
delivery_geneve.user = manu
delivery_geneve.save

delivery_sierre = Delivery.new({ name: "Sierre", startdate: Date.today + 2, capacity: 33, finished: false})
delivery_sierre.user = manu
delivery_sierre.save

delivery_geneve_2 = Delivery.new({ name: "Genève", startdate: Date.today + 3, capacity: 33, finished: false})
delivery_geneve_2.user = manu
delivery_geneve_2.save

delivery_sierre_2 = Delivery.new({ name: "Sierre", startdate: Date.today + 1, capacity: 33, finished: false})
delivery_sierre_2.user = manu
delivery_sierre_2.save


puts "delivery #{delivery_zurich.name} create"
puts "delivery #{delivery_lausanne.name} create"
puts "delivery #{delivery_geneve.name} create"
puts "delivery #{delivery_sierre.name} create"
puts "delivery #{delivery_sierre_2.name} create"
puts "delivery #{delivery_geneve_2.name} create"


load_1 = Loading.create({date: Date.today - 1, name: "Moulin de la Pallanterie SA", address: "Rte de Thonon 154, 1222 Vésenaz", done: true, delivery_id: delivery_zurich.id})
load_2 = Loading.create({date: Date.today - 1, name: "Stettler Comestibles SA", address: "Rte de Carrouge 12, 1509 Vucherens", done: true, delivery_id: delivery_zurich.id})
load_3 = Loading.create({date: Date.today - 1, name: "Beerhub GmbH", address: "Zwickystrasse 2, 8304 Wallisellen", done: true, delivery_id: delivery_zurich.id})
load_4 = Loading.create({date: Date.today - 1, name: "Centrale Coop Schafisheim", address: "Rupperswilerstrasse 2, 5503 Schafisheim", done: true, delivery_id: delivery_zurich.id})
load_5 = Loading.create({date: Date.today - 1, name: "Centrale Coop Aclens", address: "Route de la Plaine, 1123 Aclens", done: false, delivery_id: delivery_zurich.id})
load_6 = Loading.create({date: Date.today, name: "Boissons Liechti SA", address: "chemin de la Milice 20, 1228 Plan-les-Ouates", done: true, delivery_id: delivery_geneve.id})
load_7 = Loading.create({date: Date.today, name: "Prodegua Satigny", address: "rue De-Turrettin 2, 1242 Satigny", done: false, delivery_id: delivery_geneve.id})
load_8 = Loading.create({date: Date.today, name: "Le Saint-Jean Bar et Restaurant", address: "Rue Saint-Jean 22, 1260 Nyon", done: false, delivery_id: delivery_geneve.id})

puts "load #{load_1.address} create"
puts "load #{load_2.address} create"
puts "load #{load_3.address} create"
puts "load #{load_4.address} create"
puts "load #{load_5.address} create"
puts "load #{load_6.address} create"

loading_material_1 = Loadingmaterial.create({ loading_id: load_1.id, material_id: flour.id, quantity: 15 })
loading_material_2 = Loadingmaterial.create({ loading_id: load_2.id, material_id: egg.id, quantity: 10 })
loading_material_3 = Loadingmaterial.create({ loading_id: load_3.id, material_id: beer.id, quantity: 8 })
loading_material_4 = Loadingmaterial.create({ loading_id: load_4.id, material_id: flour.id, quantity: -5 })
loading_material_16 = Loadingmaterial.create({ loading_id: load_4.id, material_id: egg.id, quantity: -3 })
loading_material_17 = Loadingmaterial.create({ loading_id: load_5.id, material_id: flour.id, quantity: -10 })
loading_material_18 = Loadingmaterial.create({ loading_id: load_5.id, material_id: egg.id, quantity: -7 })
loading_material_19 = Loadingmaterial.create({ loading_id: load_5.id, material_id: beer.id, quantity: -8 })

# loading_material_6 = Loadingmaterial.create({ loading_id: load_3.id, material_id: wine.id, quantity: -15 })
loading_material_7 = Loadingmaterial.create({ loading_id: load_6.id, material_id: beer.id, quantity: 10 })
loading_material_8 = Loadingmaterial.create({ loading_id: load_6.id, material_id: fruit_juice.id, quantity: 5 })
loading_material_9 = Loadingmaterial.create({ loading_id: load_6.id, material_id: coca_cola.id, quantity: 7 })
loading_material_10 = Loadingmaterial.create({ loading_id: load_7.id, material_id: beer.id, quantity: -2 })
loading_material_11 = Loadingmaterial.create({ loading_id: load_7.id, material_id: chips.id, quantity: 5 })
loading_material_12 = Loadingmaterial.create({ loading_id: load_8.id, material_id: beer.id, quantity: -5 })
loading_material_13 = Loadingmaterial.create({ loading_id: load_8.id, material_id: fruit_juice.id, quantity: -2 })
loading_material_14 = Loadingmaterial.create({ loading_id: load_8.id, material_id: coca_cola.id, quantity: -4 })
loading_material_15 = Loadingmaterial.create({ loading_id: load_8.id, material_id: chips.id, quantity: -3 })



puts "loadingmaterial #{loading_material_1.material.name}: #{loading_material_1.quantity}  created"
puts "loadingmaterial #{loading_material_2.material.name}: #{loading_material_2.quantity}  created"
puts "loadingmaterial #{loading_material_3.material.name}: #{loading_material_3.quantity}  created"
puts "unloadingmaterial #{loading_material_4.material.name}: #{loading_material_4.quantity}  created"
# puts "unloadingmaterial #{loading_material_5.material.name}: #{loading_material_5.quantity}  created"
# puts "unloadingmaterial #{loading_material_6.material.name}: #{loading_material_6.quantity}  created"
puts "unloadingmaterial #{loading_material_7.material.name}: #{loading_material_7.quantity}  created"
puts "unloadingmaterial #{loading_material_8.material.name}: #{loading_material_8.quantity}  created"
puts "unloadingmaterial #{loading_material_9.material.name}: #{loading_material_9.quantity}  created"
puts "unloadingmaterial #{loading_material_10.material.name}: #{loading_material_10.quantity}  created"
puts "unloadingmaterial #{loading_material_11.material.name}: #{loading_material_11.quantity}  created"
puts "unloadingmaterial #{loading_material_12.material.name}: #{loading_material_12.quantity}  created"
puts "unloadingmaterial #{loading_material_13.material.name}: #{loading_material_13.quantity}  created"
puts "unloadingmaterial #{loading_material_14.material.name}: #{loading_material_14.quantity}  created"
puts "unloadingmaterial #{loading_material_15.material.name}: #{loading_material_15.quantity}  created"
puts "unloadingmaterial #{loading_material_16.material.name}: #{loading_material_16.quantity}  created"
puts "unloadingmaterial #{loading_material_17.material.name}: #{loading_material_17.quantity}  created"
puts "unloadingmaterial #{loading_material_18.material.name}: #{loading_material_18.quantity}  created"
puts "unloadingmaterial #{loading_material_19.material.name}: #{loading_material_19.quantity}  created"

puts "seed created"
