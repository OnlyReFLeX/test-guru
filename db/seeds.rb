# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  { title: 'Математика' },
  { title: 'Информатика' }
])

Test.create([
  { title: 'Вычитание', level: 1, category_id: 1 },
  { title: 'Сложение', category_id: 1 },
  { title: 'Части компьютера', level: 2, category_id: 2 }
])

Question.create([
  { body: '5+5?', test_id: 1 },
  { body: '3+2?', test_id: 1 },
  { body: '4-2?', test_id: 2 },
  { body: '5-1?', test_id: 2 },
  { body: 'Что такое HDD?', test_id: 3 },
  { body: 'Что такое ОЗУ?', test_id: 3 }
])

Answer.create([
  { body: '8', question_id: 1 },
  { body: '6', question_id: 1 },
  { body: '7', question_id: 1 },
  { body: '10', correct: true, question_id: 1 },

  { body: '5', correct: true, question_id: 2 },
  { body: '1', question_id: 2 },
  { body: '4', question_id: 2 },
  { body: '2', question_id: 2 },

  { body: '6', question_id: 3 },
  { body: '2', correct: true, question_id: 3 },
  { body: '5', question_id: 3 },
  { body: '3', question_id: 3 },

  { body: '8', question_id: 4 },
  { body: '5', question_id: 4 },
  { body: '4', correct: true, question_id: 4 },
  { body: '6', question_id: 4 },

  { body: 'Монитор', question_id: 5 },
  { body: 'Жесткий диск', correct: true, question_id: 5 },
  { body: 'Мышь', question_id: 5 },
  { body: 'Процессор', question_id: 5 },

  { body: 'Оперативная Память', correct: true, question_id: 6 },
  { body: 'Пиксели в мониторе', question_id: 6 },
  { body: 'Видео карта', question_id: 6 },
  { body: 'Блок питания', question_id: 6 }
])

User.create([
  { login: 'user1', password: 'password1' },
  { login: 'user2', password: 'password2' }
])
