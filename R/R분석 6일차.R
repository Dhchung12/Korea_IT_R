# 데이터프레임 생성

name <- c("길동", "영희", "철수", "진실")
math <- c(70, 100, 95, 65)
eng <- c(95, 90, 45, 80)
kor <- c(100, 96, 72, 38)
df1 <- data.frame(name, math, eng, kor)

# 열의 이름을 지정하지 않고 생성
# 열의 이름을 지정하지 않아 이름이 자동 생성된다
data.frame(c("길동", "영희"), c(10, 6))

# 열의 이름을 지정하면서 생성
# 열 이름(컬럼명) = 해당 컬럼에 들어갈 벡터
data.frame(name = c("길동", "영희"),
           age = c(10, 6))

# 기존 벡터를 활용해서 생성하면 벡터명이 열의 이름으로 지정된다
df1 <- data.frame(name, math, eng, kor)
df1

# 소괄호가 여러개가 중첩되어 있으면 안쪽에 있는 소괄호가 먼저 실행된다
# 매트릭스 생성 -> 해당 매트릭스로 데이터프레임 생성
data.frame(matrix(c(10, "a", "b", 5), ncol = 2))

# 데이터프레임에서 요소 가져오기
# 1행 1열의 요소 가져오기
df1[1, 1]
df1[4, 4]

# 모든열의 1, 2행의 요소 가져오기
df1[1:2,]
# 음수 인덱스
df1[-1, ]

# 데이터프레임은 인덱스 번호를 1개 사용하면 열을 기준으로 요소를 가져온다
# 4개의 열중에서 1번째 열을 가져온다
df1[1]

as.vector(df1)
# 벡터로 변환했더니 list로 변환된다
class(as.vector(df1))

class(df1[1])
class(df1[[1]])

# $ : 데이터프레임의 열을 가져온다
df1$name
df1$"name"

df1[1] # 열을 데이터프레임 자료형으로 가져온다
df1$name # 열을 벡터 자료형으로 가져온다
df1[[1]]

df1[c(T, F), ]
df1[, c(T, F)]

# 실습.
# 국어점수가 90점 이상인 학생들의 모든 정보 조회
# 모든 정보 -> 모든 열을 가져온다
# 국어점수가 90점 이상 -> 행에서 지정해야 한다

df1 >= 90
# 0개 이상의 문자는 어떤 숫자보다 크다

df1[, "kor"] >= 90
df1$kor >= 90
df1["kor"] >= 90
df1[, 4] >= 90

df1[df1$kor >= 90, ]

# 수학점수가 80점 이상인 학생들의 수학점수 조회
# 수학점수가 80점 이상 -> 행에서 지정해야 한다
# 수학점수 조회 -> 열에서 지정해야 한다

df1$math >= 80
df1[df1$math >= 80, c("math", "eng")]
df1

df1$math[df1$math >= 80]

# 과제.
# 이름이 길동이거나 영어점수가 90점 이상인 학생들의 이름과 국어점수 조회하기

# 데이터프레임의 정보
class(df1) # 자료구조의 자료형
mode(df1) # 데이터의 자료형
typeof(df1) # 데이터의 자료형

# 각 열의 자료형을 확인한다
mode(df1$name)
mode(df1$math)

# 각 열의 자료형과 구성 데이터를 보여준다
# obs : 관측치(행의 개수)
# variables : 변수(열의 개수)
str(df1)

# 행과 열의 개수
dim(df1)
# 행의 이름, 열의 이름
dimnames(df1)

# 행의 이름도 인덱스 번호를 사용하여 자동 지정된다
df1["1", ]

rownames(df1)
colnames(df1)

# 데이터의 총 개수가 아닌 열의 개수를 알려준다
length(df1)
ncol(df1)
nrow(df1)
length(df1$name)

# summary()
# 숫자 컬럼에 대해 평균, 중앙값, 최소값, 최대값, 1사분위수, 3사분위수, NA의 개수를 구해준다
summary(df1)

# attributes()
attributes(df1)

df1
# ["훈아", "100", "100", "100"]

# 데이터프레임의 사용
# 추가
# 존재하지 않는 행 인덱스
df1[5, ]
# 존재하지 않는 열 인덱스 -> 에러 발생
df1[, 5]
# NULL이 조회된다
df1$gender

# 열 이름을 지정하지 않아 이름을 자동 지정한다
df1[, 5] <- 10:13
df1

df1$gender <- c("남성", "여성", "여성", "남성")

df1
# cbind() : 새로운 열을 추가한다
cbind(df1, 100:103)

# rbind() : 새로운 행을 추가한다
df3 <- rbind(df1, c("훈아", 100, 100, 100, 14, "남성"))

df3
# 기존 열들의 값이 숫자였으나 새로운 행을 추가하면서 문자로 변경되었다
summary(df3)

df3$math <- as.numeric(df3$math)

# 수정
df1$name[1] <- "갈동"
df1

df1[1, 1] <- "길동"
df1

# 삭제
# 열 삭제는 $열이름으로 사용한다
df1$V5 <- NULL
df1

df1 <- df1[-4, ]
df1

# 성별이 여성인 행들만 삭제하기
# 성별이 남성인 행들만 가져온다
df1 <- df1[df1$gender != "여성",]
df1

# 행의 이름을 변경한다
rownames(df1) <- c("1번")
df1

df1[rownames(df1) != "1번", ]

# 리스트 생성
person <- list("길동", 35, T)
person

person <- list(name = "길동",
               age = 35,
               isMarried = T)
person

lst <- list(num_vec = 1:3,
            str_vec = c("a", "b"),
            mat = matrix(10:18, ncol = 3),
            df = df1)
lst

# 리스트에서 요소 가져오기
class(person[1])
class(person[[1]])

# 길이가 1인 리스트로 가져온다
lst[1]
# 길이가 3인 벡터로 가져온다
lst[[1]]

# 길이가 1인 리스트에서 3번째 요소를 가져오므로 NA로 가져온다
lst[1][3]
# 길이가 3인 벡터에서 3번째 요소를 가져오므로 3을 가져온다
lst[[1]][3]

class(lst[3])
class(lst[[3]])

lst[1:2]
# [] -> 여러개의 인덱스를 사용
# [[]] -> 하나의 인덱스를 사용
lst[[1:2]]

# $ 를 사용하면 대괄호 2개로 가져오게 된다
lst$mat
class(lst$mat)

# 리스트의 사용
# 추가
lst[["log_vec"]] <- c(T, F, T, F)
lst

lst[[6]] <- 1:3
lst

lst$vec <- 1:10
lst

# 수정
lst[[6]] <- c("a", "b", "c")
lst

lst$vec <- 1:5
lst
# 지정한 키값들을 조회한다
names(lst)[6] <- "str_vec2"
lst

# 삭제
lst$vec <- NULL
lst






