# Controller for the Caste model
class CastesController < ApplicationController
  before_action :set_character_type, only: [:index, :new, :create]
  before_action :set_caste, only: [:show, :edit, :update, :destroy]
  before_action :set_abilities, only: :show
  before_action :set_anima_effects, only: :show

  # GET /castes
  # GET /castes.json
  def index
    @castes = @character_type.castes
  end

  # GET /castes/1
  # GET /castes/1.json
  def show
  end

  # GET /castes/new
  def new
    @caste = Caste.new
  end

  # GET /castes/1/edit
  def edit
  end

  # POST /castes
  # POST /castes.json
  def create
    @caste = @character_type.castes.new(caste_params)

    respond_to do |format|
      if @caste.save
        format.html { redirect_to [@character_type], notice: 'Caste was successfully created.' }
        format.json { render :show, status: :created, location: @caste }
      else
        format.html { render :new }
        format.json { render json: @caste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /castes/1
  # PATCH/PUT /castes/1.json
  def update
    respond_to do |format|
      if @caste.update(caste_params)
        format.html { redirect_to [@caste], notice: 'Caste was successfully updated.' }
        format.json { render :show, status: :ok, location: @caste }
      else
        format.html { render :edit }
        format.json { render json: @caste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castes/1
  # DELETE /castes/1.json
  def destroy
    @caste.destroy
    respond_to do |format|
      format.html do
        redirect_to [@caste.character_type],
                    notice: 'Caste was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_type
    @character_type = CharacterType.find(params[:character_type_id])
  end

  def set_caste
    @caste = Caste.includes(:abilities).find(params[:id])
  end

  def set_abilities
    @abilities = @caste.abilities
  end

  def set_anima_effects
    @anima_effects = @caste.anima_effects
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def caste_params
    params.require(:caste).permit(:name, ability_ids: [])
  end
end
