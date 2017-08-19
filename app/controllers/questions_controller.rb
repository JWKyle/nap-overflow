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
  p params
  # question_title = params[:title]
  question_text = params[:question]
  # p question_title
  p question_text

  @question = Question.new(title: question_text[:title], explanation: question_text[:explanation], author_id: current_user.id)

  if @question.save
    redirect '/questions'
  else
    #'/users/user_id/questions/new'?
    erb :'questions/new'
  end
end

get '/questions/:id' do
  p params
  @question = Question.find(params[:id])
  erb :'questions/show'
end

put '/questions/:id' do
  authenticate!
  @question = Question.find(params[:id])
  if @question
    @question.best_answer_id = params[:selected_answer]
    @question.save
    redirect "/questions/#{@question.id}"
  else
    # redirect to some error page
  end
end
