# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(Date.today - 1.month .. Date.today).each do |receive_date|
  [840, 978, 826].each do |from_currency|
    Rate.create(
      receive_date: receive_date,
      from_currency: from_currency,
      to_currency: 643,
      buy: 50 + Random.rand(20),
      sell: 50 + Random.rand(20)
    )
  end
end
