# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create({name: 'Misc', description:""})
Category.create({name: 'Strength', description:""})
Category.create({name: 'Endurance', description:""})
Category.create({name: 'Strength-Endurance', description:""})
Category.create({name: 'Power', description:""})
Category.create({name: 'Recovery', description:""})