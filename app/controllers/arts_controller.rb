class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @comms = @art.coms.where(p_id: '0')
    @reps = @art.coms
  end

  # GET /arts/new
  def new
    @art = Art.new
    @tags
  end

  # GET /arts/1/edit
  def edit
  end
  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)
    @art.user = current_user
    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, :flash => { :success => "Article was successfully created." } }
        format.json { render :show, status: :created, location: @art }
      else
        format.html { render :new }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to @art, :flash => { :success => "Article was successfully updated." }}
        format.json { render :show, status: :ok, location: @art }
      else
        format.html { render :edit }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, :flash => { :success => "Article was successfully deleted." } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_params
      params.require(:art).permit(:title, :description, :user_id, :cat_id, { :tag_ids => [] })
    end
    def require_same_user
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
