# 자료형

x <- 5
y <- 3.14
x+y
x>y

# 시스템 날짜 표시
Sys.Date()

# 문자열 데이터값을 날짜형으로 변환
as.Date(변수)

# NA 데이터 타입
# 데이터 값이 없다, 결측값
is.na(변수)

# NULL 데이터 타입
# 데이터 값이 정해지지 않은 상태를 의미
rate <- NULL
money <-c(12000,95000,13000)
if(sum(money)>=30000){
  rate<-0.17
}

# Factor 타입
# 범주형 데이터 - 변수가 취할 수 있는 값이 범주로 주어지는 경우
# 종류 : 명목형, 순서형
# factor요소
religion<-factor(c("천주교", "기독교", " 불교","무교"))

# factor요소와 목록을 표시
religion<-factor(c("천주교", "기독교", " 불교","무교"), c("천주교","기독교","불교","무교"))

# 순서형 데이터의 factor 생성시 ordered인자에 TRUE값
width<-factor(c("18","19","24","18","33"),ordered = TRUE)
width