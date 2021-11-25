require_relative "CajeroPOO.rb"
require "faker"
#generar nombre de usuario
name1 = Faker::Name.name 
#generacion cta_ahorros, retiros y lna de credito 
savings1= Faker::Number.between(from: 500, to: 9999)
wd1 = Faker::Number.between(from: 1, to: 10000)
wd2 = Faker::Number.between(from: 1, to: 10000)
linea_cred = Faker::Number.between(from: 10000, to: 20000)

user = Cajero.new(name1,savings1,linea_cred)
user.consulta
user.depositar(50,"ahorro")
user.depositar(500,"ahorro")
user.retirar("credito",wd1)
user.retirar("credito",wd2)
user.consulta

name2 = name1 = Faker::Name.name 
savings2= Faker::Number.between(from: 500, to: 9999)
wd3 = Faker::Number.between(from: 1, to: 10000)
depo = Faker::Number.between(from: 1, to: 10000)
linea_cred2 = Faker::Number.between(from: 10000, to: 20000)

user2 = Cajero.new(name1,savings2,linea_cred2)
user2.consulta
user2.depositar(depo,"ahorro")
user2.retirar("credito",wd3)
user.consulta
