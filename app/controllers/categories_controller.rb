class CategoriesController < ApplicationController

  before_action :require_login

  def index
    @categories=Category.order(name: :asc)
  end

  def new
    @category=Category.new
  end

  def create
  	@category=Category.new(category_params)
    @category.slug=@category.name.downcase.gsub(/[^0-9a-z]/i,"-")

  	if @category.save
      redirect_to categories_path, notice: "Category has been added"
  	else
  	  render 'new'
  	end
  end

  def edit
  	@category=Category.find_by_id(params[:id])
  	redirect_to categories_path unless @category
  end

  def update
  	@category=Category.find_by_id(params[:id])
    redirect_to categories_path unless @category
    
    cat_params=category_params
    cat_params[:slug]=params[:category][:name].downcase.gsub(/[^0-9a-z]/i,"-")

    #another workaround
    #@category.attributes(category_params)
    #@category.slug=@category.name.downcase.gsub(" ","-")
    #@category.save

  	if @category.update_attributes(cat_params)
  	  redirect_to categories_path, notice: "Category has been modified"
  	else
  	  render 'edit'
  	end
  end

  private
  def category_params
  	params.require(:category).permit(:name, :description)
  end

end
