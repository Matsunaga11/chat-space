FactoryGirl.define do

  factory :message do
    body  "aaaaaaaaaaaaa"
    image   Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/68.jpg'))
    user
    group
    end
end
