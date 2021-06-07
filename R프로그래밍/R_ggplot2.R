ggplot2::
  - 기본 그래픽함수보다 간단하면서도 다양한 시각적 효과를 표현함

패키지 개요
  - 데이터를 시각화하는데 있어서 간단한 설정만으로 다양한 그래픽 표현이 가능
  - 하나의 데이터를 가지고도 여러 그래픽 표현이 가능
  - ggplot2패키지를 이용하기 위해서 작업이 필요
    * install.packages("ggplot2")
    * library(ggplot2)
  - 한글꺠짐 방지 : theme_set(theme_grey(base_family = 'AppleGothic'))


1. qplot()
  - r에서 기본적으로 사용하는 plot() 함수와 비슷한 구조를 가진 함수
  - 형식 : qplot(x,y,data=, color=, shape=, size=, alpha=, geom=, method=, formula=, facets=,
               xlim=, ylim=, xlab=, ylab=, main=, sub=)

    a<-c(167,170,173,178)
    b<-c(55,65,77,60)
    qplot(b,a,col="yellow")


2. ggplot()
  - ggplot(data,aes(x = x축 데이터, y = y축 데이터)) + geom 당신이 원하는 그래프()
  - 구성 
      data : 그래픽을 원하는 데이터 집합
      aes() : 데이터 각 레코드를 그래픽 요소에 매핑하는 작업(미적 요소 매핑)
      geom() : 각 축에 숫자형 데이터를 입력받아 실제로 시각화 하기 위해 좌표계에 표시하는 작업
      stat : 해당 데이터값에 대한 통계적 처리방법
      
2-1 
    data<-data.frame(mat=c(55,75,80,65,90,100,70,85), eng=c(65,100,45,50,75,90,90,65),
                     avg=c(53,70,83,70,93,95,75,80), irum=c('김','이','박','최','문','윤','노','정'))
    theme_set(theme_grey(base_family = 'AppleGothic'))
    ggplot(data,aes(x=avg, y=mat)) + geom_line(colour='red') + geom_point(aes(colour=irum))
    
    # 레이어 추가
    ggplot(data,aes(x=mat,y=avg)) + geom_line(colour="red") + geom_point(aes(colour=irum)) +
      geom_line(aes(x=eng, y=avg),colour='green') + geom_point(aes(x=eng, y=avg,color=irum))
      

2-2 geom_bar() 이용
    
      datainfo<-read.csv("/Users/ichanghwan/Desktop/rt_data/highwaybus09.csv", sep=",",
                         header = TRUE, fileEncoding = 'euc-kr')
    # stat_bin : 표시하려는 항목의 개수를 카운트하여 빈도를 표시하도록 설정, 
    #               항목을 계산하기 위해 'identity'로 설정
      ggplot(datainfo, aes(x=선별,y=총이용인원)) + geom_bar(stat='identity', fill='orange')
   
         
2-3 그룹별 평균을 계산하여 막대그래프로 표시

    # with 함수: datainfo에 대하여 작업하겠다.
    # 이용율을 선별로 평균을 구하겠다 (결측값 무시)
    meandf<-as.data.frame(with(datainfo,tapply(이용율,선별, mean, na.rm=TRUE)))
    # 선 컬럼 추가
    meandf$노선<-rownames(meandf)
    names(meandf)<-c("이용율","노선")
    ggplot(meandf,aes(노선,이용율)) + geom_bar(stat='identity', aes(color=노선))
    
    
    
2-4 누적막대그래프 작업

    # 선별, 차종별 이용율
    meandf1<- as.data.frame(with(datainfo, aggregate(이용율,list(선별=선별, 차종=차종),mean,na.rm=TRUE)))
    meandf1$평균이용율<-rownames(meandf1)
    names(meandf1)<-c("선별","차종","평균이용율")
    ggplot(meandf1,aes(선별,평균이용율)) + geom_bar(stat = 'identity', aes(fill=차종))

    
    # 100%기준 누적 막대
    ggplot(meandf1,aes(선별,이용율,fill=차종)) + geom_bar(stat='identity', position = 'fill')
    
    # 나눠진 막대
    ggplot(meandf1, aes(선별, 이용율, fill=차종)) + geom_bar(stat='identity', position = 'dodge')




