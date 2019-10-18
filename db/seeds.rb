# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create!([{email: "dabbebhutdp@gmail.com",is_admin: true, password: "password"},
	{email: "sirishapalivela95@gmail.com",is_admin: false, password: "password"}])

Subscriber.delete_all

Subscriber.create!([{sub_email: "dabbebhutdp@gmail.com",type_of_sub: "FrontPage Subscriber",subscribed: true},
	{sub_email: "sirishapalivela95@gmail.com",type_of_sub: "FrontPage Subscriber",subscribed: true}
	])

Exchange.delete_all

Exchange.create!([{title: "Christmas 2019",date_of_gifting: "2019-12-21",finish_date: "2019-12-26", date_of_matching: "2019-12-12"}])