post '/questions/:id/vote' do
  question = Question.find(params[:id])

  question.votes.create(value: 1, voter_id: session[:user_id])

  if request.xhr?
    erb :'questions/_question_upvote', layout: false, locals: {question: question}
    # return question.votes.length.to_s
  else
   redirect "/questions"
  end
end
