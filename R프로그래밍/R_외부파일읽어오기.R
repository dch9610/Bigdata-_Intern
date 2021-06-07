외부파일 읽어오기

1. scan()함수
  - 외부파일을 읽어드림
  - scan('파일명',what)
  - what : 문자열인 경우 " ", 또는 'char'이라고 입력해줘야만 인식가능 (what='char')

a <- scan('/Users/ichanghwan/Desktop/rt_data/irum.txt', what='char',sep = ',',fileEncoding = 'euc-kr')
  [1] "홍길동" "손영문" "조재희" "하철중" "국만봉" "하명순"

a <- scan('/Users/ichanghwan/Desktop/rt_data/irum.txt', what='char',fileEncoding = 'euc-kr')
  [1] "홍길동,손영문,조재희,하철중,국만봉,하명순"


2. readLines()
  - 외부 파일을 한 줄 단위로 읽어들임
  - readLines('파일명')

data<-readLines('/Users/ichanghwan/Desktop/rt_data/consumer.txt',encoding = 'EUC-KR')


3. read.csv() 
  - csv 형식 파일을 읽어들임
  - read.csv('파일명')

popdata<-read.csv('/Users/ichanghwan/Desktop/rt_data/seoulpopulation.csv',header = TRUE,fileEncoding = 'euc-kr')
   
         자치구   남자   여자
    1    종로구  80531  83291
    2      중구  66755  67574
    3    용산구 121027 126882
    4    성동구 151459 153606
    ...
    
    
4. 엑셀파일 불러오기
  XLConnet패키지 이용
    - 엑셀파일의 데이터 전부 혹은 일부를 지정하여 읽어올 수 있음
    - install.packages("XLConnect") : XLConnect 패키지를 사용, require(XLConnect)
    - 엑셀파일을 읽어오는 함수 loadWorkbook("파일경로")
    - 엑셀파일에서 읽어올 시트와 범위
    - readWorksheet(파일, sheet="시트명", startRow=읽어올 시작 행, startCol=읽어올 시작열, endRow=마지막행, 
                      endCol=마지막열)

  xlsx패키지 이용
    - java를 이용하여 xls,xlsx파일을 읽어옴
    - install.packages("xlsx") => xlsx 패키지 사용, require(xlsx)
    - 엑셀파일을 읽어오는 함수 read.xlsx("파일경로") 또는 read.xlsx2("파일경로")
