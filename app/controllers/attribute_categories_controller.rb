# Controller for the AttributeCategor model
class AttributeCategoriesController < ApplicationController
  before_action :set_attribute_category, only: [:show, :edit, :update, :destroy]
  before_action :set_character_attributes, only: :show

  # GET /attribute_categories
  # GET /attribute_categories.json
  def index
    @attribute_categories = AttributeCategory.all
  end

  # GET /attribute_categories/1
  # GET /attribute_categories/1.json
  def show
  end

  # GET /attribute_categories/new
  def new
    @attribute_category = AttributeCategory.new
  end

  # GET /attribute_categories/1/edit
  def edit
  end

  # POST /attribute_categories
  # POST /attribute_categories.json
  def create
    @attribute_category = AttributeCategory.new(attribute_category_params)

    respond_to do |format|
      if @attribute_category.save
        format.html do
          redirect_to @attribute_category,
                      notice: 'Attribute category was successfully created.'
        end
        format.json { render :show, status: :created, location: @attribute_category }
      else
        format.html { render :new }
        format.json { render json: @attribute_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attribute_categories/1
  # PATCH/PUT /attribute_categories/1.json
  def update
    respond_to do |format|
      if @attribute_category.update(attribute_category_params)
        format.html do
          redirect_to @attribute_category,
                      notice: 'Attribute category was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @attribute_category }
      else
        format.html { render :edit }
        format.json { render json: @attribute_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribute_categories/1
  # DELETE /attribute_categories/1.json
  def destroy
    @attribute_category.destroy
    respond_to do |format|
      format.html do
        redirect_to attribute_categories_url,
                    notice: 'Attribute category was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attribute_category
    @attribute_category = AttributeCategory.find(params[:id])
  end

  def set_character_attributes
    @character_attributes = @attribute_category.character_attributes.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attribute_category_params
    params.require(:attribute_category).permit(:name)
  end
end
