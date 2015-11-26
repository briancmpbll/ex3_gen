# Controller for the AnimaEffect model
class AnimaEffectsController < ApplicationController
  before_action :set_parent
  before_action :set_anima_effect, only: [:show, :edit, :update, :destroy]

  # GET /anima_effects
  # GET /anima_effects.json
  def index
    @anima_effects = @parent.anima_effects
  end

  # GET /anima_effects/1
  # GET /anima_effects/1.json
  def show
  end

  # GET /anima_effects/new
  def new
    @anima_effect = AnimaEffect.new
  end

  # GET /anima_effects/1/edit
  def edit
  end

  # POST /anima_effects
  # POST /anima_effects.json
  def create
    @anima_effect = @parent.anima_effects.new(anima_effect_params)

    respond_to do |format|
      if @anima_effect.save
        format.html { redirect_to [@parent], notice: 'Anima Effect was successfully created.' }
        format.json { render :show, status: :created, location: @anima_effect }
      else
        format.html { render :new }
        format.json { render json: @anima_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anima_effects/1
  # PATCH/PUT /anima_effects/1.json
  def update
    respond_to do |format|
      if @anima_effect.update(anima_effect_params)
        format.html { redirect_to [@parent], notice: 'Anima Effect was successfully updated.' }
        format.json { render :show, status: :ok, location: @anima_effect }
      else
        format.html { render :edit }
        format.json { render json: @anima_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anima_effects/1
  # DELETE /anima_effects/1.json
  def destroy
    @anima_effect.destroy
    respond_to do |format|
      format.html do
        redirect_to list_url,
                    notice: 'Anima Effect was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent
    if params.key?(:caste_id)
      @parent = Caste.find(params[:caste_id])
    else
      @parent = CharacterType.find(params[:character_type_id])
    end
  end

  def set_anima_effect
    @anima_effect = AnimaEffect.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def anima_effect_params
    params.require(:anima_effect).permit(:condition, :effect)
  end

  def list_url
    if @parent.is_a?(CharacterType)
      character_type_anima_effects_url
    else
      character_type_caste_anima_effects_url
    end
  end
end
