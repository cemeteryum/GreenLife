class ComsController < ApplicationController
  before_action :set_com, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /coms
  # GET /coms.json
  def index
    @coms = Com.all
  end

  # GET /coms/1
  # GET /coms/1.json
  def show
  end

  # GET /coms/new
  def new
    @com = Com.new
  end

  # GET /coms/1/edit
  def edit
  end

  # POST /coms
  # POST /coms.json
  def create
    @art = Art.find(params[:art_id])
    @com = Com.new(com_params)
    @com.user = current_user
    @com.art = @art
    respond_to do |format|
      if @com.save
        format.html { redirect_to @art, :flash => { :success => "Comment was successfully added." } }
        format.json { render :show, status: :created, location: @com }
      else
        format.html { redirect_to @art, :flash => { :danger => "Text must not be blank" } }
        format.json { render json: @com.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coms/1
  # PATCH/PUT /coms/1.json
  def update
    respond_to do |format|
      if @com.update(com_params)
        format.html { redirect_to @art, notice: 'Com was successfully updated.' }
        format.json { render :show, status: :ok, location: @com }
      else
        format.html { render :edit }
        format.json { render json: @com.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coms/1
  # DELETE /coms/1.json
  def destroy
    @com.destroy
    respond_to do |format|
      format.html { redirect_to @art, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_com
      @com = Com.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def com_params
      params.require(:com).permit(:text, :user_id, :art_id, :p_id)
    end
    def require_same_user
      @art = Art.find(params[:art_id])
			unless current_user == @art.user or current_user.admin?
				flash[:danger] = "You can only edit your delete your own articles"
				redirect_to arts_path
			end
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
