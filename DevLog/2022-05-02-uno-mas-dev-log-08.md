---
title: JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 8 - (TDD) Junit4를 사용한 DB 연결 테스트 코드 작성
toc: true
toc_sticky: true
toc_label: 목차
published: true
categories:
    - Uno mas
tags:
    - Project
    - UnoMas
    - Log
---

* 작성일 : 2022.05.02
* 작성자 : 황유진

* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 윤정환, 황유진
* 팀장 : 황유진
* 부팀장 : 오성은
* GitHub Repository : [https://github.com/miro7923/Uno-Mas](https://github.com/miro7923/Uno-Mas)<br><br><br>

# 개발환경
* MacBook Air (M1, 2020)
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
* 총 팀원은 7명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 팀 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 
* 본격적으로 백엔드 작업에 들어가기 앞서 도메인을 생성하고 `Datasource` 객체를 만들어 DB와 연결이 잘 되는지 테스트를 진행했다.

## pom.xml

```xml
<!-- https://mvnrepository.com/artifact/org.bgee.log4jdbc-log4j2/log4jdbc-log4j2-jdbc4.1 -->
<dependency>
    <groupId>org.bgee.log4jdbc-log4j2</groupId>
    <artifactId>log4jdbc-log4j2-jdbc4.1</artifactId>
    <version>1.16</version>
</dependency>
```

* 요즘 말 많은 `log4j`이지만 수업시간에 로그 출력용으로 사용을 해서 우리도 사용할 예정이다. `maven`으로 추가해 준다.

## root-context.xml

```xml
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"/>
    <property name="url" value="jdbc:log4jdbc:mysql://localhost:3306/unomasdb"/>
    <property name="username" value="MySQL계정아이디"/>
    <property name="password" value="비밀번호"/>
</bean>
```
* DB 연결시 사용할 `Datasource` 객체를 생성할 빈을 만든다.

## DataSourceTest.java

```java
package com.april.unomas;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
        )
public class DataSourceTest {

    private static final Logger log = LoggerFactory.getLogger(DataSourceTest.class);
	
    @Inject
    private DataSource ds;
	
    @Test
    public void DataSource객체확인테스트() {
        log.info("DataSource 객체: " + ds);
    }
}
```

* `src/java/test` 경로에 프로젝트를 생성시 기본으로 생성된 패키지와 같은 이름으로 패키지를 만든 뒤 테스트를 진행할 클래스를 만든다.
* `Junit4`로 테스트를 진행할 것이라서 `@RunWith(SpringJUnit4ClassRunner.class)` 어노테이션을 꼭 달아준다. (안 달면 테스트코드 열심히 작성해도 도로묵~!) 그리고 `@ContextConfiguration`로 의존 정보를 읽어올 경로도 지정해 준다. 아까 `root-context.xml`에서 빈을 만들었으니까 거기로 지정해주면 된다.(손으로 타이핑 할 필요 없이 `file:` 까지만 입력하고 컨트롤 엔터 누르면 자동완성된다.)
* 테스트 진행을 위한 세팅을 마쳤으면 클래스 내부에 `Datasource` 객체를 생성하고 의존성을 주입해 준다. 아까 `root-context.xml`에서 객체를 미리 생성해 놨으니까 여기에서는 그걸 가져다 쓰기만 하라는 뜻으로 `@Inject` 어노테이션을 붙인다. 만약 `root-context.xml`에 해당하는 객체 정보가 없다면 `@Inject`를 붙여도 작동하지 않는다.

* 이제 DB 작업을 위한 객체를 생성할 때 스프링 없이 훨씬 레거시 형태로 작업하던 때에 비하면 일일이 `new`를 할 필요가 없는 것이 가장 편리한 점이 아닐까! 코드가 훨씬 간결해졌다.

* 다음으로 테스트를 진행할 메서드를 만든다. 테스트용 메서드 이름은 밖에 보여질 것이 아니라서 보통 알아보기 쉽게 한글로 작성한다고 한다. 메서드 상단에 `@Test` 어노테이션을 꼭 붙여주어야 `Junit`으로 테스트 진행시 해당 메서드를 호출한다.

<p align="center"><img src="../../assets/images/junitTest1.png" width="500"></p>
* 여기까지 작성했다면 저장한 뒤 실행하는데 이때 `Junit Test` 옵션으로 실행해야 한다.

<p align="center"><img src="../../assets/images/junitTest2.png" width="500"></p>
* `Datasource` 객체에 의존 주입이 잘 되었다면 테스트가 성공했다는 메시지를 볼 수 있다.

<p align="center"><img src="../../assets/images/junitTest3.png" width="500"></p>
* 만약 실패 메시지가 뜬다면 로그를 잘 읽어보고 원일을 찾아 해결하면 된다.(온통 영어라 좀 긴장되긴 하지만 Caused by~로 시작하는 구문을 읽어보고 본인이 썼던 코드의 흐름을 생각해보면 찾을 수 있다)

## 다시 pom.xml
* `Datasource` 객체가 잘 생성되는 것을 확인했으니까 이제 얘를 사용해서 DB와도 잘 연결되는지 확인해 볼 것이다.
* 그 전에 `MyBatis`를 사용할 것이라서 `maven` 추가를 해 준다.

```xml
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.4.1</version>
</dependency>
		
<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>1.3.0</version>
</dependency>
```

## mybatis-config.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
  
<configuration>
</configuration>
```

* `MyBatis`의 환경설정 파일도 추가한다.
* DB 매핑 과정에서 축약어로 등록하고 싶은게 있으면 여기서 등록하면 된다.

## mapper

<p align="center"><img src="../../assets/images/junitTest4.png" width="200"></p>

* `MyBatis`가 DB와 연결할 때 사용할 쿼리문을 연결시켜줄 파일이 필요하다.
* 위의 형태로 폴더와 `xml` 파일을 생성한다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
<mapper namespace="com.unomas.mapper.ProductMapper">
</mapper>
```

* 일단 파일의 틀만 만들어 놓는다.

## root-context.xml

```xml
<!-- SqlSessionFactory 객체 생성 (mybatis 사용) -->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"></property>
    <property name="configLocation" value="classpath:/mybatis-config.xml"/>
    <property name="mapperLocations" value="classpath:mappers/**/*Mapper.xml"/>
</bean>
<!-- SqlSessionFactory 객체 생성 (mybatis 사용) -->
	
<!-- SqlSessionTemplate 객체 생성(디비연결~자원해제) -->
<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate" destroy-method="clearCache">
    <constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"/>
</bean>
<!-- SqlSessionTemplate 객체 생성(디비연결~자원해제) -->
```

* 빈 생성
* 아까 만들었던 `Datasource`를 참고해서 생성하도록 한다.

## MyBatisTest.java

```java
package com.april.unomas;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
        )
public class MyBatisTest {

    private static final Logger log = LoggerFactory.getLogger(MyBatisTest.class);
	
    @Inject
    private SqlSessionFactory sqlFactory;
	
    @Test
    public void 객체확인() {
        log.info("@@@@@@@@ sqlSessionFactory: " + sqlFactory.toString());
    }
	
    @Test
    public void DB연결() {
        SqlSession session = sqlFactory.openSession();
        log.info("@@@@@@@@ session: " + session);
    }
}
```

* 테스트를 진행할 클래스를 만들어 테스트 코드 작성 후 실행하면 내가 코드를 잘 썼는지 아닌지 알 수 있다.

<p align="center"><img src="../../assets/images/junitTest5.png" width="500"></p>

* 결과는.. 성공!

* 여기까지 완료되었으면 DB 연결을 위한 기본적인 세팅은 다 되었고 앞으로 `VO`와 `DAO` 객체를 만들어서 데이터베이스 작업을 수행하면 된다.<br><br><br>

# 마감까지
* `D-18`
