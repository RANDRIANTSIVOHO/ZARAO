# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: "fef@fef.fef", password: "froot", password_confirmation: "froot")
Admin.create(email: "Admin@zarao.mg", password: "root", password_confirmation: "root")


Category.create(title: "Peinture")
Category.create(title: "Music")
Category.create(title: "Dance")
Category.create(title: "Electronique")
Category.create(title: "Informatique")
Category.create(title: "Culinaire")