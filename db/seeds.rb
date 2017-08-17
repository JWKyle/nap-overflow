require 'faker'

#make users
10.times do
  User.create!(username: Faker::GameOfThrones.character, email: Faker::Internet.safe_email, password: Faker::Internet.password)
end

#make questions, each associated with a random user
20.times do
  author = User.all.shuffle.first
  Question.create!(title: Faker::Hipster.sentence, explanation: Faker::Hipster.paragraph, author_id: author.id)
end



questions = Question.all

#make comments to question
questions.each do |question|
  5.times do
    Comment.create!(content: Faker::RickAndMorty.quote, author_id: question.author.id, commentable_id: question.id, commentable_type: "Question")
  end

#make answers to question
  3.times do
    author = User.all.shuffle.first
    Answer.create!(content: Faker::Hipster.paragraph, question_id: question.id, author_id: author.id)
  end
end

answers = Answer.all

# comments on answers

answers.each do |answer|
  5.times do
    Comment.create!(content: Faker::RickAndMorty.quote, author_id: answer.author.id, commentable_id: answer.id, commentable_type: "Answer")
  end
end
