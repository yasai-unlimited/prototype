# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(10){ |i|
  Family.create
}

User.create(:email => 'test1@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester1', :family_id => 1)
User.create(:email => 'test2@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester2', :family_id => 2)
User.create(:email => 'test3@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester3', :family_id => 3)
User.create(:email => 'test4@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester4', :family_id => 4)
User.create(:email => 'test5@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester5', :family_id => 5)
User.create(:email => 'test6@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester6', :family_id => 6)
User.create(:email => 'test7@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester7', :family_id => 7)
User.create(:email => 'test8@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester8', :family_id => 8)
User.create(:email => 'test9@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester9', :family_id => 9)
User.create(:email => 'test10@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester10', :family_id => 10)


Question.create(family_id: 1, user_id: 1, title: "タイトル1タイトル1タイトル1タイトル1", content: "内容内容内容内容内容内容内容内容内容内容内容内容内容")
Question.create(family_id: 1, user_id: 1, title: "唐揚げ", content: "晩御飯")
Question.create(family_id: 1, user_id: 1, title: "納豆", content: "昼ごはん")
Question.create(family_id: 1, user_id: 1, title: "寝起き", content: "眠い")
Question.create(family_id: 1, user_id: 1, title: "育児", content: "子供")
Question.create(family_id: 1, user_id: 1, title: "悩み", content: "晩御飯")
Question.create(family_id: 1, user_id: 1, title: "成長", content: "身長")
Question.create(family_id: 1, user_id: 1, title: "成長", content: "体重")
Question.create(family_id: 1, user_id: 1, title: "適当", content: "あああああああ")