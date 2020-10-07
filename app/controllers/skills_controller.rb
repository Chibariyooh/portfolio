class SkillsController < ApplicationController 

    def index
        @skill= Skill.all
    end
    
    def new 
        @skill = Skill.new
    end

    def create
        Skill.create!(skill_parmas)
    end

    private
    def skill_parmas
        params.require(:skill).permit(:skill_name,:skill_level,:user_id)
    end
    
end