class Allergies

  ALLERGIES_HASH = {
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128
  }

  def initialize(allergy_num)
    @allergy_num = allergy_num
  end

  def allergic_to?(allergen)
    bitwise_result = @allergy_num & ALLERGIES_HASH[allergen]
    bitwise_result > 0
  end

  def list
    ALLERGIES_HASH.keys.select do |allergen|
      allergic_to?(allergen)
    end
  end

end
