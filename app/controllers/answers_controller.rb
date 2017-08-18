get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  answer_text = params[:answer]
  question_number = params[:question_id]
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(content: answer_text[:content], author_id: session[:user_id], question_id: question_number)

  if @answer.save
    redirect "/questions/#{@question.id}"
#    redirect "/questions/#{@question.id}/answers"
  else
    erb :'/answers/new'
  end
end
