class QuestionController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  	@current_user
  end

  def start_quiz
  	@subgenre_id = params[:subgenre_id]
  	@current_user
  	@question = Question.where(subgenre_id: params[:subgenre_id]).offset(params[:question_id].to_i).take
  	puts "Question"
  	
  	# End Quiz
  	if not @question
  		redirect_to root_path
  	end

  	# puts @question.id

		@last_state_of_user = Score.order(created_at: :desc).where(user_id: current_user.id).take
  	if params[:start_game] == "true"
			@new_state = Score.create(
			  :user_id => @current_user.id,
			  :subgenre_id => params[:subgenre_id],
			  :points => 0,
			)
			@new_state.save
			puts "New ID"
  		puts @new_state.id
  	elsif params[:continue_game] == "true"
	  	
	  	# Continue game or submit answer

  	else
  		if params[:answer].to_s == Question.find(params[:question_id]).answer
  			puts "Correct Answer"
  			@last_state_of_user.points += 100
  			@last_state_of_user.save
  		else
  			puts "Wrong Answer"  			
  		end

		 	# Submit answer
  		# @question = Question.find(params[:question_id])
  		# puts @question.answer
  		# params[:answer]

  	end
		

		# if @last_state_of_user
		# end
















  # 	# puts current_user.id
  # 	# If played any game before
		# @last_state = Score.order(created_at: :desc).where(user_id: @current_user.id, subgenre_id: params[:subgenre_id]).take
  # 	if @last_state
		# 	puts @last_state.id
  # 		if params[:set_score] == "0"
  # 			@last_state.points = 0
  # 		end
  # 		# elsif params[:answer] == Question.find()
		# 	# current_user.score_id = new_state.id
		# 	@last_state.save
  # 	else
		# 	@new_state = Score.create(
		# 	  :user_id => @current_user.id,
		# 	  :subgenre_id => params[:subgenre_id],
		# 	  :points => 0,
		# 	)
		# 	@new_state.save
		# 	# current_user.score_id 
		# 	# current_user.save
  # 	end


  end
end


