require 'faker'

#make users
100.times do
  User.new(username: Faker::RickAndMorty.character, email: Faker::Internet.safe_email, password_hash: Faker::Internet.password)
end

#make questions, each associated with a random user
20.times do
  author = User.all.shuffle.first
  Question.new(title: Faker::Hipster.sentence, explanation: Faker::Hipster.pararaph, author_id: author.id)
end



questions = Question.all

#make comments to question
questions.each do |question|
  5.times do
    Comment.new(content: Faker::RickAndMorty.quote, author_id: question.author.id, commentable_id: question.id)
  end

#make answers to question
  3.times do
    author = User.all.shuffle.first
    Answer.new(content: Faker::Hipster.pararaph, question_id: question.id, author_id: author.id)
  end
end
