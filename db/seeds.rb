# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Photographer.create(name: 'Anna', address: '1234 Yonge Street', phone: '416 123 1234', website: 'www.myphotos.com', category: 'weddings')

User.create(name: 'Natalie', phone: '416-787-9898', email: 'natalie@gmail.com', password: '12', password_confirmation: '12')
