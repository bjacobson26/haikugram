class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :create] 

  def index
    @haikus = Haiku.all
  end

  def show
  end

  def new
    @haiku = Haiku.new
  end

  def edit
  end

  def create
    @haiku = Haiku.new(haiku_params)

    respond_to do |format|
      if @haiku.save
        format.html { redirect_to @haiku, notice: 'Haiku was successfully created.' }
        format.json { render :show, status: :created, location: @haiku }
      else
        format.html { render :new }
        format.json { render json: @haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /haikus/1
  # PATCH/PUT /haikus/1.json
  def update
    respond_to do |format|
      if @haiku.update(haiku_params)
        format.html { redirect_to @haiku, notice: 'Haiku was successfully updated.' }
        format.json { render :show, status: :ok, location: @haiku }
      else
        format.html { render :edit }
        format.json { render json: @haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /haikus/1
  # DELETE /haikus/1.json
  def destroy
    @haiku.destroy
    respond_to do |format|
      format.html { redirect_to haikus_url, notice: 'Haiku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_haiku
      @haiku = Haiku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def haiku_params
      params.require(:haiku).permit(:title, :first_line, :second_line, :third_line, :user_id)
    end
end
