post '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.new(params[:comment])

  if @comment.save
    redirect "/answers/#{@answer.id}"
  else
    status 422
#    erb :'/answers/_comment'
  end
end

post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.new(params[:comment])

  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/questions/_comment'
  end
end

