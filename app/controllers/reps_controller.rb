class RepsController < ApplicationController
  before_action :set_rep, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /reps
  # GET /reps.json
  def index
    @reps = Rep.all
  end

  # GET /reps/1
  # GET /reps/1.json
  def show
  end

  # GET /reps/new
  def new
    @rep = Rep.new
  end

  # GET /reps/1/edit
  def edit
  end

  # POST /reps
  # POST /reps.json
  def create
    @treat = Treat.find(params[:treat_id])
    @rep = Rep.new(rep_params)
    @rep.user = current_user
    @rep.treat = @treat
    respond_to do |format|
      if @rep.save
        format.html { redirect_to @treat, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @rep }
      else
        format.html { redirect_to @treat, :flash => { :danger => "Text must not be blank" } }
        format.json { render json: @rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reps/1
  # PATCH/PUT /reps/1.json
  def update
    respond_to do |format|
      if @rep.update(rep_params)
        format.html { redirect_to @treat, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @rep }
      else
        format.html { render :edit }
        format.json { render json: @rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reps/1
  # DELETE /reps/1.json
  def destroy
    @rep.destroy
    respond_to do |format|
      format.html { redirect_to @treat, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rep
      @rep = Rep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rep_params
      params.require(:rep).permit(:text, :user_id, :treat_id, :p_id)
    end
    def require_same_user
      @treat = Treat.find(params[:treat_id])
			unless current_user == @treat.user or current_user.admin?
				flash[:danger] = "You can only edit your delete your own articles"
				redirect_to treats_path
			end
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
