=========================
Ideathon
=========================

- 알려진 문제
    - 로그인 후 redirect 
    - 로그아웃이 되다 말다함 //해결
    
- 할 일
    - Modal로 처리할 거 골라서 처리하기


- 15/08/05 노승호 업데이트
    - 글쓰기는 서비스명/글비밀번호/한줄설명/상세설명 말고는 입력안해도 글 올라가게 수정
    - 데모 링크 없으면 링크 표시 X
    - ID 당 글 1개만 처리
    - 글쓸 때 비밀번호 text->password로 타입 변경
    - 글을 작성한 상태에서는 '내가 쓴 아이디어 보기', 미작성시에는 '아이디어 쓰기' 노출
    - 좋아요 버튼 if user_signed_in? 안에 모셔다 놓음

- 그냥 메모..
    - /views/devise/sessions/new.html.erb - login page 
    - /views/uploads/s3uploder_uploader.rb - image size

