함수
  - 특정한 작업을 독립적으로 수행하는 프로그램 코드의 집합체

* R에서 많이 사용하는 기본함수
  - mean() : 평균값을 계산
  - sum() : 합계를 계산
  - sd() : 표준편차를 계산
  - var() : 분산 계산
  - sort() : 정렬작업 수행
  - min(),max() : 최소값, 최대값을 계산
  - median() : 중위수 계산
  - cor() : 상관계수 계산
  - range() : 범위를 계산
  - rev() : 요소의 나열순서를 반대로 표시

  a<-c(33,12,55,66,77,16)
  rev(a)
    [1] 16 77 66 55 12 33
  mean(a)
    [1] 43.16667
  sort(a)
    [1] 12 16 33 55 66 77
  range(a)
    [1] 12 77
  median(a)
    [1] 44
  sd(a)
    [1] 26.90291
  var(a)
    [1] 773.7667
  sum(a)
    [1] 259
  
* apply() 함수
  - 벡터, 행렬, 데이터프레임 등에서 행/열 단위의 필요한 계산작업을 쉽게 하는데 유용한 함수
  - 형식 apply(대상객체, 행 또는 열, 적용할 함수)
  - lapply() : 계산결과를 list 형태로 변환하여 출력
  - sapply() : 계산결과를 벡터형태로 변환하여 출력
  - tapply() : 계산결과를 특정부분으로 그룹화하여 출력
  
  
  height<-c(177,180,167,165,170,NA)
  weight<-c(NA,77.3,80,60,NA,64)
  df<-data.frame(신장=height,체중=weight)
  names(df)<-c("신장","체중")
  
    신장 체중
    1  177   NA
    2  180 77.3
    3  167 80.0
    4  165 60.0
    5  170   NA
    6   NA 64.0
    
  위의 데이터프레임에서 결측값 제외한 컬럼별 평균을 계싼  
  apply(df,2,mean,na.rm=TRUE)
    신장    체중 
    171.800  70.325 
    
  lapply(df,max,na.rm=TRUE)
    $신장
    [1] 180
    
    $체중
    [1] 80
  
  sapply(df,max,na.rm=TRUE)
    신장 체중 
    180   80 
  
2. 사용자 정의 함수
  - 프로그램에 반복적으로 사용되는 특별한 계산식을 직접 작성
  - 함수이름<-function(인자){함수의 몸체 ..return(반환값)}

  * 인자가 없는 함수
  guideinfo<-function(){
    writeLines("분석을 위한 프로그램 R")
  }
    > guideinfo()
    분석을 위한 프로그램 R
  
  * 인자가 있는 함수
  guideinfo<-function(msg){
    writeLines(msg)
  }
    > guideinfo("분석작업 오케이")
    분석작업 오케이


2-1 외부파일에 정의한 함수 사용하기

  source("/Users/ichanghwan/Desktop/rt_data/calc.txt",encoding='utf-8')
  x<-c(555,321,45,6,12)
    $total_sum
    [1] 939
    
    $sort_result
    [1]   6  12  45 321 555