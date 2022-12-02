namespace :dev do
  desc "Configura o ambiente de dev"
  task setup: :environment do
    puts "Cadastrando..."
    10.times do
      author = Author.create!(
        name: Faker::Name.name,
        age: Faker::Date.between(from: 50.years.ago, to: 20.years.ago),
        main_gender: Faker::Book.genre
      )

      5.times do
        Book.create!(
          title: Faker::Book.title,
          description: Faker::Quote.yoda,
          gender: Faker::Book.genre,
          author_id: author.id,
          publish_date: Faker::Date.between(from: 20.years.ago, to: 5.years.ago),
          publishing_company: Faker::Book.publisher
        )
      end
    end
    puts "Cadastrado..."
  end

end
