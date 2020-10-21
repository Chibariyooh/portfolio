class UsersController < ApplicationController
    before_action :set_user,only: [:show,:edit,:update]
    before_action :authenticate_user!


    def index
        @user = User.all 
        @skill = Skill.all
    end

    def new
        @user = User.new
        @skill = Skill.new
    end

    def create
        @user = User.create(user_params)
    end

    def show
        @user = User.find(params[:id])
        @users = User.all
        @skill = @users.user_skills.find(skill_id: params[:skill_id])
    end

    def edit
        @user = User.find(params[:id])
        unless @user == current_user
        redirect_to user_path(@user)
        end
        @skill = Skill.all
    end

    def destroy 
        user = User.find(params[:id])
        user.destroy
        redirect_to root_url
    end

    def update
        @user = User.find(params[:id])  
        @user.update(user_params)  
        if current_user.update(user_params)
            redirect_to user_path(current_user)
        else
            redirect_to edit_user_path(current_user)
        end
    end

    def mypage
        redirect_to user_path(current_user)
    end

    private 
        def user_params
            params.fetch(:user,{}).permit(:name, :age ,:description,  { skill_ids: [] })
        end

            def set_user
                @user = User.find(params[:id])
            end
end

