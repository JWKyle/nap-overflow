post '/questions/:id/vote' do
  question = Question.find(params[:id])
  question.votes.create(value: 1)

  if request.xhr?
    return question.votes.to_s
  else
    redirect "/questions"
  end
end


    # content-type :json
    # { votes: question.votes }.to_json
