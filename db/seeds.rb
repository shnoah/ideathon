

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

####################################################################################

#article seed set 1
article_seed1 = Article.new
article_seed1.title = "IDEATHON"
article_seed1.summary = "당신의 생각을 서비스로 만들 수 있게 도와드립니다."
article_seed1.contents = "문제인식 : 내가 가진 아이디어를 다른 사람들과 공유하면서 더 구체화하고 발전시키고 싶다. 지금 스터디 팀과 함께 하면 좋겠지만, 이 팀원들은 내 아이디어에 별 흥미가 없어보인다거나 혹은 우리 팀원만으로는 능력이 부족하다.  그렇게 학교라는 틀 안에 갖혀 많은 사람들을 만나지 못했는데, 더 많은 사람들과 소통하고 함께 작업할 기회를 갖고 싶다. 

해결방안 : 아이디어 공유부터 팀 빌딩까지 할 수 있는 커뮤니티를 만들어야겠다. 또한 많은 사람들이 참여할 수 있
는 촉매를 여러가지 마련해야겠다. 즉 모두가 참여하는 축제가 될 수 있게 다양한 이벤트를 만들 것이다.

기획안 : 약 3주간의 프로젝트를 진행한다. 프로젝트의 최종목적은 모두가 즐기는 축제이다. 모두가 즐겁게 서로 아이디어를 공유하고 구체화하는 기회를 갖게 될 것이다. 그리고 새로운 사람들과 새로운 팀을 만드는 기회를 가질 수 있다. 1일 최다 좋아요 팀에게 명예의 전당에 오를 기회를 제공하고, 재미있는 투표 시스템을 통해 모두가 함께 TOP20을 선정할 기회를 갖는다. TOP20팀은 오프라인에서 자신들의 아이디어를 피칭할 기회를 얻고, 최종 TOP10에 선정되면 스타트업 대표와의 식사자리와 소정의 상금을 제공받는다.

개발방향 : 웹 페이지를 만들어 서비스를 소개하고 공유할 수 있는 페이지를 만든다. 페이지를 통해 세부적인 기획 내용이 잘 녹여질 수 있게 만들 것이다. 일반적인 게시판 형식인데 여러 아이디어들은 항상 랜덤으로 보여준다. 이유는 선발주자가 누적 좋아요를 통해 계속 상위랭크에 위치해 타인들의 주목 대상이 되는 것을 피하기 위해서이다. 추가적으로 항상 랜덤이기에 자신이 안 읽은 글들을 더 많이 찾아 보게 하기 위함이다. 다음 핵심기능은 투표시스템인데, 프로토와 비슷한 시스템을 통해 더 많은 사람들이 투표에 흥미를 느끼게 할 계획입니다. 즉 최대 20장의 투표를 할 수 있게 하고, TOP20 중 가장 많은 정답을 맞추는 사람순으로 1~5위까지 상품을 제공할 예정입니다. 한 가지라도 틀리면 전체 정답은 다 틀린 것이 됩니다. "
article_seed1.contact_kakao = "jnam9203"
article_seed1.password = "1234"
article_seed1.contact_email = "jnam920329@gmail.com"
article_seed1.demo_link = "https://hackathon-woodykim-1.c9.io/main/main"
article_seed1.leader_name = "남현우"
article_seed1.save

tag = Tag.find_by_tagging("아이디어톤")||Tag.create(:tagging => "아이디어톤", :created_at => article_seed1.id)
Article.find(article_seed1.id).tags << tag
tag = Tag.find_by_tagging("커뮤니티")||Tag.create(:tagging => "커뮤니티", :created_at => article_seed1.id)
Article.find(article_seed1.id).tags << tag
tag = Tag.find_by_tagging("팀빌딩")||Tag.create(:tagging => "팀빌딩", :created_at => article_seed1.id)
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
article_seed5a.save


member = Member.new
member.article_id = article_seed5a.id
member.name = "바보자슥아"
member.save


tag = Tag.find_by_tagging("유철아가지마")||Tag.create(:tagging => "유철아가지마", :created_at => article_seed5a.id)
Article.find(article_seed5a.id).tags << tag
tag = Tag.find_by_tagging("시드5")||Tag.create(:tagging => "시드5", :created_at => article_seed5a.id)
Article.find(article_seed5a.id).tags << tag

