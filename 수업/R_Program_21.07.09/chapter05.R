# R을 이용한 데이터 조작방법

# head() 함수
# 첫번째 행부터 6개의 행까지 추출
# head(데이터, 추출할 행 개수 지정)
head(Orange)
head(Orange,2)

# tail() 함수
# 마지막 행부터 6개의 행까지 추출
# tail(데이터, 추출할 행 개수 지정)
tail(Orange)
tail(Orange,7)

# str() 함수
# 데이터의 구조 파악
str(Orange)

# summary() 함수
# 수치형 데이터의 각 컬럼별 최소값,1사분위수, 중앙값
# 3사분위수, 최대값, 평균을 구할수 있다.
# 범주형 데이터의 경우 각 범주별로 관측치 개수를 구함
summary(Orange)

#--------------------
# csv파일 불러오기
# read.csv()로 불러옴
nhis <- read.csv("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/NHIS_OPEN_GJ_EUC-KR.csv")
head(nhis)

# 만약 에러 발생시 인코딩 문제
# utf-8, euc-kr로 파일인코딩 설정
nhis_euc <- read.csv("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/NHIS_OPEN_GJ_EUC-KR.csv",fileEncoding = "EUC-KR")
nhis_utf <- read.csv("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/NHIS_OPEN_GJ_UTF-8.csv",fileEncoding = "utf-8")
head(nhis_utf)


# 첫번째 행에 열이름이 없이 데이터가 존재할때 header = F,
# 문자열 데이터를 범주형 데이터로 읽기 원할때 stringAsFactor=TRUE 사용
# readTableHeader에 의하여 발견된 완성되지 않은 마지막 라인입니다 -> 파일 마지막 라인에
# 빈공간이 있을때 생기는 오류
sample <- read.csv("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/sample.csv",
                   header=F, fileEncoding = "EUC-KR",stringsAsFactors = TRUE)
sample

# 엑셀 파일 불러오기
# openxlsx 패키지를 설치
install.packages('openxlsx')
library(openxlsx)

# 디폴트로 엑셀 파일의 첫번째 sheet를 읽음
nhis_sheet1 = read.xlsx("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/NHIS_OPEN_GJ_EUC-KR.xlsx")
head(nhis_sheet1,3)
# 두번째 sheet를 읽음
nhis_sheet2 = read.xlsx("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/NHIS_OPEN_GJ_EUC-KR.xlsx", sheet = 2)
head(nhis_sheet2,3)

# 빅데이터 파일 불러오기
# data.table 패키지 설치
install.packages('data.table')
library(data.table)

nhis_bigdata = fread("C:/Users/user/Desktop/Intern_Class/R_Program_21.07.09/data/NHIS_OPEN_GJ_BIGDATA_UTF-8.csv",
                    ,encoding = 'UTF-8')
str(nhis_bigdata)


# ---------------
# 데이터 추출

# 행 인덱스를 이용하여 행 제한
# 1행부터 5행까지 추출
Orange[1:5,]
Orange[6:10,]
# 1행과 5행 추출
Orange[c(1,5), ]
# 1~29행을 제외하고 추출
Orange[-c(1:29),]


# 데이터를 비교하여 행 제한
Orange[Orange$age == 118,] # age컬럼의 데이터가 118인 행만 추출
Orange[Orange$age %in% c(118,484),] # age컬럼의 데이터가 118 또는 484인 행 추
Orange[Orange$age >= 1372,] # age컬럼의 데이터가 1372보다 크거나 같은경

# 열제한
# 열이름을 이용하여 열제한 (추출할 열(변수)이름을 대괄호 안 콤마 뒤에 작성)
# Orange의 circumference 열만 추출, 행은 모든행 추출
Orange[,"circumference"]
# Orange의 Tree와 circumference열만 추출, 행은 1행만 추출
Orange[1, c("Tree","circumference")]


# 열 인덱스를 이용하여 열제한
Orange[,1] # 첫번째 열만 추출
Orange[,c(1,3)] # 1열과 3열 추출
Orange[,c(1:3)] # 1열 ~ 3열 추출
Orange[,-c(1,3)] # 1열과 3열을 제외하고 추출


# 행과 열제한
Orange[1:5,3] # 1~5행 3열('circumference')추출
# Tree열이 3또는 2인 행의 Tree열과 circumference열 추출
Orange[Orange$Tree %in% c(3,2), c('Tree','circumference')]


# 정렬
# order()
OrangeT1 <- Orange[Orange$circumference < 50,]
OrangeT1[order(OrangeT1$circumference),] # circumference열을 기준으로 정렬 (오름차순)
OrangeT1[order(-OrangeT1$circumference),] # 테이블 데이터에 - 기호사용 (내림차순)


# 그룹별 집계
# aggregate()를 사용
# 첫번째 매개인자의 ~ 뒤에 그룹핑할 기준 열이름을 쓰고, 
# ~ 앞에 집계할 데이터가 있는 열이름을 쓴다.

# Orange 데이터프레임에서 Tree 컬럼의 값이 같은 행끼리 묶은후
# circumference 값의 평균을 구함
aggregate(circumference ~ Tree,Orange,mean)



# 데이터병합
# 열방향으로 두 데이터프레임을 병합할 때 merge() 또는 cbind()를 사용

# 데이터 준비
stu1 <- data.frame(no = c(1,2,3), midterm = c(100,90,80))
stu2 <- data.frame(no = c(1,2,3), finalterm = c(100,90,80))
stu3 <- data.frame(no = c(1,4,5), quiz = c(99,88,77))
stu4 <- data.frame(no = c(4,5,6), midterm = c(88,77,99))

# merge()는 병합 대상 데이터프레임들의 동일 컬럼명의 동일 데이터 행끼리 병합
merge(stu1, stu2) # 동일컬럼no의 데이터가 같은 행끼리 병합
merge(stu1, stu3) # 동일컬럼 no의 데이터가 1만 같음, 동일하지 않으면 제외
merge(stu1, stu3, all=TRUE) # 동일컬럼값이 일치하지 않아도 병합, SQL외부조인과 유사

# rbind()를 이용해 행합치기
rbind(stu1, stu4) # 두 데이터프레임의 컬럼명이 동일해야함

# cbind()를 이용해 열합치기
cbind(stu1,stu2)
