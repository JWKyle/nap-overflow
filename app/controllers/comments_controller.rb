post '/answers/:answer_id/comments' do
  p params
  comment_text = params[:comment]
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.new(content: comment_text[:content], author_id: session[:user_id])

  if @comment.save
    redirect "/questions/#{@answer.question.id}"
  else
    status 422
#    erb :'/answers/_comment'
  end
end

post '/questions/:question_id/comments' do
  comment_text = params[:comment]
  @question = Question.find(params[:question_id])
  @comment = @question.comments.new(content: comment_text[:content], author_id: session[:user_id])

  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/questions/_comment'
  end
end

