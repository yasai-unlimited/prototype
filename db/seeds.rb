# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def cover_image(num)
  File.open(File.join(Rails.root, "/app/assets/images/cover_#{num}.JPG"))
end


def food_image(num)
  File.open(File.join(Rails.root, "/app/assets/images/food/food#{num}.JPG"))
end


1.upto(9){ |i|
  @arr = ['田中家', '斎藤家', '民谷家', '小室家', '鈴木家', '砂糖家', '高橋家', '伊藤家', '渡辺家', '小林家', '中村家', '加藤家', '吉田家', '山田家', '佐々木家', '渡辺家', '山口家', '松本家']

  iconNum = i+10
  if i < 10
    num = "0#{i}"
  else
    num = i
  end

  name = @arr.sample
  title = name + "のページ"
  description = title + "の説明分です！"
  Family.create(:name => name, :title => title, :description => description, :coverimage => cover_image(num), :icon => cover_image(iconNum))
}

User.create(:email => 'test1@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tanaka', :family_id => 1)
User.create(:email => 'test2@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'saitou', :family_id => 2)
User.create(:email => 'test3@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tanaka012', :family_id => 3)
User.create(:email => 'test4@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'saitou222', :family_id => 4)
User.create(:email => 'test5@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tammmy', :family_id => 5)
User.create(:email => 'test6@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'aiueo', :family_id => 6)
User.create(:email => 'test7@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'idname', :family_id => 7)
User.create(:email => 'test8@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'idnamename', :family_id => 8)
User.create(:email => 'test9@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester9', :family_id => 9)
User.create(:email => 'test10@test.com', :password => 'password', :password_confirmation => 'password', :open_id => 'tester10', :family_id => 10)





1.upto(10){ |i|
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "双子育児について。", content: "１歳になったばかりの双子男児の母です。一言で言うと、もう疲れ果てています。両親は両方ともそこそこ遠く、主人は朝から夜遅くまで仕事、休日出勤も多く、育児はほぼ
１人でこなしています。１歳になれば少しは楽になるかと思いきや、夜は")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "育児休業給付金について教えてください。", content: "会社に申請書類を下さいとお願いし続けてるうちに産後6週間が経過してしまいました。
いまだに何の手続きもしていません。")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "主人の育児協力について。4歳男、2歳男、1歳女を育児している専業主婦です。", content: "子供たちは主人が出勤するときには寝ていますし帰宅時にももちろん寝ています。主人は休みがほとんどないため、まったく子供たちと関わっていない状態です。

一度そのことについて話しました。平日にたまに早く帰ってきて欲しいと言いました。それでも「俺は毎日仕事してるのに、帰ってまで育児をさせるのはおかしい」と言います。")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "育児に疲れました。", content: "眠平日にたまに早く帰ってきて欲しいと言いました。それでも「俺は毎日仕事してるのに、帰ってまい")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "子供が大きくなったらどうしたらいいでしょうか。", content: "自分では、一生懸命育児をしているつもりだし、やることがたくさんすぎてなくし物をしてしまいます。食事中に子供がじっとしていないのも、自分なりに子供が食べてくれるように努力しているつもりでした。それなのに、そんな風に言われてショックです。
")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "育児に関する悩み相談です", content: "主人は冗談で言っただけ。本当に思っていたらそんなことは言わないといいます。
でも、私からしたら、自分の中で毎日精いっぱい過ごしていたことを否定された気分でショックです。")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "悩みの相談をしたいです", content: "平日にたまに早く帰ってきて欲しいと言いました。それでも「俺は毎日仕事してるのに...」と言います。")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "子供がうるさくて困っています", content: "引っ越しをして慣れない地で三カ月過ごしました。友達もいませんでしたが、娘のためと思っていろいろなところに出かけ、お友達を作ったり、様々な経験をさせてきました。今まで当たり前と思ってやってきましたが、そのことにさえ、主人に感謝くらいしてよと思う気持ちまで、生まれてきています。
")
  Question.create(family_id: %(#{i}), user_id: %(#{i}), title: "こういう時はどうしたらいいですか？", content: "主人は、男は冗談を言っていじり合うのが楽しい過ごし方と思っているようです。でも私は今回の育児に向いてないといわれた言葉は冗談だとしてもどうしても許せません。冗談でも言っていい言葉とダメな言葉があると思います。
私の感覚は合っていますか？男の人の立場、女の人の立場からご意見聞かせてください。")

  FamilyPost.create(family_id: %(#{i}), content: "今日はおばあちゃんの家に行ってきたよ！").family_post_images.create(family_post_id: 1, :image => cover_image("01"))
  FamilyPost.create(family_id: %(#{i}), content: "初めて言葉を発しました！")
  FamilyPost.create(family_id: %(#{i}), content: "今日の晩御飯！！").family_post_images.create(family_post_id: 1, :image => food_image("1"))
  FamilyPost.create(family_id: %(#{i}), content: "今日のお昼御飯！！").family_post_images.create(family_post_id: 1, :image => food_image("2"))
}

