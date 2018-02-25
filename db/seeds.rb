# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { login: 'user1', password: 'password1' },
  { login: 'user2', password: 'password2' }
])

categories = Category.create([
  { title: 'Математика' },
  { title: 'Информатика' }
])

tests = Test.create([
  { title: 'Вычитание', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Сложение', category_id: categories[0].id, author_id: users[0].id },
  { title: 'Части компьютера', level: 2, category_id: categories[1].id, author_id: users[1].id }
])

questions = Question.create([
  { body: '5+5?', test_id: tests[0].id },
  { body: '3+2?', test_id: tests[0].id },
  { body: '4-2?', test_id: tests[1].id },
  { body: '5-1?', test_id: tests[1].id },
  { body: 'Что такое HDD?', test_id: tests[2].id },
  { body: 'Что такое ОЗУ?', test_id: tests[2].id }
])

Answer.create([
  { body: '8', question_id: questions[0].id },
  { body: '6', question_id: questions[0].id },
  { body: '7', question_id: questions[0].id },
  { body: '10', correct: true, question_id: questions[0].id },

  { body: '5', correct: true, question_id: questions[1].id },
  { body: '1', question_id: questions[1].id },
  { body: '4', question_id: questions[1].id },
  { body: '2', question_id: questions[1].id },

  { body: '6', question_id: questions[2].id },
  { body: '2', correct: true, question_id: questions[2].id },
  { body: '5', question_id: questions[2].id },
  { body: '3', question_id: questions[2].id },

  { body: '8', question_id: questions[3].id },
  { body: '5', question_id: questions[3].id },
  { body: '4', correct: true, question_id: questions[3].id },
  { body: '6', question_id: questions[3].id },

  { body: 'Монитор', question_id: questions[4].id },
  { body: 'Жесткий диск', correct: true, question_id: questions[4].id },
  { body: 'Мышь', question_id: questions[4].id },
  { body: 'Процессор', question_id: questions[4].id },

  { body: 'Оперативная Память', correct: true, question_id: questions[5].id },
  { body: 'Пиксели в мониторе', question_id: questions[5].id },
  { body: 'Видео карта', question_id: questions[5].id },
  { body: 'Блок питания', question_id: questions[5].id }
])

TestsUser.create([
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[2].id }
])
