# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([
    {username: "ce.sizzle", email: "ce@gmail.com", password: "123"},
    {username: "mac_daddy", email: "mac@gmail.com", password: "456"},
    {username: "danimal", email: "dan@gmail.com", password: "789"}
    ])

Company.create([
    {name: "Netflix"},
    {name: "MLB"},
    {name: "Disney"}
    ])
