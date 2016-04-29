User.create!(name:  "Admin",
             email: "admin@bed.me",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Ciaran Ashton",
             email: "ca448@bath.ac.uk",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name: "Robert Derbyshire",
             email: "rjd40@bath.ac.uk",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
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

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

Property.create!(addressLine1:  "47 New King Street",
                 addressLine2:  "Flat 4",
                 town:          "Bath",
                 county:        "Somerset",
                 postcode:      "BA2 3BN",
                 img:           seed_image("house1"))
                 
Property.create!(addressLine1:  "8 Lower Oldfield Park",
                 addressLine2:  "Room 5",
                 town:          "Bath",
                 county:        "Somerset",
                 postcode:      "BA2 3HL",
                 img:           seed_image("house2"))

property = Property.first
users_count = User.count

5.times do |n|
    randUser1 = User.second
    content = Faker::Lorem.sentence(5)
    property.comments.create!(user_id: randUser1.id, content: content)
    randUser2 = User.third
    content = Faker::Lorem.sentence(5)
    property.comments.create!(user_id: randUser2.id, content: content)
end

    randUser1 = User.second
    content = Faker::Lorem.paragraph(5)
    property.reviews.create!(user_id: randUser1.id, reviewText: content, 
                             rating_area: 1, rating_cost: 2, 
                             rating_landlord: 3, rating_cleanliness: 4)
