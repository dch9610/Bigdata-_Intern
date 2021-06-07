R시각화

1. plot 함수
  - plot(x,y,옵션) : x - x축 데이터, y - y축 데이터
  - 한글 깨짐 방지 : par(family="AppleGothic")
  - 옵션 
    main : 그래프 제목
    sub : 그래프 부제목
    xlab : x축 제목, ylab : y축 제목
    type : plot의 형태
    axes : plot의 테두리선 ex) axes=F x,y축 테두리선 표시하지않음
    col : plot의 색상
    
age<-c(23,35,43,28,55,47,58)
par(family="AppleGothic")
plot(age,main="연령분포",xlab = "x축",ylab="y축")

1-1 type의 형태
  - type = 'p' : 포인트가 점의 형태로 그래프 
  - type = 'l' : 선의 형태로 그래프
  - type = 'o' : 점이 선과 중첩되어 통과
  - type = 'h' : 히스토그램과 같이 수직선
  - type = 's' : 계단형 그래프


1-2 par() 함수 : 그래프에 유용
  - 화면분할 효과 : 여러 그래프를 한 화면에 그릴때 유용
  - 선의 굵기와 종류, 문자의 크기와 글꼴, 색상 지정
  - 형식 : par(인자)

  * 한화면에 여러 그래프 그리는 작업
  par(mfrow=c(행의 개수, 열의 개수))

  plot.new()
  par(mfrow=c(1,3))
  plot(c(1:3),main="a-type")
  plot(c(2:5),c(2:5),main="b-type", type = 'o')
  plot(c(1:5),main="c-type", type = 'l')
  
  
  * type의 옵션값에 따른 6개 그래프를 한 화면에 표시
  plot.new()
  x<-c(1:5)
  y<-c(1:5)
  par(mfrow=c(2,3))
  kind=c('p','l','o','s','S','h')
  for(i in 1:length(kind)){
    title<-paste("type=",kind[i])
    plot(x,y,type=kind[i],main=title)
  }

  
2. 다양한 효과를 위한 추가적 함수들
  points() : 그래프 점과 관련
    - 형식 : points(x,y,pch=점의 형태를 번호로 표시, cex=점의 크기)
    - 점의 형태는 r basic_18days 확인

    plot.new()
    plot(1:5,1:5,main="여러 형태의 점")
    points(1,3.2,pch=2,cex=2)
    points(2,2,pch=15,cex=4)
    points(4,2.8,pch=20,cex=1)

  lines() : 선을 그래는 함수
    - 형식 : lines(x,lty=선의 타입기술, col=선 색상, lwd=선의 굵기 )
  
    plot.new()
    plot(1:5,1:5,type='n')
    lines(c(1,3),c(3,3),lty="dotted",lwd=3,col='red')
    lines(c(1,3),c(4,4),lty="solid", lwd=2, col= 'green')
    lines(c(1,5),lty='dashed',lwd=4,col='blue')

  * 기타 그래프를 풍성하게 작업하기 위한 함수
    - 그래프 안에 선 그리기 : abline() -> abline(h=3,lty="solid")
    - 그래프 안에 텍스트 삽입 : text() -> text(3,2,"하위 data군")
    - 범례삽입 -> legend(x,y,cex=글자크기,col=색상,lty=선 종류)
    - 그래프의 축 삽입 -> axis(위치(1-아래, 2-왼쪽, 3-위, 4-오른쪽),
                          at=그려지는 값, labels=그려지는 값의 레이블, lty=선종류)
    
      plot.new()
      par(mfrow=c(1,1))
      x<-c(165,170,173,175,180,176,172,168)
      y<-c(66,70,72,80,85,78,65,62)
      irum<-c('a','b','c','d','e','f','g','h')
      plot(x,y,type="b",pch=21,col=rainbow(length(x)))
      abline(h=seq(70,80,5), col='gray', lty=3)
      text(175,73,"표쥰",col='black')
      axis(2, at=x,labels=x, col.axis="gray")
      legend("bottomright",col = rainbow(length(x)),legend = irum,lty=1)