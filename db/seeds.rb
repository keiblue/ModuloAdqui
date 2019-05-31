# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Service.create( name:'Contrucción' )
Service.create( name:'Telefónica' )

Address.create( region:'Metropolitana', comuna:'Santiago', calle:'Av. Américo Vespucio', numero:7310 )
Address.create( region:'Metropolitana', comuna:'Santiago', calle:'José Pedro Alessandri', numero:6402 )

Agreement.create( code:1111, start_date:'2019-01-01', end_date:'2019-02-01' )
Agreement.create( code:1122, start_date:'2019-01-20', end_date:'2019-02-10' )

Provider.create( name:'Los Kuma', rut:'11456234', rut_dv:'k', address_id:1, service_id:1, agreement_id:1 )
Provider.create( name:'Sodimac', rut:'08642187', rut_dv:'1',  address_id:2, service_id:2, agreement_id:2 )

Status.create( status:'Almacenado' )
Status.create( status:'Espera' )

Role.create( role_name:'Administrador' )
Role.create( role_name:'Empleado' )

User.create( email: "admin@email.com", password: "password", password_confirmation: "password", rutito:"12345678", name:"Adam", last_name:"Admin", role_id:1, rutito_dv:"2" )
User.create( email: "esclavo@email.com", password: "password", password_confirmation: "password", rutito:"23456789", name:"Dead", last_name:"Slave", role_id:2, rutito_dv:"2" )

Store.create( name:'Pedro el Comerciante', address_id:1 )
Store.create( name:'Don Lalo', address_id:2 )

Item.create( nombre:'item 1', precio:1000, provider_id:1 )
Item.create( nombre:'item 2', precio:1500, provider_id:2 )

Order.create( user_id:1, provider_id:1, status_id:1, store_id:1 )
Order.create( user_id:2, provider_id:2, status_id:2, store_id:2 )

