FactoryGirl.define do
require 'faker'
  factory :message do
    body  { Faker::Lorem.sentence }
    image   Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/68.jpg'))
    user
    group
    end
end
