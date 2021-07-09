# 데이터 구조

# 벡터
# 하나 이상의 데이터를 저장할 수 있는 1차원 저장 구조
students_age <- c(11,12,13,14,16,20)
students_age
class(students_age)
length(students_age)

# 인덱싱
# R의 인덱싱은 1부터 시작한다.
students_age[1]
students_age[3]
students_age[-1]

# 슬라이싱
# [시작인덱스:끝인덱스]
students_age[1:4]
students_age[4:6]

# 데이터 추가, 갱신
score <- c(1,2,3)
score[1] <- 10
score[4] <- 30
score

# 데이터 타입
# 하나의 원시타입으로 저장된다.
# 다양한 데이터 타입을 섞어 저장하면 하나의 타입으로 자동 형변환
code <- c(1,2,"3")
class(code)
code

# 순열 생성
# 연속된 숫자를 생성함
data <- c(1:10)
data

data1 <- seq(1,10)
data1

# 2씩 증가시켜 생성
data2 <- seq(1,10,by=2)
data2

# 1을 다섯번 반복
data3 <- rep(1,time=5)
data3

# 1부터 3을 각각 세번씩 반복
data4 <- rep(1:3, each=3)
data4

# ----------------
# 행렬
# 표 형태와 같은 2차원 데이터 저장 구조를 가진다.
var1 <- c(1,2,3,4,5,6)

# 2행 3열 생성, 기본적으로 열 우선으로 값이 채워짐
x1 <- matrix(var1, nrow=2, ncol=3)
x1

# 2열 행렬생성, 행의 개수는 자동계산됨
x2 <- matrix(var1, ncol=2)
x2

# 일부 데이터만 접근
# 행 인덱스, 열 인덱스 사용하여 접근
x1[1,]
x1[,1]
x1[2,3]

# 행렬에 데이터 추가
# rbind()로 행을 추가, cbind()로 열을 추가
x1 <- rbind(x1, c(10,10,10))
x1 <- cbind(x1, c(20,30,40))

# 데이터의 수가 맞지 않은경우 제일 처음 입력한 값부터 맞춰서 입력
x1 <- cbind(x1, c(3,4))
x1 <- rbind(x1, c(6,5,4,3))
x1