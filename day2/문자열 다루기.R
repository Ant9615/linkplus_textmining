letters;LETTERS
letters[3]
LETTERS[3:6]

tolower("Eye for eye") # 모든 문자를 소문자로
toupper("Eye for eye") # 모든 문자를 대문자로

ms <- 'Learning R is a interesting'
strsplit(ms, split = ' ') # spcebar 단위로 조개기
strsplit('interesting', split = '')

st <- c("1st",'2nd','3rd')
paste(st, sep=",")
paste0(st, sep=",") # 빈틈없이 문자열을 결합할 때

R_c <- 'Getting Started
R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS. To download R, please choose your preferred CRAN mirror.'
R_parag <- strsplit(R_c, split = '\n')
R_parag # 문단단위로 구분 

R_s <- strsplit(R_parag[[1]],split = '\\. ') # 문장단위로 구분 
R_s

R_w <- strsplit(R_s[[2]],split = ' ') # 단어단위로 구분 
R_w

grep('software', R_s) # 원하는 값 찾기 
grepl('please', R_s)

sub('ing','ING', ms) # 원하는 글자 교체하기
gsub('ing','ING', ms) # 전역으로 바꾸기
gsub('R|so|is', 'BB',ms) # 여러개 교체하기 
#지우려면 두번째 인자에 빈컴마 

substr('abcdef',2,4) # 두 번째 글자부터 네 번째 글자까지 출력 

# 정규표현식에서 []는 or 의 의미 [^0-9]는 숫자 아닌 것(^는 not의 의미임)
# ()는 and의 의미 
