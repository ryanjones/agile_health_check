FactoryGirl.define do
  factory :agile_team do
    name "Agile Team #1"
    kind :agile_team
  end

  factory :product_agile_team do
    name "Product Team #1"
    kind :product_team
  end
end