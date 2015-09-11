FactoryGirl.define do
  factory :meal do
    name "Cheese on Toast"
    imageURL "http://imageurl.com"
    cooking_instructions "Put toast in the toaster!"
    likes 1
    dislikes 2
  end
end
