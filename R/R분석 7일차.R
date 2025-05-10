# 요인(factor)

genders <- c("F", "M", "M", "F", "M")
genders[6] <- "강아지"
genders

# factor(값, 범주) -> 새로운 범주를 지정해서 생성
f_genders <- factor(levels = c("M", "F"))
f_genders

f_genders[1:5] <- c("F", "M", "M", "F", "M")
f_genders

# 강아지는 범주에 속한 값이 아니므로 NA가 들어간다
f_genders[6] <- "강아지"
f_genders

# 새로운 값을 추가하거나 기존 값을 수정할때 범우세 속한 값을 저장해야 한다
f_genders[5] <- "홍길동"
f_genders

str(f_genders)

# 범주형 데이터는 일반적으로 빈도 분석을 많이 사용한다 그러므로 summary()를 요인에 사용하면 빈도값을 구해준다
summary(f_genders)

# table() 함수 : 빈도를 구하는 함수 -> 범주형이 아니어도 사용 가능
table(f_genders)

# useNA = ifany(NA가 존재하면 개수를 알려준다)
# useNA = always(NA가 존재하지 않아도 개수를 알려준다)
table(f_genders, useNA = "ifany")
table(f_genders, useNA = "always")

blood_type <- c("A", "B", "O", "O", "B", "A")
f_blood <- factor(blood_type)

f_blood

# levels() : 요인의 범주를 확인
levels(f_blood)

# 새로운 범주를 추가할때는 levels() 함수를 사용하여 추가한다
levels(f_blood)[4] <- "AB"
levels(f_blood)

# nlevels() : 범주의 개수를 구한다
nlevels(f_blood)

# stringsAsFactors : 데이터프레임을 생성할때
# 문자 컬럼을 factor로 지정할수 있다(T 옵션으로 사용시)
help(data.frame)

# 순서가 존재하는 요인
survey <- c("만족", "불만족", "만족", "보통", "보통")
f_survey <- factor(survey,
                   ordered = T,
                   levels = c("매우 불만족", "불만족",
                              "보통", "만족", "매우 만족"))

f_survey

# 보통 이상의 만족도만 가져오고 싶다
# 보통, 만족, 매우 만족만 가져오기

f_survey[f_survey == "보통" |
           f_survey == "만족" |
           f_survey == "매우만족"]

# 순서가 존재하는 요인은 대소관계를 통해 조건에 해당하는 데이터를 가져올 수 있다
f_survey[f_survey >= "보통"]

# 이전 버전에서는 벡터로 변경할 경우 문자의 값이 아닌 숫자의 값으로 변경되었다
# 만약 사용하는 버전이 숫자로 변경된다면
# as.character() 를 사용하여 일반 벡터로 변경한다
as.vector(f_blood)
str(f_blood)

help(data.frame)

# if문
# scan() : 콘솔창으로 여러개의 값을 입력받아 코드로 가져온다
# 모든 입력이 끝나면 엔터를 친다

num1 <- scan()
num1

if(num1 > 0){
  # 입력된 숫자 num1이 양수이면 실행할 코드
  print("양수 입니다")
}
# 2개의 중괄호 중에 무조건 1개만 실행된다
if(num1 %% 2 == 0){
  # num1이 짝수이면 실행할 코드
  print("짝수 입니다")
}else{
  # num1이 홀수이면 실행할 코드
  print("홀수 입니다")
}

# 3개의 중괄호 중에 무조건 1개만 실행된다
if(num1 > 0){
  # num1 > 0 조건식이 참이면 실행할 코드
  print("양수 입니다")
}else if(num1 == 0){
  print("0입니다")
}else{
  print("음수 입니다")
}

# 실습.
# 입력된 점수에 따라 학점을 출력한다
# 학점이 만약 90 ~ 100점 이면 A학점
# 만약 80 ~ 89 이면 B학점
# 만약 70 ~ 79 이면 C학점
# 만약 70점 보다 낮다면(미만) F학점
# 해당 출력을 if문으로 구현하기
# 사용자가 입력하는 점수는 0~100점 사이이다
score <- scan()

if(score >= 90){
  print("A학점")
}else if(score >= 80){ #일단 else if로 넘어온 순간부터
  # score 는 90보다 작다 그렇기 때문에 범위조건을 1개만 사용해도 가능하다
  print("B학점")
}else if(score >= 70){ # score < 80 이라는 조건을 만족하므로 내려오게 된다
  print("C학점")
}else{
  print("F학점")
}

# if문의 조건식으로 여러개의 논리값을 사용할 경우
# if문은 무조건 소괄호의 조건식의 결과가 1개여야 한다
# if(c(TRUE, FALSE)){
#   print("조건식이 참이면 실행할 코드")
# }

scores <- c(85, 63, 98, 40, 38, 100, -30)

# ifelse() 함수 : 여러개의 값을 가지고 조건을 판별할 수 있다
# ifelse(조건식, 참일경우 실행할 코드, 거짓일 경우 실행할 코드)

ifelse(scores == 100, "우수학생", "비우수학생")

help(ifelse)

# 논리연산자(&&, &, ||, |)의 차이
T & T
T && T

# & : 각 논리값을 전부 비교한다
c(T, F) & c(T, T)
# && : 여러개의 논리값 중에 첫번째 논리값만 비교한다
c(T, F) && c(T, T)
# 버전이 업데이트 되면서 길이가 1이 아닌 논리값을 논리 연산자를 통해 사용하면 에러가 발생한다

ifelse(scores >= 90, "A학점",
       ifelse(scores >= 80, "B학점",
              ifelse(scores >= 70, "C학점",
                     ifelse(scores >= 0, "F학점", "잘못된 점수"))))

grades <- ifelse(scores >= 90, "A학점",
                 ifelse(scores >= 80, "B학점",
                        ifelse(scores >= 70, "C학점",
                               ifelse(scores >= 0, "F학점", "잘못된 점수"))))

grades

student_scores <- data.frame(scores, grades)
student_scores

# 잘못된 점수라는 학점을 NA로 변경한다
student_scores$grades <- 
  ifelse(grades == "잘못된 점수", NA, grades)

student_scores$grades <- 
  ifelse(scores < 0, NA, grades)

student_scores

# switch() 함수

day <- "tuesday"

switch(day,
       monday = "월요일",
       tuesday = "화요일",
       wednesday = "수요일")


# 계산기
num1 <- 30
num2 <- 20

oper <- "/"
result <- switch(oper,
                 "+" = num1 + num2,
                 "-" = num1 - num2,
                 "*" = num1 * num2,
                 "/" = num1 / num2)
result

{
  print("hello")
  print("hello")
}

# for문
# {} 중괄호를 사용하면 여러개의 코드를 한번에 실행할 수 있다

{
  vec1 <- c("a", "b", "c")
  mat1 <- matrix(10:18, 3)
  arr1 <- array(20:27, dim = c(2, 2, 2))
  lst <- list(vec1, mat1, arr1)
}

# 벡터와 for문
for(item in vec1){
  print(item)
  # item <- vec1[1]
  # print("hello")
  # item <- vec1[2]
  # print("hello")
  # item <- vec1[3]
  # print("hello")
}

for(i in 1:100){
  print("hello")
}

# 구구단 2단 출력하기
for(i in 1:9){
  cat("2 x", i, "=", i*2, "\n")
}

# 과제. 구구단 2~9단까지 위의 코드를 활용하여 출력하기

# 1. i <- 1
# 2. j <- 1
# 3. cat()
# 4. j <- 2
# 5. cat()
# 6. i <- 2

for(i in 1:3){
  for(j in 1:2){ # 내부 for문의 모든 반복이 끝나야 i가 다음 요소를 가져온다
    cat("i = ", i, "j = ", j, "\n")
  }
}



















