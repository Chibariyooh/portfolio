class User_skillsController < ApplicationController

    def edit
        Skill.all.each do |skill|
            @user.user_skills.build(skill_id: skill.id)
        end
    end
end