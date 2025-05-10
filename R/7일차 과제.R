# ===========================================================================
# help() 함수를 사용하여 ifelse() 함수 설명 읽기
help(ifelse)
# ===========================================================================
# ifelse() 함수와 벡터
# x벡터를 활용하여 x2 벡터 만들기
# x 벡터의 값이 3의 배수이면 -> x2 벡터는 "짝"
# x 벡터의 값이 3의 배수가 아니라면 -> x2 벡터는 x1 벡터의 값을 그대로
# 단, 3의 배수 중 33, 66, 99 에서는 짝짝을 저장합니다

x <- 1:100

# 결과예시
# [1] "1"    "2"    "짝"   "4"    "5"    "짝"   "7"    "8"    "짝"   "10"  
# [11] "11"   "짝"   "13"   "14"   "짝"   "16"   "17"   "짝"   "19"   "20"  
# [21] "짝"   "22"   "23"   "짝"   "25"   "26"   "짝"   "28"   "29"   "짝"  
# [31] "31"   "32"   "짝짝" "34"   "35"   "짝"   "37"   "38"   "짝"   "40"  
# [41] "41"   "짝"   "43"   "44"   "짝"   "46"   "47"   "짝"   "49"   "50"  
# [51] "짝"   "52"   "53"   "짝"   "55"   "56"   "짝"   "58"   "59"   "짝"  
# [61] "61"   "62"   "짝"   "64"   "65"   "짝짝" "67"   "68"   "짝"   "70"  
# [71] "71"   "짝"   "73"   "74"   "짝"   "76"   "77"   "짝"   "79"   "80"  
# [81] "짝"   "82"   "83"   "짝"   "85"   "86"   "짝"   "88"   "89"   "짝"  
# [91] "91"   "92"   "짝"   "94"   "95"   "짝"   "97"   "98"   "짝짝" "100" 

x2 <- ifelse(x %% 33 ==0,'짝짝',
             ifelse(x %% 3 == 0,'짝',x))
x2

# 삼육구 게임 
x3 <- ifelse(x %/% 10 %%3 == 0 & x %/% 10 != 0,ifelse(x %%3==0 & x %% 10 != 0,'짝짝','짝'),
             ifelse(x %%10%%3 ==0 & x%%10 != 0,'짝',x ))
x3

# ===========================================================================
# ifelse() 함수와 매트릭스
# mat1 매트릭스를 생성할때 13번째, 26번째, 39번째 순서로 저장된 값들만
# 홀수 짝수 여부를 판별하기

{
  set.seed(1)
  mat1 <- matrix(sample(50, 50, replace = TRUE), 5)
  mat1
}
idx <- 1:50

mat2 <- matrix(ifelse(idx %%13 ==0,ifelse(mat1[idx]%%2 ==0,'짝수','홀수'),
       mat1),5)
mat2

# ===========================================================================
# ifelse() 함수와 데이터프레임
{
  student_number <- 1:20
  student_name <- paste0(rep("학생", 10), 1:20)
  
  set.seed(2)
  math_score <- as.character(sample(100, 20, replace = T))
  eng_score <- sample(100, 20, replace = T)
  kor_score <- sample(100, 20, replace = T)
  students <- data.frame(student_number,
                         student_name,
                         math_score,
                         eng_score,
                         kor_score)
  students 
}
# ---------------------------------------------------------------------------
# students 데이터 프레임의 구조 파악하기
str(students)
summary(students)

# ---------------------------------------------------------------------------
# 숫자가 아닌 문자로 저장되어 있는 점수 관련 컬럼을 수정하여 다시 숫자로 변경하기
students$math_score <- as.numeric(students$math_score)
summary(students)

# ---------------------------------------------------------------------------
# 3개의 점수를 활용하여 새로운 total_score와 avg_score 컬럼을 추가하기
# 단, avg_score에 저장하는 평균점수는 반올림하여 소수점 2번째 자리까지만 저장합니다(필요 함수 검색)
students$total_score <- students$math_score + students$eng_score + students$kor_score
students$avg_score <- round(students$total_score /3,2)
students

# ---------------------------------------------------------------------------
# ifelse() 함수를 사용하여 학생들의 과목별 점수에 따라 학점을 부여하여 math_grade, eng_grade, kor_grade 컬럼을 각각 추가하기

# 70 ~ 100점 : A
# 40 ~ 69 : B
# 0 ~ 39 : C
{
students$math_grade<- ifelse(students$math_score>=70,'A',
                    ifelse(students$math_score>=40,'B','C'))
students$eng_grade<- ifelse(students$eng_score>=70,'A',
                    ifelse(students$eng_score>=40,'B','C'))
students$kor_grade<- ifelse(students$kor_score>=70,'A',
                    ifelse(students$kor_score>=40,'B','C'))
}
students

# ---------------------------------------------------------------------------
# 모든 과목의 학점이 A인 학생 구하기(A, A, A)
# 모든 과목의 학점이 B인 학생 구하기(B, B, B)
# 모든 과목의 학점이 C인 학생 구하기(C, C, C)
#1

sum(rowSums(students[,8:10] == 'A')==3) # 모든 과목이 A인 학생수
students[rowSums(students[,8:10] == 'A')==3,'student_name'] # 모든 과목이 A인 학생
sum(rowSums(students[,8:10] == 'B')==3) # 모든 과목이 B인 학생수
students[rowSums(students[,8:10] == 'B')==3,'student_name'] # 모든 과목이 B인 학생
sum(rowSums(students[,8:10] == 'C')==3) # 모든 과목이 C인 학생수
students[rowSums(students[,8:10] == 'C')==3,'student_name'] # 모든 과목이 C인 학생

#2
cond <-students$math_grade =='A' & students$eng_grade =='A' & students$kor_grade =='A' 
nrow(subset(students,cond)) # 모든 과목이 A인 학생수
subset(students,cond)[,'student_name'] # 모든 과목이 A인 학생

# ---------------------------------------------------------------------------
# 각 과목별 학점의 수 구하기
# ex) 수학과목 -> A학점 : 5명, B학점 10명, C학점 5명
# 힌트 : 빈도를 구하는 함수 table

table(students$math_grade) # A학점 : 9명, B학점 6명, C학점 5명
table(students$eng_grade) # A학점 : 6명, B학점 6명, C학점 8명
table(students$kor_grade) # A학점 : 6명, B학점 5명, C학점 9명

# ---------------------------------------------------------------------------
# 전체 학생들의 수학, 영어, 국어 과목의 평균 점수중에서
# 가장 점수가 높은 과목과 만점자가 존재하는 과목을 구하기 -> 코드 결과가 아닌 직접 주석으로 작성
# 가장 평균 점수가 높은 과목 :  math
# 만점자(100점)이 존재하는 과목 : eng
cat(mean(students$math_score), '/',mean(students$eng_score),'/',mean(students$kor_score))
cat(sum(students$math_score == 100),'/',sum(students$eng_score == 100),'/',sum(students$kor_score == 100))

# ---------------------------------------------------------------------------
# 심화 -> 해당 문제를 풀기 위한 여러가지 함수들을 찾아보세요
# 두 과목 이상 A 학점인 학생의 수 구하기
grade <- students[,-c(1,3:7)]
grade

grade[rowSums(grade[,-1] =='A')>=2,1] # 두 과목 이상 A 학점인 학생
subset(grade,rowSums(grade[,-1] =='A')>=2) # 두 과목 이상 A 학점인 학생의 모든 데이터 조회
sum(rowSums(grade[,-1] =='A')>=2) # 6명

grade$count_A <-( grade$math_grade == 'A') + ( grade$eng_grade == 'A') + ( grade$kor_grade == 'A')
grade
sum(grade$count_A >= 2)
