# Controller for the CharacterType model
class CharacterTypesController < ApplicationController
  before_action :set_character_type, only: [:show, :edit, :update, :destroy]
  before_action :set_castes, only: :show

  # GET /character_types
  # GET /character_types.json
  def index
    @character_types = CharacterType.all
  end

  # GET /character_types/1
  # GET /character_types/1.json
  def show
  end

  # GET /character_types/new
  def new
    @character_type = CharacterType.new
  end

  # GET /character_types/1/edit
  def edit
  end

  # POST /character_types
  # POST /character_types.json
  def create
    @character_type = CharacterType.new(character_type_params)

    respond_to do |format|
      if @character_type.save
        format.html do
          redirect_to @character_type,
                      notice: 'Character type was successfully created.'
        end
        format.json { render :show, status: :created, location: @character_type }
      else
        format.html { render :new }
        format.json { render json: @character_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_types/1
  # PATCH/PUT /character_types/1.json
  def update
    respond_to do |format|
      if @character_type.update(character_type_params)
        format.html do
          redirect_to @character_type,
                      notice: 'Character type was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @character_type }
      else
        format.html { render :edit }
        format.json { render json: @character_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_types/1
  # DELETE /character_types/1.json
  def destroy
    @character_type.destroy
    respond_to do |format|
      format.html do
        redirect_to character_types_url,
                    notice: 'Character type was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_type
    @character_type = CharacterType.find(params[:id])
  end

  def set_castes
    @castes = @character_type.castes.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def character_type_params
    params.require(:character_type).permit(:name)
  end
end
