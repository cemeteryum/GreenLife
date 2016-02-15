class TreatsController < ApplicationController
  before_action :set_treat, only: [:show, :edit, :update, :destroy]

  # GET /treats
  # GET /treats.json
  def index
    @treats = Treat.all
  end

  # GET /treats/1
  # GET /treats/1.json
  def show
  end

  # GET /treats/new
  def new
    @treat = Treat.new
  end

  # GET /treats/1/edit
  def edit
  end

  # POST /treats
  # POST /treats.json
  def create
    @treat = Treat.new(treat_params)

    respond_to do |format|
      if @treat.save
        format.html { redirect_to @treat, notice: 'Treat was successfully created.' }
        format.json { render :show, status: :created, location: @treat }
      else
        format.html { render :new }
        format.json { render json: @treat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treats/1
  # PATCH/PUT /treats/1.json
  def update
    respond_to do |format|
      if @treat.update(treat_params)
        format.html { redirect_to @treat, notice: 'Treat was successfully updated.' }
        format.json { render :show, status: :ok, location: @treat }
      else
        format.html { render :edit }
        format.json { render json: @treat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treats/1
  # DELETE /treats/1.json
  def destroy
    @treat.destroy
    respond_to do |format|
      format.html { redirect_to treats_url, notice: 'Treat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treat
      @treat = Treat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treat_params
      params.require(:treat).permit(:name, :md, :sym, :reg, :user_id, :cat_id)
    end
end
