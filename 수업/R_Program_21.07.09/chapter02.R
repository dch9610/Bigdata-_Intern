# 데이터타입

# 변수에 데이터를 저장하고, 불러오기
age <- 20
age

age <- 30
age

# 숫자 타입
age <-20
class(age)

# 문자 타입
name <- 'LCH'
class(name)

# 논리 타입
is_effective <- TRUE
is_effective
class(is_effective)

# 펙터 타입
sido <- factor("서울",c("서울","부산","제주"))
sido
class(sido)
levels(sido)


# NULL(아직 정해지지 않은 변수)과 NA(결측치 의미)
a <- NULL
jumsu <- c(NA, 90, 100)

# inf(무한대실수)와 NaN(Not a Number)
10/0
0/0


