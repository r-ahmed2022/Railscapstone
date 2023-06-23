class ShoppingListsController < ApplicationController
    def index
        @recipes = current_user.recipes
        @total = 0
        @total_price = 0
        @food_items = []
        @ingredients = Ingredient.where(recipes: @recipes)
    
        @ingredients.each do |ingredient|
          quantity = ingredient.food.quantity - ingredient.quantity
          @food_items << ingredient
          @total += 1
          @total_price += quantity * ingredient.food.price
        end
      end
end