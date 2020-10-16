class User_skillsController < ApplicationController
    
    def create
        user_skill = current_user.user_skills.new(skill_id: params[:skill_id])
        user_skill.save!
    end
end