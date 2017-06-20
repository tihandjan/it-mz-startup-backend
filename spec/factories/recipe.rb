FactoryGirl.define do
  factory :recipe do
    title Faker::Lorem.word
    summary Faker::Lorem.word
    image { fixture_file_upload(Rails.root.join('spec', 'test_images', 'test.jpg'), 'image/png') }
  end
end