class RecipesController < ApplicationController
    before_action :authenticate_user!
    def index
        @recipes = current_user.recipes.order(id: :desc)
    end

    def show 
     @recipe = current_user.recipes.find(params[:id])
     @ingredient = Ingredient.where(recipe_id: @recipe.id).includes([:food])
    end

    def new 
       @recipe = current_user.recipes.build
       @foods = Food.all

    end

    def edit
      @recipe.ingredients.build
    end

    def create
        @recipe = current_user.recipes.build(input_verify)
        if @recipe.save 
         flash[:notice] = "Recipe created succesfully"
         redirect_to recipes_path
        else
            flash[:alert] = "Error while saving Recipe"
            render :new
        end
    end

   

    def update
      @recipe = Recipe.find(params[:id])
      @recipe.update(public: !@recipe.public)
      if @recipe.update(input_verify)
        redirect_to recipe_path(@recipe), notice: "Instructions updated successfully."
      else
        render :edit
      end
    end

    
     def destroy
      @recipe = current_user.recipes.find(params[:id])
       if @recipe.destroy
         flash[:notice] = "Deleted succesfully #{@recipe}"
         redirect_to recipes_path
       else
        flash[:alert] = "Error deleting record"
       end
    end

    private 
    def input_verify
      @recipe = params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description,
      ingredients_attribute:[:id, :quantity, :_destroy])
    end
  end
