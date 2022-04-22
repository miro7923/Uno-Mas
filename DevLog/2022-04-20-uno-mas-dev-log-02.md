# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 2 - Spring Legacy 프로젝트를 위한 .gitignore 설정

* 작성일 : 2022.04.20
* 작성자 : 황유진
* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 윤정환, 황유진
* GitHub Repository : [https://github.com/miro7923/Uno-Mas](https://github.com/miro7923/Uno-Mas)<br><br><br>

# 개발환경
* MacBook Air (M1, 2020)
* Windows 10
* OpenJDK 8
* Spring Tool Suite 4.14.0
* Spring framework 4.3.1.RELEASE
* Tomcat 8.5
* MySQL Workbench 8.0.19<br><br><br>

# 기간
* 2022.4.13 ~ 2022.5.20<br><br><br>

# 주제
* 웹 백엔드 수업 중 마지막 과제로 팀 프로젝트를 진행하게 되었다.
* 조건은 `Spring` 기반으로 웹 사이트를 제작하는 것이다.
* 총 팀원은 7명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.<br><br><br>

# 진행상황
* `Spring Legacy Project`로 프로젝트를 진행하게 됨에 따라 `GitHub` 원격저장소에서 파일을 공유할 때 시스템 환경설정 파일은 함께 공유 되지 않아야 할 필요가 있었다. 
* 하지만 아무 처리를 하지 않으면 각종 시스템 환경설정파일이 함께 업로드 되기 때문에 `.gitignore` 설정을 해줘야 했는데 유명한 `.gitignore`를 만들어주는 사이트에서 만드는 버전으로는 좀 한계가 있었다. `STS`에서 커밋을 하려고 할 때 `.classpath`같은 파일들이 제외되지 않았기 때문이다.

## .gitignore 1차 설정
* [https://lsjsj92.tistory.com/566](https://lsjsj92.tistory.com/566)
* 처음엔 위 글을 참고하여 [https://www.toptal.com/developers/gitignore](https://www.toptal.com/developers/gitignore) 이 사이트에서 만들었는데 좀 부족했다.
* `STS`에서 커밋을 하려고 하니 `.classpath`, `MINIFEST.MF`와 같은 파일들이 제외되지 않았기 때문이다. 나 혼자 하는 프로젝트면 알아서 걸러내고 하면 되겠지만 팀으로 하는 프로젝트이기 때문에 누군가는 저 파일들을 실수로 업로드를 할 것이다. 그렇기 때문에 저것들이 처음부터 제외되도록 `.gitignore`를 수정해야 했다.

## .gitignore 2차 설정
* [Spring Legacy 프로젝트에서 사용한 .gitignore 파일](https://jazzodevlab.tistory.com/50)
* 위 글을 참고하여 `gitignore`를 다시 한 번 설정했다.
* 나는 맥 OS를 쓰지만 나머지 팀원들은 모두 윈도우 OS를 사용하기 때문에 각각 운영체제의 환경설정 파일도 제외하는 코드를 추가했다.

```html
# Created by https://www.toptal.com/developers/gitignore/api/windows,macos,eclipse,java
# Edit at https://www.toptal.com/developers/gitignore?templates=windows,macos,eclipse,java

mybatis-config.xml
log4j.xml

lecture
target
pom.properties
.classpath
MANIFEST.MF

### Eclipse ###
.metadata
bin/
tmp/
*.tmp
*.bak
*.swp
*~.nib
local.properties
.settings/
.loadpath
.recommenders

# External tool builders
.externalToolBuilders/

# Locally stored "Eclipse launch configurations"
*.launch

# PyDev specific (Python IDE for Eclipse)
*.pydevproject

# CDT-specific (C/C++ Development Tooling)
.cproject

# CDT- autotools
.autotools

# Java annotation processor (APT)
.factorypath

# PDT-specific (PHP Development Tools)
.buildpath

# sbteclipse plugin
.target

# Tern plugin
.tern-project

# TeXlipse plugin
.texlipse

# STS (Spring Tool Suite)
.springBeans

# Code Recommenders
.recommenders/

# Annotation Processing
.apt_generated/
.apt_generated_test/

# Scala IDE specific (Scala & Java development for Eclipse)
.cache-main
.scala_dependencies
.worksheet

# Uncomment this line if you wish to ignore the project description file.
# Typically, this file would be tracked if it contains build/dependency configurations:
#.project

### Eclipse Patch ###
# Spring Boot Tooling
.sts4-cache/

# Eclipse Core
.project

# IDT-specific (Eclipse Java Development Tools)
.classpath

### Java ###
# Compiled class file
*.class

# Log file
*.log

# BlueJ files
*.ctxt

# Mobile Tools for Java (J2ME)
.mtj.tmp/

# Package Files #
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# virtual machine crash logs, see http://www.java.com/en/download/help/error_hotspot.xml
hs_err_pid*
replay_pid*

### macOS ###
# General
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon


# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

### macOS Patch ###
# iCloud generated files
*.icloud

### Windows ###
# Windows thumbnail cache files
Thumbs.db
Thumbs.db:encryptable
ehthumbs.db
ehthumbs_vista.db

# Dump file
*.stackdump

# Folder config file
[Dd]esktop.ini

# Recycle Bin used on file shares
$RECYCLE.BIN/

# Windows Installer files
*.cab
*.msi
*.msix
*.msm
*.msp

# Windows shortcuts
*.lnk

# End of https://www.toptal.com/developers/gitignore/api/windows,macos,eclipse,java
```

* 이렇게 수정하고 `STS`에서 다시 커밋을 시도해 보니까 소스파일만 깔끔하게 `Staging` 목록에 나타난다. <br><br><br>

# 출처
* [https://lsjsj92.tistory.com/566](https://lsjsj92.tistory.com/566)
* [Spring Legacy 프로젝트에서 사용한 .gitignore 파일](https://jazzodevlab.tistory.com/50)<br><br><br>

# 마감까지
* `D-30`
