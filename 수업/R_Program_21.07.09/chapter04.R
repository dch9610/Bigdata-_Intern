# 연산, 흐름제어문, 함수

# R의 연산자
# %% : 나눈 나머지
# %/% : 나눈 몫
# %in% : 연산자 뒤 나열한 값들중 하나와 일치하면 참
n <- 20
n %in% (c(10,20,30))

# 벡터 연산
score <- c(10,20)
score + 2
score # 벡터 자체는 변경되지 않는다

# 연산결과를 기존 변수에 반영
score <- score + 3
score

# 벡터 안의 각 데이터들 간에 연산
score1 <- c(100,200)
score2 <- c(90,91)

sum_score <- score1 + score2
sum_score

diff <- score1 - score2
diff

# 행렬 안의 각 데이터들 간에 연산
m1 <- matrix(c(1,2,3,4,5,6), nrow=2)
m1 <- m1 * 10
m1

# 행렬과 행렬의 연산
m2 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
m3 <- matrix(c(2,2,2,2,2,2,2,2,2), ncol = 3)
m2 + m3

# ---------------------
# 흐름 제어문(조건문)
score <- 95
if(score>=90){
  print("조건이 참인 경우에만 수행")
}

# if~else
score <-80
if(score >= 90){
  print("A")
}else{
  print("B or C")
}

# if ~ else if문
score <- 85
if (score >= 90){
  print("A")
}else if(score >= 85){
  print("B")
}else if(score >= 80){
  print("C")
}else if(score >= 75){
  print("D")
}else{
  print("F")
}

# ifelse문
# ifelse(조건, 참일경우 수행할 문장, 거짓일경우 수행할 문장)
score <- 80
ifelse(score>=90, "A", "B")

# -------------
# 반복문

# (1:3)까지 하나씩 반복해서 출력
for(num in (1:3)){
  print(num)
}

# 중첩 반복문
for (num in (1:5)){
  if (num %% 2 == 0){
    print('짝수')
  }else{
    print("홀수")
  }
}

# paste는 나열된 원소 사이에 공백을 두고 결과값을 출력
paste(num,"짝")

num <- (1:5)
ifelse(num%%2==0, paste(num,"짝수"), paste(num,"홀수") )

#-----------
# 함수
# 함수는 프로그램 코드를 저장하고 있다

# 함수 생성
# function() 뒤 중괄호{}안에 작성한다.
a <- function(){
  print('test')
  print('func')
}

# 함수 호출
# 함수 이름 뒤에 소괄호()를 붙인다.
a()

# 매개변수가 있는 함수
# num이라는 이름의 매개변수가 있는 함수 생성
b <- function(num){
  print(num)
}

# 매개변수에 값 저장  
# 30을 매개인자라고 부
b(30)

# 2개 이상의 매개변수가 있는 함수 정의
a <- function(num1, num2){
  print(paste(num1,num2))
}

a(10,20)
a(num1=30,20)
a(num2=20,30)

# 리턴데이터가 있는 함수
# 함수를 호출한 곳에 데이터를 돌려준다는 의미
# return뒤 소괄호()안에 리턴할 데이터나 변수를 작성
calculator <- function(num1,op,num2){
  result<-0
  if (op=='+'){
    result <- num1 + num2
  }else if(op == '-'){
    result <- num1 - num2
  }else if(op == '*'){
    result <- num1 * num2
  }else if(op == '%/%'){
    result <- num1 %/% num2
  }
  return(result)
}

n <- calculator(10,"%/%",2)
print(n)




