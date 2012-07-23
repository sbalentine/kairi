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
    puts "Finished populating the database."
  end
end