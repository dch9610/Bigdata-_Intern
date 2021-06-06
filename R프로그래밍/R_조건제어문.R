조건제어문

1. if
  - 조건에 따라 문장을 선택적으로 실행

  a<-5
  if(a%%2==0){
    result<-"짝수"
    result
  }else{
    result<-"홀수"
    result
  }

    [1] "홀수"
  
  a<-75
  if(a%%3==0 && a%%5==0){
    result<-"3의 배수이면서 5의 배수"
  }else if (a%%3==0){
    result<-"3의 배수"
  }else if(a%%5==0){
    result<-"5의 배수"
  }
    [1] "3의 배수이면서 5의 배수"
  
2. ifelse문
  - 다수의 데이터에 대한 조건을 한꺼번에 처리할때 사용
  - ifelse(조건식,참,거짓)
  a<-c(10,13,7,8,100)
  ifelse(a%%2==0,"짝수","홀수")
  
    [1] "짝수" "홀수" "홀수" "짝수" "짝수"
  
  
  result<-c(ifelse(a%%2==0,"짝수","홀수"))
  df<-data.frame(a,result)
  
    a result
    1  10   짝수
    2  13   홀수
    3   7   홀수
    4   8   짝수
    5 100   짝수
    
  a1<-c(10,13,22,15,9)
  result1<-c(ifelse(a1>mean(a1),"평균초과",ifelse(a1<mean(a1),"평균미달","평균값")))
  df2<-data.frame(a1,result1)
  
    a1  result1
    1 10 평균미달
    2 13 평균미달
    3 22 평균초과
    4 15 평균초과
    5  9 평균미달
    

3. 반복문 - for
    - 한개 이상의 문장을 특정횟수만큼 반복처리하는 형식
    - for(변수명 in 반복횟수){
          반복할 실행 문장
    }
    
  y<-0
  for(x in 1:5){
    y<-y+x
    cat("1부터 ",x,"까지 합=",y,"\n")
  }
  
    1부터  1 까지 합= 1 
    1부터  2 까지 합= 3 
    1부터  3 까지 합= 6 
    1부터  4 까지 합= 10 
    1부터  5 까지 합= 15 
    
  evensum<-0
  a<-c(4,25,8,33,17,20)
  for(x in 1:length((a))){
    if(a[x]%%2==0) evensum<-evensum+a[x]
  }
    [1] 32
  
4. 반복문 - while
  - 조건이 "참"인 동안 블록을 반복실행
  
  i<-1
  isum<-0
  while(i<=10){
    isum<-isum+i
    i<-i+1
  }
  
   [1] 55

5. 반복문 - repeat
  - 블록안의 문장을 반복실행

  a<-c(42,25,16,7,23,12,9)
  i<-1
  repeat{
    if(a[i]<mean(a)) break
    i<-i+1
  }
    [1] 16