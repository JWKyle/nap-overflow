get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

#'/questions/:question_id/answers'?
post '/:question_id/answers' do
  @question = Question.find(params[:id])

  @answer = @question.answers.new(params[:answer])

  if @answer.save
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'answers/new'
  end
end
