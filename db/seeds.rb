require 'faker'

#make users
100.times do
  User.new(username: Faker::RickAndMorty.character, email: Faker::Internet.safe_email, password_hash: Faker::Internet.password)
end

#make questions
20.times do
  Question.new(title: Faker::Hipster.sentence, explanation: Faker::Hipster.pararaph) #author_id?
end



questions = Question.all

#make comments to question
questions.each do |question|
  5.times do
    Comment.new(commentable_id: question.id, Faker::RickAndMorty.quote) #commentable_id correct? What's commentable type? author_id?
  end

#make answers to question
  3.times do
    Answer.new(content: Faker::Hipster.pararaph, question_id: question.id) #author_id?
  end
end
