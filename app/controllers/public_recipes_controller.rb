class PublicRecipesController < ApplicationController

    def index
     @recipes = current_user.recipes.where(public: true).order(created_at: :desc)
    end
end
