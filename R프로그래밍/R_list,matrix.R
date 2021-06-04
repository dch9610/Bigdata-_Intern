1.리스트
  - 숫자형, 문자형 데이터를 섞어서 저장이 가능하며 
    벡터와 같이 인덱스 번호로 내부 데이터 접근이 가능
  - list()함수를 이용하여 생성
  - list(키1=값1, 키2=값2..) -> 해당키에 값을 할당

myfavorit<-list(friend="홍길동",mynum=7,myalpha='z')
  $friend
  [1] "홍길동"
  
  $mynum
  [1] 7
  
  $myalpha
  [1] "z"

조회
myfavorit$myalpha
  [1] "z"

추가
myfavorit$mysong<-'hello'
myfavorit$myfood <-c("월남쌈","쌀국수","부대찌개")

2. 행렬(matrix)
  - 2차원 벡터를 표현하기 위한 방법
  - matrix() 함수를 이용하여 생성
  - matrix(행렬의 구성원소, nrow=행의 갯수, ncol=열의 갯수,dimnames=행렬의 이름)
  - 기본적으로 열중심
  - 행중심으로 기록하고자 할때 byrow=TRUE

age <- matrix(c(25,33,32,37,27,38),nrow=2,ncol=3)
        [,1] [,2] [,3]
  [1,]   25   32   27
  [2,]   33   37   38

age[,1]
  [1] 25 33

age[2,]
  [1] 33 37 38

age <- matrix(c(25,33,32,37,27,38),nrow=2,byrow=TRUE)
        [,1] [,2] [,3]
  [1,]   25   33   32
  [2,]   37   27   38

2-1 행과 열 이름 지정하기
  - 행렬에서 행 또는 열에 이름을 지정
  - dimnames(행렬)<-값

info<-matrix(c("177cm","68kg","151cm","40kg","160cm","55kg"),ncol=2,byrow=TRUE)
        [,1]    [,2]  
  [1,] "177cm" "68kg"
  [2,] "151cm" "40kg"
  [3,] "160cm" "55kg"

dimnames(info) <- list(c("1번","2번","3번"),c("키","몸무게"))
      키      몸무게
  1번 "177cm" "68kg"
  2번 "151cm" "40kg"
  3번 "160cm" "55kg"

2-2 행렬에 새로운 행/열 추가하는 작업
  - 행 추가 함수 -> rbind(행렬, 행에 추가할 원소)
  - 열 추가 함수 -> cbind(행렬, 열에 추가할 원소)

a1 <- c("167cm","54kg")
a2 <- c("178cm","70kg")
rbind(info,a1,a2)
      키      몸무게
  1번 "177cm" "68kg"
  2번 "151cm" "40kg"
  3번 "160cm" "55kg"
  a1  "167cm" "54kg"
  a2  "178cm" "70kg"
  
cbind(info,c("남","여","남"))
      키      몸무게     
  1번 "177cm" "68kg" "남"
  2번 "151cm" "40kg" "여"
  3번 "160cm" "55kg" "남"
