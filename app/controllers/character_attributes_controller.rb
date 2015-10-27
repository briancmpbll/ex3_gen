class CharacterAttributesController < ApplicationController
  before_action :set_attribute_category
  before_action :set_character_attribute, only: [:show, :edit, :update, :destroy]

  # GET /character_attributes
  # GET /character_attributes.json
  def index
    @character_attributes = @attribute_category.character_attributes
  end

  # GET /character_attributes/1
  # GET /character_attributes/1.json
  def show
  end

  # GET /character_attributes/new
  def new
    @character_attribute = CharacterAttribute.new
  end

  # GET /character_attributes/1/edit
  def edit
  end

  # POST /character_attributes
  # POST /character_attributes.json
  def create
    @character_attribute = @attribute_category.character_attributes.new(character_attribute_params)

    respond_to do |format|
      if @character_attribute.save
        format.html { redirect_to [@attribute_category], notice: 'Attribute was successfully created.' }
        format.json { render :show, status: :created, location: @character_attribute }
      else
        format.html { render :new }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_attributes/1
  # PATCH/PUT /character_attributes/1.json
  def update
    respond_to do |format|
      if @character_attribute.update(character_attribute_params)
        format.html { redirect_to [@attribute_category], notice: 'Attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_attribute }
      else
        format.html { render :edit }
        format.json { render json: @character_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_attributes/1
  # DELETE /character_attributes/1.json
  def destroy
    @character_attribute.destroy
    respond_to do |format|
      format.html { redirect_to attribute_category_character_attributes_url, notice: 'Attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_category
      @attribute_category = AttributeCategory.find(params[:attribute_category_id])
    end

    def set_character_attribute
      @character_attribute = @attribute_category.character_attributes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_attribute_params
      params.require(:character_attribute).permit(:name)
    end
end
