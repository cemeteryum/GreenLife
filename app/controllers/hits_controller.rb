class HitsController < ApplicationController
  before_action :set_hit, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /hits
  # GET /hits.json
  def index
    @hits = Hit.all
  end

  # GET /hits/1
  # GET /hits/1.json
  def show
  end

  # GET /hits/new
  def new
    @hit = Hit.new
  end

  # GET /hits/1/edit
  def edit
  end

  # POST /hits
  # POST /hits.json
  def create
    @chal = Chal.find(params[:chal_id])
    @hit = Hit.new(hit_params)
    @hit.user = current_user
    @hit.chal = @chal
    respond_to do |format|
      if @hit.save
        format.html { redirect_to @chal, notice: 'Hit was successfully created.' }
        format.json { render :show, status: :created, location: @hit }
      else
        format.html { render :new }
        format.json { render json: @hit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hits/1
  # PATCH/PUT /hits/1.json
  def update
    respond_to do |format|
      if @hit.update(hit_params)
        format.html { redirect_to @chal, notice: 'Hit was successfully updated.' }
        format.json { render :show, status: :ok, location: @hit }
      else
        format.html { render :edit }
        format.json { render json: @hit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hits/1
  # DELETE /hits/1.json
  def destroy
    @hit.destroy
    respond_to do |format|
      format.html { redirect_to chals_url(@chal), notice: 'Hit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hit
      @hit = Hit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hit_params
      params.require(:hit).permit(:text, :user_id, :chal_id, :p_id)
<<<<<<< HEAD
    end
    def require_same_user
			unless current_user == @chal.user or current_user.admin?
				flash[:danger] = "You can only edit your delete your own articles"
				redirect_to chals_path
			end
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
=======
>>>>>>> 85c605cb2e57abdc3d88b2e6318f287b0642a9cc
    end
end
