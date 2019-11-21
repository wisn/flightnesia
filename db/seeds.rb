# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(username: 'jono')
  User.create!(
    firstname: 'jono',
    lastname: 'jo',
    username: 'jono',
    password: 'password',
    phone: '123',
    email: 'jono@gmail.com',
  )
end

unless User.exists?(username: 'dian')
  User.create(
    firstname: 'Dian',
    lastname: 'Sasmita',
    username: 'dian',
    password: '1234',
    phone: '123',
    email: 'diansas0998@gmail.com',
  )
end
