#'/users/user_id/questions/new'?
get '/questions/new' do
  erb :'questions/new'
end

#'users/user_id/questions' ?
post '/questions' do
  @question = Question.new(params[:question])

  if @question.save
    redirect #'/somewhere'
  else
    #'/users/user_id/questions/new'?
    erb :'questions/new'
  end
end
