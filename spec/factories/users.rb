FactoryGirl.define do
  factory :user do
    name                  'testuser'
    email                 'admin@shift-reservation.com'
    password              'smartvm'
    password_confirmation 'smartvm'
    admin                 false

    factory :admin do
      admin true
    end
  end
end
