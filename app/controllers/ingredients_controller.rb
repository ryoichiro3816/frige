class IngredientsController < ApplicationController
  def index
    @ingredients_pagination = Ingredient.paginate(page: params[:page], per_page: 12)
    @q = @ingredients_pagination.ransack(params[:q])
    @ingredients = @q.result.page(params[:page]).order("created_at desc")
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.image.attach(params[:ingredient][:image])
    if @ingredient.save
      redirect_to ingredients_path, notice: 'Success'
    else
      flash.now[:alert] = "Error"
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.image.attach(params[:ingredient][:image])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      flash.now[:alert] = "Error"
      render 'edit'
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    flash.now[:success] = "Movie deleted"
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :expiry, :number, :amount, :image)
  end

end
