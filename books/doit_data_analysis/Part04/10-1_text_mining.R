# 10-1. 힙합 가사 텍스트 마이닝
# 텍스트 마이닝
# - 문자로 된 데이터에서 가치 있는 정보를 얻어 내는 분석 기법
# - 형태소 분석 : 문장을 구성하는 어절들이 어떤 품사로 되어 있는지 파악
# - 의미를 지닌 품사의 단어들을 추출해 각 단어가 얼마나 많이 등장했는지 확인

# 텍스트 마이닝 준비

# 1. 자바와 rJava 패키지 설치
install.packages('multilinguer')
library(multilinguer)
install_jdk()
# 2. KoNLP 의존성 패키지 설치
install.packages(c('stringr','hash','tau','Sejong','RSQLite','devtools'), type='binary')

# 3. KoNLP 패키지 설치하기
install.packages('remotes')
remotes::install_github('haven-jeon/KoNLP',
                        upgrade = 'never',
                        INSTALL_opts = c("--no-multiarch"),
                        force = T)
library()
library(KoNLP)
search()
detach(package:KoNLP)
extractNoun("대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.")
download.file(url = "https://repo1.maven.org/maven2/org/scala-lang/scala-library/2.11.8/scala-library-2.11.8.jar",
              destfile = paste0(.libPaths()[1], "/KoNLP/Java/scala-library-2.11.8.jar"))

# 4. 형태소 사전 설정하기
useNIADic()

# 5. 데이터 준비하기
getwd()
txt <- readLines("hiphop.txt")
head(txt)

# 6. 특수문자 제거하기
install.packages('stringr')
library(stringr)

# 특수문자 제거
txt <- str_replace_all(txt, '\\W',' ')