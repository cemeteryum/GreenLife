class ChalsController < ApplicationController
  before_action :set_chal, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy, :like]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /chals
  # GET /chals.json
  def index
    @chals = Chal.all
    if params[:cat_id]
      @cat = Cat.find(params[:cat_id])
      @chals = Chal.all.where(cat_id: @cat.id)
    end
  end

  # GET /chals/1
  # GET /chals/1.json
  def show
    @comms = @chal.hits.where(p_id: '0')
    @reps = @chal.hits
  end

  # GET /chals/new
  def new
    @chal = Chal.new
  end

  # GET /chals/1/edit
  def edit
  end

  # POST /chals
  # POST /chals.json
  def create
    @chal = Chal.new(chal_params)
    @chal.user = current_user
    respond_to do |format|
      if @chal.save
        format.html { redirect_to @chal, notice: 'Chal was successfully created.' }
        format.json { render :show, status: :created, location: @chal }
      else
        format.html { render :new }
        format.json { render json: @chal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chals/1
  # PATCH/PUT /chals/1.json
  def update
    respond_to do |format|
      if @chal.update(chal_params)
        format.html { redirect_to @chal, notice: 'Chal was successfully updated.' }
        format.json { render :show, status: :ok, location: @chal }
      else
        format.html { render :edit }
        format.json { render json: @chal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chals/1
  # DELETE /chals/1.json
  def destroy
    @chal.destroy
    respond_to do |format|
      format.html { redirect_to chals_url, notice: 'Chal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def like
    @chal = Chal.find(params[:id])
    like = Challike.create(like: params[:like], user: current_user, chal: @chal)
    if like.valid?
      flash[:success] = "Your selection was successful"
      redirect_to :back
    else
      flash[:danger] = "Your can only like/dislike once"
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chal
      @chal = Chal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chal_params
      params.require(:chal).permit(:name, :reg, :dur, :user_id, :cat_id, { :tag_ids => [] })
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
    end
end
