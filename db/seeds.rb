# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts("### Criando Admins")
Admin.create!(full_name: 'Maria', cpf: '12344444901', email: 'maria@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Gabriel', cpf: '10123478901', email: 'gabriel@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Mateus Cézar', cpf: '99023478901', email: 'mateus@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Fábio Júnior', cpf: '01211278901', email: 'fabiojr@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Márcia', cpf: '19122228921', email: 'marcia@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Márcio', cpf: '29133378921', email: 'marcio@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Agatha', cpf: '39116478921', email: 'agatha@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Vlad', cpf: '49141478921', email: 'vlad@userubis.com.br', password: '123456')
Admin.create!(full_name: 'Júlio', cpf: '95145478921', email: 'julio@userubis.com.br', password: '123456')

puts("### Criando Aprovações de admin")
Approval.create!(super_admin_email: "maria@userubis.com.br", admin: Admin.find(3))
Approval.create!(super_admin_email: 'gabriel@userubis.com.br', admin: Admin.find(3))
Approval.create!(super_admin_email: "maria@userubis.com.br", admin: Admin.find(4))
Approval.create!(super_admin_email: 'gabriel@userubis.com.br', admin: Admin.find(4))
Approval.create!(super_admin_email: "maria@userubis.com.br", admin: Admin.find(5))
Approval.create!(super_admin_email: 'gabriel@userubis.com.br', admin: Admin.find(6))

puts("### Criando Taxas de Câmbio")
ExchangeRate.create!(real: 29.9, admin: Admin.find(4))
ExchangeRate.create!(real: 31.9, admin: Admin.find(4))
ExchangeRate.create!(real: 32.9, admin: Admin.find(3))

puts("### Criando Aprovação de Taxa de Câmbio")
ExchangeRateApproval.create(admin: Admin.find(4), exchange_rate: ExchangeRate.find(1))
ExchangeRateApproval.create(admin: Admin.find(3), exchange_rate: ExchangeRate.find(1))
ExchangeRateApproval.create(admin: Admin.find(4), exchange_rate: ExchangeRate.find(2))
ExchangeRateApproval.create(admin: Admin.find(3), exchange_rate: ExchangeRate.find(2))

puts("### Criando limite de crédito diário")
DailyCreditLimit.create!(value: 22)
