 class UsersController < ApplicationController
   respond_to :html
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    # GET /users.json
    def index
      # binding.pry
      @users = User.all
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
      @url = user_path(@user)
    end

    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      if @user.update(user_params)
        flash[:notice] = t('admin.users.update.success')
        respond_with :edit, :admin, @user
      else
        flash[:warning] = @user.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :user
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path, notice: t('admin.users.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
  end
