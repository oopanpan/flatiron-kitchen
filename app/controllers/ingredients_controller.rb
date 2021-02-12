class IngredientsController < ApplicationController

    before_action :find_ingredient, only: [:show, :edit, :update]

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingre_params)
        if @ingredient.save
            redirect_to @ingredient
        else
            render :new
        end
    end

    def update
        if @ingredient.update(ingre_params)
            redirect_to @ingredient
        else
            render :edit
        end
    end


    private

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingre_params
        params.require(:ingredient).permit(:name)
    end
end
