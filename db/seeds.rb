# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Material.destroy_all
Load.destroy_all
Deliverie.destroy_all
User.destroy_all

john = User.create({ name: 'Mick' function: "driver" })
mick = User.create({ name: 'John' function: "driver" })
nico = User.create({ name: 'John' function: "manager" })

delivery_zurich = Deliverie.create({ name: "Zurich", start_date: Date.today, capacity: 33, finished: false, user_id: john})

load_1 = Load.create ({date: Date.today, address: "Rte de Thonon 154, 1222 Vésenaz", done: false, delieverie_id: delivery_zurich})
load_2 = Load.create ({date: Date.today, address: "Hofstattstrasse 4A, 4552 Derendingen", done: false, delieverie_id: delivery_zurich})
load_3 = Load.create ({date: Date.today, address: "Zwickystrasse 2, 8304 Wallisellen", done: false, delieverie_id: delivery_zurich})



meal_material = Material.create({ name: 'meal', quantity: 4, load_id: load_1})
egg_material = Material.create({ name: 'egg', quantity: 2, load_id: load_2})
beer_material = Material.create({ name: 'beer', quantity: 9, load_id: load_3})
