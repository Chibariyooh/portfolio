class User_skillsController < ApplicationController
    def create
        @user_skill = current_user.user_skills.create!(skill_id: params[:skill_id])
        @skill = Skill.find(params[:skill_id])
        Skill.all.each do |skill|
            @user.user_skills.build(skill_id: skill.id)
        end
    end

    def update
        @user_skill = @user.user_skills.find(parmas[:user_skill_id])
        @user_skill.update(user_skill_params)
    end

    private
    def user_skill_params
        params.require(:user_skill).permit(:skill_level,:user_id,:skill_id)
    end
end