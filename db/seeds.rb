# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning reviews...'
Review.destroy_all
puts 'Cleaning rents...'
Rent.destroy_all
puts 'Cleaning offers...'
Offer.destroy_all
puts 'Cleaning users...'
User.destroy_all

puts 'creating users...'
User.create!(email: 'hflobo@gmail.com',
          password: '123456'
          )

User.create!(email: 'hugo@fuscolobo.com.br',
        password: '123456'
          )
User.create!(email: 'joao@email.com',
         password: '123456'
            )

User.create!(email: 'marina@email.com',
          password: '123456'
            )

User.create!(email: 'hugo@email.com',
          password: '123456'
            )

User.create!(email: 'admin@email.com',
          password: '123456'
              )

puts 'Creating offers...'
names = %w[vestido camisa saia calça sapato ]
colors = %w[vermelho preto azul pink amarelo verde]
descriptions = %w[lindo gracioso divino maravilhoso estiloso]
types = %w[dress pants shoes skirt shirt]
styles = %w[formal casual sport home dressed-to-kill]

1..20.times do |i|
  puts "creating offer #{i + 1}..."
  name = "#{names.sample} #{colors.sample}"
  offer = Offer.create!(name: name,
            description: "#{descriptions.sample} #{name}",
            offer_type: types.sample,
            size: %w[S M L XL XXL].sample,
            gender: ['F', 'M'].sample,
            style: styles.sample,
            price_per_day: rand(20..40),
            user_id: rand(User.first.id..User.last.id)
            )

  puts "creating rents..."
  rand(0..5).times do |j|
    date = Faker::Date.backward(days: 30)
    # puts date.to_s
    # puts (date + rand(1..10)).to_s
    rent = Rent.create!(begin_date: date,
          final_date: date + rand(1..10),
          price: rand(20..40),
          user_id: rand(User.first.id..User.last.id),
          offer_id: offer.id
      )

    rand(0..1).times do |x|
      puts "creating review #{x + 1}"
      Review.create!(rating: rand(1..5),
                content: Faker::ChuckNorris.fact,
                user_id: rand(User.first.id..User.last.id),
                rent_id: rent.id
      )
    end
  end

end

puts "Ok. time to rent!"
