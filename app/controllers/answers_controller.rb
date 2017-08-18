get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do

  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])

  if @answer.save
    redirect '/questions/#{@question.id}'
#    redirect "/questions/#{@question.id}/answers"
  else
    erb :'/answers/new'
  end
end
