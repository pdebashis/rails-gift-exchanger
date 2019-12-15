# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.delete_all
Exchange.delete_all
User.delete_all
Subscriber.delete_all


User.create!([{email: "dabbebhutdp@gmail.com",name: "Debashis", is_admin: true, password: "password"}])


Exchange.create!([{title: "Christmas 2019",date_of_gifting: "2019-12-21", date_of_matching: "2019-12-12", user_id: User.first.id}])
Exchange.create!([{title: "Test Exchange",date_of_gifting: "2019-12-21", date_of_matching: "2019-12-12", user_id: User.first.id}])

exchange1 = Exchange.first


member1 = exchange1.members.build({email: "dabbebhutdp@gmail.com"})
member1.user = User.find_by({email: "dabbebhutdp@gmail.com"})
member1.save