class SkillsController < ApplicationController 

    def index
        @skills= Skill.all
        @skill= Skill.new
        Skill.all.each do |skill|
            @user.user_skills.build(skill_id: skill.id)
        end
    end
    
    def new 
        @skill = Skill.new
    end

    def show
        @skill=Skill.find(params[:id])
        @user_skill = UserSkill.new
    end


    def create
        @skill = Skill.create!(skill_parmas)
        @skill.user_id = current_user.id
    end

    private
    def skill_parmas
        params.require(:skill).permit(:skill_name,:user_id)
    end
    
end