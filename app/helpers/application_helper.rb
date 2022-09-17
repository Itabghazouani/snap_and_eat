module ApplicationHelper
    def restaurant_img(restaurant)
      if restaurant.cuisine.downcase.include? 'french'
        image_path "french-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'italian'
        image_path "italian-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'mediterranean'
        image_path "mediterranean-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'peruvian'
        image_path "peruvian-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'mexican'
        image_path "mexican-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'mediterranean'
        image_path "mediterranean-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'fast food'
        image_path "fast-food.jpg"
      elsif restaurant.cuisine.downcase.include? 'japanese'
        image_path "japanese-food.jpg"
      end
    end
end
