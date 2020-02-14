# install.packages("httpuv")
# install.packages("rgdal")
# install.packages("geojsonio")
# install.packages("rgeos")
# 
# library(httpuv)
# library(rgdal)
# library(geojsonio)
# library(rgeos)
# java, rJava 설치
# install.packages("multilinguer")  # 자바 설치 ㄴㄴㄴ
# 이때 mac 사용자는 데스크탑 비밀번호를 물어봅니다. 입력해줘야 설치가 진행됩니다.
library(multilinguer)
# install_jdk()
# 위 함수에서 에러가 발생하면 알려주세요
# https://github.com/mrchypark/multilinguer/issues

# 의존성 패키지 설치
# install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

# github 버전 설치
# install.packages("remotes")
# remotes::install_github('haven-jeon/KoNLP', upgrade = "never")

library(KoNLP) # 의존성 라이브러리를 포함해서 library를 붙혔음
useSejongDic() 
