FactoryGirl.define do
  factory :memo do
    body "MyText"
    public false
    user nil
    book nil
  end
end
