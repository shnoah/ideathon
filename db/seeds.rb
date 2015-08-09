

############################# 회원 DB json에서 가져오는 부분 ###################################

@data_hash = Hash.new
path=Rails.root.to_s

file = File.read(path+'/public/userdb1.json')
@data_hash = JSON.parse(file)




for x in 0..537

   u = User.new(
              :email => @data_hash["user_list"][x]["email"].to_s,
              :name => @data_hash["user_list"][x]["name"].to_s,
              :encrypted_password => @data_hash["user_list"][x]["password"].to_s,
              :university => @data_hash["user_list"][x]["school"].to_s       
               )
        
    u.save!(:validate => false)
end








# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#article seed set 1
article_seed1 = Article.new

article_seed1.title = "새로운 웨어러블"
article_seed1.summary = "아이언맨을 만들거야!"
article_seed1.contents = "기술적 장벽때문에 본인의 생각을 세상 밖으로 표현하지 못하신 분들과 2013년 감동의 순간을 만들어 가고 싶습니다. 프로그래밍 경험 전혀 필요 없고, 심지어 컴맹이라도 상관없습니다. 기술적인 부분은 저희가 쌓아드립니다. 여러분이 집중 해야 할 일은 곧 세상에 태어날 여러분의 생각을 다듬"
article_seed1.contact_kakao = "카카오톡"
article_seed1.password = "1234"
article_seed1.contact_email = "이메일"
article_seed1.demo_link = "google.com"
article_seed1.leader_name = "토니 스타크"

article_seed1.save

member = Member.new
member.article_id = article_seed1.id
member.name = "헐크"
member.save
member = Member.new
member.article_id = article_seed1.id
member.name = "캡틴아메리카"
member.save

tag = Tag.find_by_tagging("슈퍼히어로")||Tag.create(:tagging => "슈퍼히어로", :created_at => article_seed1.id)
Article.find(article_seed1.id).tags << tag
tag = Tag.find_by_tagging("어벤져스")||Tag.create(:tagging => "어벤져스", :created_at => article_seed1.id)
Article.find(article_seed1.id).tags << tag
tag = Tag.find_by_tagging("유철아가지마")||Tag.create(:tagging => "유철아가지마", :created_at => article_seed1.id)
Article.find(article_seed1.id).tags << tag


#article seed set 2
article_seed2 = Article.new

article_seed2.title = "남현우 바보"
article_seed2.summary = "엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창 엉망 진창"
article_seed2.contents = "소개팅좀"
article_seed2.contact_kakao = "카카오톡"
article_seed2.password = "1234"
article_seed2.contact_email = "이메일"
article_seed2.demo_link = "google.com"
article_seed2.leader_name = "오현수"
article_seed2.like = 500

article_seed2.save

member = Member.new
member.article_id = article_seed2.id
member.name = "정유철"
member.save
member = Member.new
member.article_id = article_seed2.id
member.name = "박준성"
member.save


tag = Tag.find_by_tagging("연세대")||Tag.create(:tagging => "연세대", :created_at => article_seed2.id)
Article.find(article_seed2.id).tags << tag
tag = Tag.find_by_tagging("솔로현우")||Tag.create(:tagging => "솔로현우", :created_at => article_seed2.id)
Article.find(article_seed2.id).tags << tag
tag = Tag.find_by_tagging("유철아가지마")||Tag.create(:tagging => "유철아가지마", :created_at => article_seed2.id)
Article.find(article_seed2.id).tags << tag


#article seed set 3
article_seed3 = Article.new

article_seed3.title = "멋쟁이 사자처럼"
article_seed3.summary = "코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 코딩 교육 프로그램 "
article_seed3.contents = "비전공생을 대상으로한 코딩 교육 프로그램"
article_seed3.contact_kakao = "카카오톡"
article_seed3.contact_email = "이메일"
article_seed3.demo_link = "google.com"
article_seed3.leader_name = "이두희"
article_seed3.password = "1234"

article_seed3.save

member = Member.new
member.article_id = article_seed3.id
member.name = "최용철"
member.save

tag = Tag.find_by_tagging("코딩")||Tag.create(:tagging => "코딩", :created_at => article_seed3.id)
Article.find(article_seed3.id).tags << tag
tag = Tag.find_by_tagging("멋사")||Tag.create(:tagging => "멋사", :created_at => article_seed3.id)
Article.find(article_seed3.id).tags << tag
tag = Tag.find_by_tagging("유철아가지마")||Tag.create(:tagging => "유철아가지마", :created_at => article_seed3.id)
Article.find(article_seed3.id).tags << tag



#article seed set 4
article_seed4 = Article.new

article_seed4.title = "코드바이트"
article_seed4.summary = "코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 코딩 교육 프로그램12 "
article_seed4.contents = "비전공생을 대상으로한 코딩 교육 프로그램"
article_seed4.contact_kakao = "카카오톡"
article_seed4.contact_email = "이메일"
article_seed4.demo_link = "google.com"
article_seed4.leader_name = "코드"
article_seed4.password = "1234"
article_seed4.like = 3
article_seed4.save

member = Member.new
member.article_id = article_seed4.id
member.name = "바이트"
member.save

tag = Tag.find_by_tagging("코딩")||Tag.create(:tagging => "코딩", :created_at => article_seed4.id)
Article.find(article_seed4.id).tags << tag


#article seed set 5
article_seed5 = Article.new

article_seed5.title = "타이틀"
article_seed5.summary = "코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 "
article_seed5.contents = "비전공생을 대상으로한 코딩 교육 프로그555램"
article_seed5.contact_kakao = "카카오55톡"
article_seed5.contact_email = "이메55일"
article_seed5.demo_link = "google.com555"
article_seed5.leader_name = "코드555"
article_seed5.password = "1234"

article_seed5.save

member = Member.new
member.article_id = article_seed5.id
member.name = "메가바이트"
member.save

tag = Tag.find_by_tagging("유철아가지마")||Tag.create(:tagging => "유철아가지마", :created_at => article_seed5.id)
Article.find(article_seed5.id).tags << tag
tag = Tag.find_by_tagging("시드5")||Tag.create(:tagging => "시드5", :created_at => article_seed5.id)
Article.find(article_seed5.id).tags << tag


article_seed5a = Article.new

article_seed5a.title = "타이1234틀"
article_seed5a.summary = "코딩 교육 1234프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 코딩 교육 프로그램555 "
article_seed5a.contents = "비전공생을12343 대상으로한 코딩 교육 프로그555램"
article_seed5a.contact_kakao = "카카오55톡"
article_seed5a.contact_email = "이123일"
article_seed5a.demo_link = "google.com555"
article_seed5a.leader_name = "코드555"
article_seed5a.password = "1234"
article_seed5a.like = 5000
article_seed5a.save


member = Member.new
member.article_id = article_seed5a.id
member.name = "바보자슥아"
member.save


tag = Tag.find_by_tagging("유철아가지마")||Tag.create(:tagging => "유철아가지마", :created_at => article_seed5a.id)
Article.find(article_seed5a.id).tags << tag
tag = Tag.find_by_tagging("시드5")||Tag.create(:tagging => "시드5", :created_at => article_seed5a.id)
Article.find(article_seed5a.id).tags << tag


