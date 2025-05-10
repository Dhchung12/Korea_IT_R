# ========================================================================
# 과제.1
vector1 <- c(3, 11, 5, 8, 2)
vector2 <- c(9, 4, 5, 9, 5)  

# 위의 2개의 벡터를 사용하여 matrix1 변수에 저장하기
matrix1 <- matrix(c(vector1, vector2), 2)
matrix1
# 아래의 연산을 진행하고 그 결과가 양수인 요소들만 가져오기
mat1_new <- matrix1 * 2 + 3 - 13

# 풀이
mat1_new>0
mat1_new[mat1_new>0]

# ========================================================================
# 과제 .2
# 주어진 매트릭스 matrix2에서 홀수번째 행, 짝수번째 열을 가져와서
# matrix3 변수에 저장하기
# matrix3 출력 결과예시 : 
# 7 19
# 9 21
# 11 23

matrix2 <- matrix(1:30, ncol = 5)

# 풀이
matrix2
matrix2[c(T, F), c(F, T)]

# ========================================================================
# 과제.
# 아래의 배열 ar에서 모든면의 1열에서 짝수 요소만 가져와서 출력하기

ar <- array(1:24, dim=c(2, 3, 4))
ar
cond1<-ar[  , 1 , ] %%2 ==0
ar[,1,][cond1]
# 질문 ) ar[ cond1, 1,cond1] 배열에서도 인덱스 논리행렬이 벡터로 바뀌나?

# ========================================================================
# 과제
# 아래 코드는 R에 내장된 매트릭스를 가져오는 코드 입니다
# 순차적으로 실행하고 문제를 풀어보세요

# VADeaths 데이터셋을 가져오기
data("VADeaths")
# VADeaths 데이터셋에 대한 설명 확인
help("VADeaths")
# 해당 데이터셋은 vds 변수에 저장
vds <- VADeaths
vds
# tolower(값) : 값을 소문자로 변환하여 반환한다
colnames(vds) <- tolower(colnames(vds))
View(vds)
# vds 변수에 저장된 데이터셋은 1940년대 버지니아주의 연령 및 거주지역별 사망률 입니다
# female : 여성, male : 남성
# urban : 도시, rural : 외곽
class(vds) # 자료구조의 자료형 확인하기
mode(vds) # 데이터의 자료형 확인하기
nrow(vds) # 행의 개수 구하기
ncol(vds) # 열의 개수 구하기
dimnames(vds) # 행과 열의 이름
rownames(vds) # 행의 이름
colnames(vds) # 열의 이름

# 50.0보다 큰 사망률 찾기
cond2 <- vds >50.0
vds[cond2]

# rural male의 사망률이 30.0보다 작은 연령대를 구하기 
vds_1 <- vds[,1] # rural male 열만 조회 후 변수 vds_1에 담기
names(vds_1[vds_1<30.0]) # 30.0보다 작은 조건을 조회후 이름 조회

# 60~64세에서 사망률이 30을 넘는 지역과 성별 구하기
vds_2 <- vds[3,] # 60~64세 의 사망률 데이터 조회 후 변수 vds_2에 담기
names(vds_2[vds_2>30.0]) # 사망률이 30을 넘는 데이터 조회 후 이름 조회

# 위에서 구한 지역과 성별의 65~69세 사망률 구하기
local_gender_name <- names(vds_2[vds_2>30.0]) # 위에서 구한 지역,성별 변수 local_name에 담기
vds['65-69',local_gender_name] # 해당 지역,성별에 대한 65~69세 사망률 조회

# 지역별 남성과 여성의 사망률 차이를 구해 urban_gender_gap, rural_gender_gap 변수에 저장하기
# 남성 - 여성 또는 여성 - 남성으로 계산하세요(둘 중 하나)
rural_gender_gap <- abs(vds[,1]-vds[,2]) 
urban_gender_gap <- abs(vds[,3]-vds[,4]) 
rural_gender_gap
urban_gender_gap


# urban_gender_gap, rural_gender_gap 변수의 벡터를 연결하여 새로운 매트릭스를 만들고 vds2 변수에 저장하기
vds2 <- cbind(rural_gender_gap,urban_gender_gap) # urban_gender_gap, rural_gender_gap을 변수로 봐야 하므로,
                                                  # cbind를 사용하여 두 변수를 열로 만든다.
vds2

# vds2 변수 결과예시(남성 - 여성 사망률 계산시) :
#      urban_gender_gap rural_gender_gap
# 50-54              7.0              3.0
# 55-59             10.7              6.4
# 60-64             17.7              6.6
# 65-69             19.5             10.1
# 70-74             21.1             11.7

