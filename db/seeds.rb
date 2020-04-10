# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ev1 = EventVenue.create!(name: "Estadio San Carlos de Apoquindo",
                     address: "Circunvalación Las Flores 13000, Las Condes, Región Metropolitana",
                     capacity: 10)
ev2 = EventVenue.create!(name: "Velódromo Estadio Nacional",
                     address: "Av. Pedro de Valdivia 5140. Santiago, Chile",
                     capacity: 10000)

e1 = Event.create!(name: "Deep Purple en Chile",
               event_venue: ev1,
              description: "Gira de despedida",
              start_date: DateTime.parse("2020-04-02 19:00:00 UTC-4"))

EventStat.create(event: e1)

e2 = Event.create!(name: "Pearl Jam en Chile",
               event_venue: ev2,
              description: "Pearl Jam 2020 Tour",
              start_date: DateTime.parse("2020-04-07 19:00:00 UTC-4"))

EventStat.create(event: e2)

tt1 = TicketType.create!(event: e1, ticket_price: 30000, description: "Cancha")
tt2 = TicketType.create!(event: e1, ticket_price: 100000, description: "Golden")

tt3 = TicketType.create!(event: e2, ticket_price: 30000, description: "Cancha")
tt4 = TicketType.create!(event: e2, ticket_price: 100000, description: "Golden")

c1 = Customer.create!(name: "Eurípides", lastname: "Neanderthal",
                  email:"neanderthal@hotmail.com",
                  phone:"+56932347282",
                  password:"123123123",
                  address:"El Pozo 123, Ñuñoa, Santiago, Chile")

t1 = Ticket.create(ticket_type: tt1)
t2 = Ticket.create(ticket_type: tt2)
t3 = Ticket.create(ticket_type: tt3)
t4 = Ticket.create(ticket_type: tt4)
t5 = Ticket.create(ticket_type: tt1)
t6 = Ticket.create(ticket_type: tt1)
t7 = Ticket.create(ticket_type: tt1)
t8 = Ticket.create(ticket_type: tt1)
t9 = Ticket.create(ticket_type: tt1)
t10 = Ticket.create(ticket_type: tt1)
t11 = Ticket.create(ticket_type: tt1)
t12 = Ticket.create(ticket_type: tt1)


o1 = Order.new(customer: c1)
o1.tickets << t1
o1.tickets << t2
o1.tickets << t3
o1.tickets << t4
o1.tickets << t5
o1.tickets << t6
o1.tickets << t7
o1.tickets << t8
o1.tickets << t9
o1.tickets << t10
o1.tickets << t11
o1.tickets << t12

o1.save!
