# 패키지 설치
install.packages("ggplot2")

# 패키지 사용준비
library(ggplot2)
library(quantreg)

# 설명서
help(ggplot2)
library(help = ggplot2)

data()
View(mpg)
View(economics)
View(diamonds)

{
  a <- ggplot(economics, aes(date, unemploy))  
  c <- ggplot(mpg, aes(hwy))
  c2 <- ggplot(mpg)
  d <- ggplot(mpg, aes(fl))
  e <- ggplot(mpg, aes(cty, hwy))
  f <- ggplot(mpg, aes(class, hwy,fill = class))
  g <- ggplot(diamonds, aes(cut, color))
  i <- ggplot(economics, aes(date, unemploy))
}

# ==================================================
# geom_path
# 데이터로 economics를 사용하고, economics의 date를 x축, unemploy를 y축으로 설정한다.
# path -> 경로를 그린다
# lineend = 'butt' : 선의 끝이 뭉툭하게 잘리게 처리(기본값)
# lineend = 'round' : 선의 끝이 둥글게 처리
# lineend = 'square' : 선의 끝이 직각으로 처리
# lab(title = '표의 이름',x = x축 이름, y = y축 이름)
a + geom_path(lineend = "round") # + labs(title = 'Unemploy of Date')

# ==================================================
# geom_area
# 데이터로 mpg를 사용하고, mpg의 hwy를 x축, count를 y축으로 설정한다.
# area ->  x축과 데이터 선 사이의 영역을 채움
# stat = 'bin' : 빈 카운트 계산
c + geom_area(stat = "bin", fill = "skyblue",color = 'black')

# geom_dotplot
# dotplot -> 값을 각각의 점으로 나타냄
c + geom_dotplot(fill = "skyblue",color = 'black')

# geom_freqploy -> 빈도 다각형으로 나타냄
c + geom_freqpoly()


# geom_histogram -> 히스토그램 즉 막대그래프 형태로 나타냄
c + geom_histogram()

# geom_qq
# mpg 데이터셋의 hwy가 정규분포를 따르는지 시각적으로 평가
# 점들이 대각선에 가까이 위치할수록 hwy변수는 정규 분포에 가깝다
c2 + geom_qq(aes(sample = hwy),color = 'red') # +geom_qq_line(aes(sample = hwy))


# ==================================================
# geom_bar -> mpg데이터셋의 f1변수의 각각의 값들의 갯수를 막대그래프로 나타냄
d + geom_bar()

# ==================================================
# geom_point
# mpg 데이터셋의 cty에 대한 hwy값을 점으로 나타낸다
e + geom_point()

# geom_quantile
e + geom_quantile()

# geom_smooth
# 추세선 또는 평활화된 곡선을 추가한다. 선 주변의 영역은 신뢰구간이다.
e + geom_smooth(method = 'loess')

# ==================================================
# f <- ggplot(mpg, aes(class, hwy))
# geom_col -> 데이터 프레임에 이미 존재하는 값을 사용하여 막대의 높이를 지정
# geom_bar -> 카운트된 값 또는 빈도를 사용하여 막대의 높이 지정
f + geom_col()

# geom_boxplot
# 데이터의 분포를 요약하며, 중앙값,사분위수,범위 및 이상치(아웃라이어)를 시각적으로 표현
# 아웃라이어의 기준 : (Q1 - 1.5*IQR)< or (Q3 + 1.5*IQR)>
# IQR = Q3 - Q1
f + geom_boxplot(outlier.colour = "red", outlier.shape = 16, outlier.size = 3)

# geom_dotplot
# y축을 기준으로 점을 쌓고, 점들이 중심을 기준으로 양쪽으로 쌓인다
# class별로 점의 색깔을 다르게 지정하고 싶으면 ggplot의 aes안에 fill = class를 추가한다.
f + geom_dotplot(binaxis = "y", stackdir = "center")

# geom_violin
# area : 모든 바이올린의 면적을 동일하게 만든다
# count : 데이터의 수에 비례하여 너비를 조절한다
# width : 동일한 너비를 유지한다.
f + geom_violin(scale = "area") # + geom_boxplot(width = 0.1, fill = "white")


# ==================================================
# geom_count
g + geom_count()

# geom_jitter
# 점들을 산포도(scatter plot)에 무작위로 약간씩 흩뜨려 표시하여 
# 데이터 포인트들이 겹쳐서 보이지 않도록 한다
# height : y축 방향으로 흩뜨리는 범위
# width : x축 방향으로 흩뜨리는 범위
e + geom_jitter(height = 2, width = 2)

# ==================================================
# geom_area
i + geom_area()

# geom_line
i + geom_line()

# geom_step
i + geom_step(direction = "hv")
