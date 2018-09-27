FactoryBot.define do
  factory :course  do
    title {Faker::Lorem.word}
    description {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph }
  end
end
