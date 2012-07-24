namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    puts "Populating the database with 100 users..."
    admin = User.create!(name: "Scott Balentine",
                 email: "scott@kairi-inc.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@kairi-inc.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    puts "Populating the database with 100 messages"
    users = User.all(limit: 6)
    100.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
    puts "Finished populating the database."
  end
end