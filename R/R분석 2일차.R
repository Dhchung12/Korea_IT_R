#자료형

# 문자
'A'
"A"
'안녕'

# 수치
10
-10
10.3

#논리
TRUE
FALSE
true # 논리형은 대문자로 입력해야 한다.

# 변수
# age 이름의 변수에 19값을 저장
age <- 19
age

# name 이름의 변수에 '정다훈' 값을 저장한다.
name <- '정다훈'
name

# isTrue 이름의 변수에 TRUE 값을 저장한다.
isTrue <- TRUE
isTrue

# name 변수에 '김다훈' 값을 저장한다.
name <- '김다훈'

# 왼쪽 화살표 할당 연산자 왼쪽에 변수가 있다면 저장공간
# 오른쪽에 변수가 있다면 값으로 사용된다.
name2 <- name
name2

# 두개의 변수 값 바꾸기
# 코드를 작성하여 num1 변수에는 20, num2 변수에는 10이 저장되도록 

num1 <- 10
num2 <- 20

num3 <- num1
num1 <- num2
num2 <- num3

# 자료형 확인 함수
# 000이 무슨 자료형이니?
# 이름() : 함수

# class()
class(age) # age변수에 저장되어 있는 값의 자료형
class(name) #name변수에 저장되어 있는 값의 자료형
class(isTrue) #isTrue변수에 저장되어 있는 값의 자료형

# typeof()
typeof(age) # numeric 중에 정수인지 실수인지 알려준다.
typeof(name) 
typeof(isTrue)

# mode()
mode(age) 
mode(name) 
mode(isTrue)

# 000dl 숫자 또는 문자 또는 논리형이니?
is.numeric(age)
is.numeric(name)
is.character(name)
is.logical(isTrue)

# 논리 변수
T # T <- TRUE

# 변수이기 때문에 새로운 값을 저장할 수 잇지만 권장하지 않는다.
T <- '참'
T

T <- TRUE

# 자료형 변환 함수

# as.numeric()
as.numeric('19')

# TRUE ->1 , FALSE -> 0
as.numeric(T)
as.numeric(F)

# 숫자가 아닌 문자를 수치형으로 변환하면 NA로 변환된다.
num4 <- as.numeric('AS')
num4

# age2 변수를 생성하고 age변수의 19값을 문자형으로 형변환 하여 age2에 저장한다.
age2 <- as.character(age)
age2

# as.character()

# as.logical()
as.logical(17)
as.logical(-10)
as.logical(0)
as.logical(T)

# 0이 아닌 모든 숫자는 TRUE로 변환된다.
as.logical('a')

# 논리 형태를 가진 문자는 논리형으로 변환된다.
as.logical('TRUE')
as.logical('T')
as.logical('true')

# 산술 연산자
name

# print() : 소괄호 안의 하나의 값을 콘솔창에 출력한다.
print(name,age)

# cat() : 소괄호 안의 여러개의 값을 콘솔창에 출력한다.
cat(name,age)

cat('덧셈:',5+7)
cat('뺄셈',5-7)
cat('나눗셈:',5/7)
cat('곱셈:',5*7)
cat('몫:',7%/%5)
cat('나머지:',7%%5)
cat('거듭제곱:',2**3)
cat('거듭제곱:',2^3)

# 다른 자료형의 산술 연산
'a' + 'b'
'a' + 2

# TRUE :1 로 자동 형변환한다.
T+T # 1+1
T+F
F+F

# 나 -을 하나의 숫자값과 사용하면 단항 연산자로 사용한다.

-2
-TRUE
-T

# 제수 : 어떤 수를 나누는 수
# 피제수 : 나누어지는 수

10/0

Inf + Inf

# 그외의 값에 해당하는 값들이 산술 연산에 
# 사용되면 산술 연산의 결과 값이 나오지 않는다.

NA + 1
NaN + 10
NULL + 10
Inf + 10

# 실습1
# 1부터 n까지의 합 공식 : n(n+1)/2
# 위 공식을 이용하여 1~100까지의 합계를 구하고 결과를 
# 1 부터 100까지의 합계 : 5050 라고 출력하기

n <- 100 # 합 공식을 사용하려면 변수선언이 선행되어야한다.
result <- n*(n+1)/2
result

cat('1부터 100까지의 합계:', result)

numeric(1)
numeric(0)
class(numeric(3))

class(1:3)
a <- 1:3
a

class(c(1,2,3))
b<-c(1,2,3) 
b

c<-list(1,2,3)
class(numeric(3))

sum <- function(n){
  s <- n*(n+1)/2
  return(s)
}
sum(100)

a <- 1:3
a[3]
length(a)
