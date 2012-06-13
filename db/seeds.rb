# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Locator.delete_all

Locator.create(street:'8500 Beverly Boulevard', city:'Los Angeles',state:'CA',zip:'90048',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:00PM <br> Sunday:11:00AM-8:00PM},phone:"310-360-2700")
Locator.create(street:'10250 Santa Monica Boulevard', city:'Los Angeles',state:'CA',zip:'90067',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:00PM <br> Sunday:11:00AM-8:00PM},phone:"310-772-2100")
Locator.create(street:'7057 Friars Road', city:'San Diego',state:'CA',zip:'92108',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-8:00PM <br> Sunday:12:00PM-7:00PM},phone:"619-610-6400")
Locator.create(street:'701 Newport Center Drive', city:'Newport Beach',state:'CA',zip:'92660',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-8:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-7:00PM <br> Sunday:12:00PM-6:00PM},phone:"949-729-6600")
Locator.create(street:'845 Market Street', city:'San Francisco',state:'CA',zip:'94103',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:00PM <br> Sunday:11:00AM-8:00PM},phone:"415-856-5300")
Locator.create(street:'315 Colorado Avenue', city:'Santa Monica',state:'CA',zip:'90401',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:00PM <br> Sunday:11:00AM-8:00PM},phone:"310-985-6400")
Locator.create(street:'14060 Riverside Drive', city:'Sherman Oaks',state:'CA',zip:'91423',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-8:00PM <br> Sunday:11:00AM-7:00PM},phone:"818-325-2200")
Locator.create(street:'3333 South Bristol Street', city:'Costa Mesa',state:'CA',zip:'92626',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:00PM <br> Sunday:11:00AM-7:00PM},phone:"714-8824-4600")
Locator.create(street:'1 Stanford Shopping Center', city:'Palo Alto',state:'CA',zip:'94304',name:'Bloomingdales',hours:%{Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Monday,Saturday:10:00AM-8:00PM <br> Sunday:12:00PM-7:00PM},phone:"650-463-2000")
Locator.create(street:'1000 Third Avenue', city:'New York',state:'NY',zip:'10022',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-8:30PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-8:30PM <br> Sunday:11:00AM-7:00PM},phone:"212-705-2000")
Locator.create(street:'270 Walt Whitman Road', city:'Huntington Station',state:'NY',zip:'11746',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:00PM <br> Sunday:11:00AM-7:00PM},phone:"631-425-6700")
Locator.create(street:'630 Old Country Road', city:'Garden City',state:'NY',zip:'11530',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:30PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-9:30PM <br> Sunday:11:00AM-7:00PM},phone:"516-873-2700")
Locator.create(street:'504 Broadway', city:'New York',state:'NY',zip:'10012',name:'Bloomingdales',hours:%{Monday,Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Saturday:10:00AM-8:00PM <br> Sunday:12:00PM-8:00PM},phone:"212-729-5900")
Locator.create(street:'175 Bloomingdale Road', city:'White Plains',state:'NY',zip:'10605',name:'Bloomingdales',hours:%{Thursday,Friday:10:00AM-9:00PM <br> Tuesday Wednesday:10:00AM-10:00PM <br> Monday,Saturday:10:00AM-8:00PM <br> Sunday:11:00AM-6:00PM},phone:"914-684-6300")


Locator.create(street:'9600 Wilshire Boulevard', city:'Beverly Hills',state:'CA',zip:'90212',name:'SAKS FIFTH AVENUE',hours:%{Monday,Tuesday,Wednesday,Friday:10:00AM-7:00PM <br> Thursday:10:00AM-8:00PM <br> Saturday:10:00AM-7:00PM <br> Sunday:12:00PM-6:00PM},phone:"310-275-4211")
Locator.create(street:'384 Post Street', city:'San Francisco',state:'CA',zip:'94108',name:'SAKS FIFTH AVENUE',hours:%{Monday through Saturday, 10:00AM-7:00PM <br> Sunday, 11:00AM-7:00PM},phone:"415-986-4300")
Locator.create(street:'611 5th Avenue', city:'New York',state:'NY',zip:'10022',name:'SAKS FIFTH AVENUE',hours:%{Monday through Saturday, 10:00AM-8:00PM <br> Sunday, 11:00AM-7:00PM},phone:"212-753-4000")
Locator.create(street:'230 Walt Whitman Road', city:'Huntington Station',state:'NY',zip:'11746',name:'SAKS FIFTH AVENUE',hours:%{Sunday:12:PM-7:00PM <br> Monday-Wednesday: 10:00AM-7:00PM <br> Thursday- Saturday:10:00AM-9:00PM},phone:"631-350-1100")


Locator.create(street:'9700 Wilshire Boulevard', city:'Beverly Hills',state:'CA',zip:'90212',name:'Neiman Marcus',hours:%{Monday-Wednesday: 10:00AM-7:00PM <br> Thursday: 10:00AM-8:00PM <br> Friday-Saturday: 10:00AM-7:00PM <br> Sunday: 12:00PM-6:00PM },phone:"310-550-5900, 877-634-6263")
Locator.create(street:'150 Stockton Street', city:'San Francisco',state:'CA',zip:'94108',name:'Neiman Marcus',hours:%{Monday-Wednesday: 10:00AM-7:00PM <br> Thursday: 10:00AM-8:00PM <br> Friday-Saturday: 10:00AM-7:00PM <br> Sunday: 12:00PM-6:00PM },phone:"415-362-3900, 877-634-6264")
Locator.create(street:'400 Stanford Shopping Center', city:'Palo Alto',state:'CA',zip:'94304',name:'Neiman Marcus',hours:%{Monday-Friday: 10:00AM-8:00PM <br> Saturday: 10:00AM-7:00PM <br> Sunday: 12:00PM-6:00PM },phone:"650-329-3300, 877-877-3907")
Locator.create(street:'7027 Friars Road', city:'San Diego',state:'CA',zip:'92108',name:'Neiman Marcus',hours:%{Monday-Friday: 10:00AM-8:00PM <br> Saturday: 10:00AM-7:00PM <br> Sunday: 12:00PM-6:00PM },phone:"619-692-9100, 800-200-0522")
Locator.create(street:'2 E Maple Ave', city:'White Plains',state:'NY',zip:'10601',name:'Neiman Marcus',hours:%{Monday-Friday: 10:00AM-8:00PM <br> Saturday: 10:00AM-7:00PM <br> Sunday: 11:00PM-6:00PM },phone:"914-428-2000, 877-634-6269")





