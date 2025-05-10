# 관계연산자
# help() : 도움말 함수
help(print)
help(cat)

# 관계연산자의 결과는 논리형으로 나온다
cat("10 == 3:", 10 == 3)
cat("10 != 3:", 10 != 3)
cat("10 > 3:", 10 > 3)
cat("10 < 3:", 10 < 3)
cat("10 >= 3:", 10 >= 3)
cat("10 <= 3:", 10 <=3)

# 문자와 숫자의 대소비교
# 1개 이상의 문자는 어떤 숫자보다 크다

"A" > 20
"AB" > 20
"" > 20

# 숫자와 논리의 대소비교
# 논리가 숫자로 자동 형변환된다(T -> 1, F -> 0)
TRUE > 0 # 1 > 0
FALSE == 0
TRUE == 1

# 논리 연산자
num <- 15
# 현실 세계에서는 사용하지만 R에서는 허용되지 않는다
# 10 < num < 20
num > 10 & num < 20
# num < 10, num > 20
num < 10 | num > 20

# &(AND) 연산자는 두개의 조건이 모두 참이여야 참
cat("참 and 참 :", TRUE & TRUE)
cat("참 and 거짓 :", TRUE & FALSE)

# (| -> OR) 연산자는 두개의 조건 중 하나라도 참이면 참
cat("참 or 참 :", TRUE | TRUE)
cat("참 or 거짓 :", TRUE | FALSE)
cat("거짓 or 거짓 :", FALSE | FALSE)

# 숫자와 논리
# 0을 제외한 모든 숫자는 TRUE로 형변환된다
1 & 10 # TRUE & TRUE
0 & 10 # FALSE & TRUE
-0.7&10 # TRUE & TRUE

# not 연산자
# 논리를 부정한다

!TRUE # not TRUE 
!FALSE # not FALSE

# 연산자의 우선순위
?Syntax

# or 연산자가 먼저 실행될경우 -> TRUE & FALSE
TRUE | TRUE & FALSE
# and 연산자가 먼저 실행될경우 -> TRUE | FALSE
# and와 or 연산자가 같이 사용되면 and가 먼저 연산된다

# = 와 <- 할당 연산자 중에서는 <- 할당 연산자가 우선순위가 높다
var2 <- var1 = 20

var3 <- var1 <- 10
var3

# 벡터의 생성
# vec <- 1,2,3,4,5

help(c)

# 숫자 벡터
c(1,2,3,4,5)
vec <- c(10,20,30,40,50)
vec

# 문자 벡터
vec <- c("A", "B", "C")
vec

# 논리 벡터
vec <- c(T, T, F)
vec

# 벡터는 하나의 자료형만 저장할수 있으므로 문자로 자동 형변환된다
# 문자가 1개라도 있다면 문자로 형변환된다
c(1, "hello", T)
# 숫자 + 논리 -> 숫자로 형변환된다
c(1, TRUE)
# 정수와 실수가 섞이면 실수로 형변환된다
c(1.7, 3, -10)

# seq() : 규칙성이 있는 숫자 값들을 벡터로 생성한다

even_numbers <- c(0, 2, 4, 6, 10)
even_numbers

odd_numbers <- c(1, 3, 5, 7, 9)
odd_numbers

odd_numbers <- seq(1, 100, 2)
odd_numbers

# by에 해당하는 증감값을 생략하면 1씩 증가하거나 1씩 감소한다
numbers <- seq(1, 100)
numbers

# 시작값과 끝값의 대소관계가 비교된다
numbers <- seq(100, 1)
numbers

# 시작값과 끝값의 대소관계에 따라서 증감값을 작성해야 한다
seq(100, 1, 1)

# 콜론 연산자
1:10
10:1

# rep() : 기존 벡터를 복제해서 새로운 벡터를 생성한다
# 1 ~ 100, 2씩 증가
seq(2, 1, 100)
seq(by = 2, from = 1, to = 100)

# 1~3 까지의 값을 각각 2번씩 반복하고, 총 3번 반복하는 값들을 벡터로 생성한다
rep(1:3, each = 2, times = 3)
# 111222 111222
rep(1:2, each = 3, times = 2)

names <- c("길동", "영희", "철수")
names

# () : 소괄호, {} : 중괄호, [] : 대괄호
name1 <- names[2]
name1

# 벡터에서 하나의 요소 가져오기
# names 안에 담긴 벡터에서 첫번째 요소
names[1]
# names 안에 담긴 벡터에서 세번째 요소
names[3]

#   1  2   3   4  -> index 번호
# [21][55][35][45]
ages <- c(21, 55, 35, 45)
ages[1]
ages[3]

# 벡터에서 여러개의 요소 가져오기
names[1,2]
# 가져와야 하는 인덱스 번호를 벡터에 담아서 전달한다
names[c(1,2)]
names[1:2]
names[seq(1,2)]

# ["길동"]["영희"]
names[1:2][2]
# ["길동"]["철수"]
names[c(1, 3)][2]

names2 <- names[c(1, 3)]
names2[2]

# R에서는 범위를 넘어선 인덱스 번호를 사용하면
# 해당하는 인덱스 번호까지 늘린후에 NA를 채워서 사용하게 된다
names[5]
names













