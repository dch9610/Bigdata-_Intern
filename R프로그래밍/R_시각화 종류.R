Plot 종류

1. 그래프 중첩하여 그리기
  - 두개 이상의 그래프를 하나의 그래프에서 보여주는 작업
  - 형식 : par(new=TRUE)

    plot.new()
    y1<-c(0.8,0.5,0.4,0.4,0.5,0.7)
    y2<-c(0.8,1.3,1.0,1.3,0.9,1.2)
    x<-c(1:6)
    par(new=TRUE, family="AppleGothic")
    plot(x,y1,ylab="소비자물가상승률",type='l',col='red',ylim=c(0.3,1.5))
    par(new=TRUE)
    plot(x,y2,lty="dotted",type='l',col='blue',ylim=c(0.3,1.5))
    legend(4,1.4,legend = c("2015년","2016년"),lty=1, bg="yellow",col=c('red','blue'))
    

2. barplot() : 막대그래프
  - 막대 그래프를 구현하기 위한 함수 : barplot(인자)
  - 주요인자
    names : 막대의 라벨표시
    space : 막대와 막대 사이의 간격
    beside : TRUE 각각의 값 마다 막대 그림
    horiz : TRUE 막대를 가로형으로 표시

      a<-c(100,200,300,350,500)
      barplot(a)
      
      a<-c(100,200,300,350,500)
      barplot(a,name=c('a','b','c','d','e'),col='blue')
      
      plot.new()
      data<-read.csv("/Users/ichanghwan/Desktop/rt_data/seoulpopulation.csv", 
                     sep=",", header = TRUE,fileEncoding = 'euc-kr')
      data1<-subset(data,남자>=230000)
      gu<-data1$자치구
      barplot(data1$남자, names.arg=gu, las=1, col='red', horiz=TRUE,main="남성20만명 이상거주 구")
      
      
  * 그룹화된 막대형 그래프 구현
      plot.new()
      data<-read.csv("/Users/ichanghwan/Desktop/rt_data/seoulpopulation.csv", 
                     sep=",", header = TRUE,fileEncoding = 'euc-kr')
      # 로우별 합계 
      tot<-rowSums(data[,c('남자','여자')],na.rm=TRUE)
      # 컬럼 붙이기
      data<-cbind(data,tot)
      # 500000만 이상만 
      data1<-subset(data,tot>=500000)
      barplot(as.matrix(data1[1:6,2:3]),legend=c('남','여'),beside=TRUE, las=1,col=c('blue','red'),
              main="인구 50만명 이상 성별현황", ylim=c(0,400000))
      
      
3. hist() : 히스토그램
  - 연속적 데이터의 분포를 분석하고자 할 경우 이용
  - 히스토그램 구현하기 위한 함수 : hist(인자)

    x<-c(23,33,32,45,37,28,15,35,43,27,46,33,38,46,50,29)
    par(family="AppleGothic")
    hist(x,main="연령분포", xlim=c(20,50), col="blue")
    
4. boxplot() : 상자도표
  - 서로 다른 종류의 데이터 범위를 비교할수 있도록 시각화
  - 데이터 집합범위, 사분위수 범위, 중위수 등을 알수 있음

  data<-read.csv("/Users/ichanghwan/Desktop/rt_data/birthdie.csv", header = TRUE, fileEncoding = 'euc-kr')
  boxplot(data$출생, data$사망,names=c("출생","사망"),col=c('pink','darkgreen'),
          main="서울 2013-2014 출생사망 비교")
  
5. 원형 그래프
  x<-c(27,43,15)
  pie(x,radius = 1, labels=c("한식","중식","일식"))