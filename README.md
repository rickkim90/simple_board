

#4차산업혁명 선도인재 양성 프로젝트 과정

---
## 1. Week 1 Day 6: Simple_board

***



1. OAuth
2. 카카오톡 나에게 보내기
   1. https://developers.kakao.com/docs/restapi/kakaotalk-api#나에게-보내기

***



1. 간단한 게시판

User, Post



Post 모델

string, title

string, contrent



User 모델

string, email

string, password



+ 'post#controller'

post#index => 모든 게시글을 보여준다 (root page)

post#new => 새로운 게시글을 만드는 form을 보여준다

post#create => new에서 작성한 글을 쓴다 == DB에 저장한다

post#show => /user/show/:id => 해당하는 글 1개만 보여준다

post#modify => 게시글을 수정할 수 있는 form을 보여준다

post#update => modify에서 수정된 글을 DB에 새로 저장한다

post#destroy => show에서 확인한 글을 지울 수 있게 한다



+ 'user controller'

user#index => 모든 게시글을 보여준다

user#new => 새로운 게시글을 만드는 form을 보여준다

user#create => new에서 작성한 글을 쓴다 == DB에 저장한다

user#show => /user/show/:id => 해당하는 글 1개만 보여준다

user#login => form에 로그인이 가능한 페이지를 보여준다.

user#login_process => 로그인 정보와 DB 유저 정보를 비교해 user를 로그인 시킨다.



rails g model post title:string content:string 

한번에 생성 / column 이름과 datatype



#####수정 

```ruby
# 1번 글에 대하여 수정을 할거야
# 1번 글을 찾는다
# 해당 글을 업데이트 한다
def update
@id = params[:id]
@post = Post.find(@id)
@post.update(
	title: params[:title],
    content: params[:content]
)
redirect_to "/post/show/#{@id}" #쌍따옴표
end
```


##### 삭제

 ```ruby
def destroy
	@id = params[:id]
    @post = Post.find(@id)
    @post.destroy
    
    redirect_to '/'
end
 ```



##### "" 와 '' 차이

```ruby
> a = "john"
=> "john"
> "hello, #{a}" # 따옴표, 쌍따옴표 차이
=> "hello, john"
```



### User & Post

+ 1:1
+ 1:N = User & Post / Post & Reply / Class & Student 
  - 1 User가 여저 Post를 가질 수 있다.
  - Post들은 특정 한 User에 속해야 한다.
  - 게시물과 댓글
  - 학급과 학생
  - user had posts
  - post must be included in user
  - post_id값 가진 칼럼
+ M:N = Major & Student



##### User

|      | user | email | password |
| ---- | :--: | :---: | :------: |
|      |  1   |  123  |   123    |
|      |      |       |          |
|      |      |       |          |

 

### Post

|      | User | Title | Content |
| ---- | :--: | :---: | :-----: |
|      |  1   |  123  |   123   |
|      |      |       |         |
|      |      |       |         |



- rails db

sqlite> .tables #테이블 출력

sqlite> .schmea 테이블명



+ rails c

```ruby
Post.find(글번호)
user = User.find(1)
User.find(1).posts.last.content
```



+ create_reply

1. form 입력을 받는다
2. 내가 가진 데이터베이스에 저장 = params[:content]
3. 보여준다 = show