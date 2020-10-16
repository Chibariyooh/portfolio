class SkillsController < ApplicationController 

    def index
        @skill= Skill.all
        Skill.all.each do |skill|
            @user.user_skills.build(skill_id: skill.id)
        end
    end
    
    def new 
        @skill = Skill.new
    end

    def create
        Skill.create!(skill_parmas)
    end

    private
    def skill_parmas
        params.require(:skill).permit(:skill_name,:user_id)
    end
    
end