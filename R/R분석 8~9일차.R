df <- data.frame(col1 = 1:5,
                 col2 = c(90:93, NA),
                 col3 = c("a", NA, "c", NA, NA), 
                 col4 = c("가", "나", "다", NA, "라"),
                 col5 = as.character(10:14))

df

# 데이터프레임의 열 별로 문자 여부를 확인하려고 한다
# 왜 결과가 모두 TRUE로 나올까?
apply(df, 2, is.character)

# apply() 함수는 배열을 전달받아 함수를 열 또는 행방향으로 적용해준다
# 만약 데이터프레임이 전달되면 as.matrix() 함수를 통해
# 배열로 변환하고 함수를 적용하기 때문에 하나의 자료형으로 일치시키면서 숫자 컬럼들을 문자 컬럼으로 형변환하게 된다

as.matrix(df)

help(apply)


# col3 컬럼의 문자 여부를 확인하려고 한다
# 왜 2개의 코드 결과가 다를까?
is.character(df$col3)
is.character(df["col3"])

# 벡터로 가져온다
class(df$col3)
# 데이터 프레임으로 가져온다
class(df["col3"])

# 벡터로 가져온다
df$col3
# 데이터 프레임으로 가져온다
df["col3"]

# 벡터로 가져온다
is.character(df[["col3"]])
# 대괄호와 대괄호 2개 사용등에 대한 설명 
?Extract


a <- 10 # 함수 밖에서 선언된 변수 : 전역변수

test <- function(num1, num2){
  # 함수 내에서 선언된 변수 : 지역변수
  cat(num1, num2) # 지역변수인 매개변수를 출력
  print(a) # 함수내에 존재하지 않으므로 전역변수 a를 출력
  }

# 함수에서 변수를 사용하면 먼저 지역변수에서 찾아보고, 존재하지 않으면 전역변수를 사용한다
# 만약 함수 내에서 지역변수를 전역변수의 이름과 동일하게 생성했다면 전역변수가 아닌 지역변수를 사용하게 된다
test(10, 20)

# 사용자 정의 함수
# 사용자의 이름과 나이를 출력하는 함수
# 함수를 정의한다 -> 함수를 만든다
print_info <- function(name, age){
  cat("이름 :", name, "나이:", age)
}

# 함수를 호출한다 -> 함수를 사용한다
print_info("홍길동", 30)

# 함수를 호출할때는 인수의 개수와 매개변수의 개수가 동일해야 한다
print_info("홍길동", 30, "남성")
# 인수의 순서와 매개변수의 순서가 일치해야 한다
print_info(30, "홍길동")
# 매개변수명을 직접 명시하면 순서와 상관없이 사용 가능하다
print_info(age = 30, name = "홍길동")

help(seq)
result1 <- sum(1:10)
result1

result2 <- print_info("홍길동", 30)
result2

calculate1 <- function(num1, num2){
  # R은 마지막으로 실행된 코드의 값을 자동으로 return 한다
  add <- num1 + num2
  minus <- num1 - num2
  multiple <- num1 * num2
  divide <- num1 / num2
  # 리턴값은 1개의 값만 가능하므로 여러개의 값을 리턴하고 싶을때는 자료구조 안에 담아서 자료구조를 리턴한다
  return(c(add, minus, multiple, divide))
}

result3 <- calculate1(10, 20)
result3

apply
sum(1:10, 3:5)
sum(1:10)
help(sum)

calculate1
sum
# 해당 함수의 코드를 보고 싶다면 ctrl 누른상태에서 함수의 이름을 마우스로 클릭
apply()

# 함수의 매개변수에 대한 설명
args(apply)

# 함수를 사용할수 있는 예시 코드
example(apply)

# 가변 인수
func1 <- function(...){
  args1 <- c(...)
  args2 <- list(...)
  print(args1)
  print(args2)
}

func1(1,2)
func1(1:10, 2:10, 3:10)
help("...")
help(sum)

sum(1, NA, 3)
sum(1, NA, 3, na.rm = T)
help(seq)

# 디폴트 매개변수
func2 <- function(data1, data2 = "ab"){
  cat("data1 = ", data1, "\n")
  cat("data2 = ", data2)
}

# data1 <- a, data2 <- b
func2("a", "b")
# data1 <- a, data2 <- ab
func2("a")

# 숫자 컬럼은 NA의 개수를 확인 할 수 있지만
# 문자 컬럼은 NA의 개수를 확인 할 수 없다
summary(df)

# 데이터프레임의 모든요소의 NA여부 확인
is.na(df)
sum(is.na(df))

is.na(df$col3)
sum(is.na(df$col3))

# 문자 컬럼의 NA개수를 확인하는 함수
check_char_na1 <- function(data){
  # 문자 컬럼의 NA개수와 컬럼의 이름을 출력한다
  for(col in colnames(data)){
    # 가지고온 컬럼이 문자인지 확인
    if(is.character(data[[col]])){
      # 문자 컬럼이라면 NA의 개수를 출력
      cat("문자 컬럼", col, " NA의 개수:",
          # sum(is.na(data$col1))...
          sum(is.na(data[[col]])), "\n")
    }
  }
}

check_char_na1(df)

# 문자 컬럼의 NA개수를 확인하는 함수
# 문자 컬럼이면서 NA가 1개라도 존재하면 NA의 개수를 출력한다
check_char_na2 <- function(data){
    # 전달한 인수의 값이 데이터프레임이 아니라면
    if(!is.data.frame(data)){
      # is.data.frame(data) == FALSE 코드와 동일
      stop("데이터프레임이 아닙니다")
      # warning("데이터프레임이 아닙니다")
      # return(NULL)
    }
  # 익명함수 -> 이름이 존재하지 않는 함수(재사용 불가)
  cols <- data[sapply(data, function(col) is.character(col) & any(is.na(col)))]
  colSums(is.na(cols))
  
}

check_char_na2(1:10)

# any() : 벡터내의 모든 값중 하나라도 조건을 만족하면 TRUE
# all() : 벡터내의 모든 값이 조건을 만족하면 TRUE

vec1 <- c(1:3, NA)
vec2 <- c(NA, NA, NA)

any(is.na(vec1))
all(is.na(vec1))
all(is.na(vec2))

# 파일 입출력

# 경로확인 -> 내가 지금 있는 위치 확인
getwd()

# 경로설정 -> 위치 이동
# 상위경로 1900_r_본인폴더 로 올라간 후, resource 폴더 안으로 이동
setwd("../resource")
getwd()
# 작업디렉토리 이동 -> 생성하는 스크립트 파일 또는 여러개의 파일들이 해당 작업디렉토리에 생성된다
setwd("../workspace")
getwd()

# 작업디렉토리의 파일 목록
dir()

# readLines(파일명과 확장자)
# 경로를 알려주지 않아 현재 경로에서 찾아보고 존재하지 않으면 에러가 발생
readLines("person.txt")
# 상대경로(현재 경로를 기준으로)
readLines("../resource/person.txt")
# 절대경로(드라이부터 시작)
person <- readLines("D:\\1900_r_sms\\resource\\person.txt")

# 파일의 문자들을 한줄씩 읽어서 벡터로 가져온다
person

# read.table() 데이터를 데이터프레임으로 읽어온다
person <- read.table("D:\\1900_r_sms\\resource\\person.txt")
person
class(person)

# read.csv()
students <- readLines("../resource/student_score.csv")
students

# 숫자 형태의 컬럼은 자동으로 결측값을 판단해서 비어있으면
# NA로 채운다. 그러나 문자 컬럼은 빈 문자가 존재할 수 있어서
# NA로 채우지 않는다
students <- read.csv("../resource/student_score.csv")
students
View(students)

help(read.csv)

students2 <- read.csv("../resource/student_score.csv", na.strings = "")
View(students2)

# excel 파일
install.packages("readxl")
library(readxl)

dui_accidents <- read_excel("../resource/dui_accidents.xlsx")
View(dui_accidents)

read_excel(file.choose())

# 내장 데이터셋
data()
data(AirPassengers)
View(AirPassengers)
data(cars)
View(cars)

