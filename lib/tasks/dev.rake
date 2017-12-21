namespace :dev do 
  task fake: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        tel: FFaker::PhoneNumber.short_phone_number,
        opening_hours: FFaker::Time.datetime,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        image: File.open(Rails.root.join("app/assets/images/#{rand(0...20)}.jpg"))
        )
    end
    puts "have create fake restaurants."
    puts "now you have #{Restaurant.count} restaurants data."
  end
end