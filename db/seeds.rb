User.create!(name:  "Admin",
             email: "admin@bed.me",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@bed.me"
  password = "password"
  User.create!( name:  name,
                email: email,
                password:              password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now)
end

Property.create!(addressLine1:  "47 New King Street",
                 addressLine2:  "Flat 4",
                 town:          "Bath",
                 country:       "UK",
                 postcode:      "BA2 3BN")

properties = Property.order(:created_at).take(1)
#users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  properties.each { |property| property.comments.create!(user_id: 1, content: content) }
end