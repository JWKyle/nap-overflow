get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

#'/users/user_id/questions/new'?
get '/questions/new' do
  erb :'questions/new'
end

#'users/user_id/questions' ?
post '/questions' do
  #authenticate!
  p params[:question]
  @question = Question.new(params[:question])

  if @question.save
    redirect '/questions'
  else
    #'/users/user_id/questions/new'?
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
