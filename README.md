# Capstone_I

## 온새미로

### 팀원 및 역할 소개

|이름|학과|직책|역할|
|--|--|--|--|
|윤소원|전산통계|팀장|SW개발 및 디버깅
|고혜원|전산통계|팀원|자료수집, 데이터베이스 관리
|김정석|전산통계|팀원|아이디어 논의, 데이터베이스 관리
|문혜경|전산통계|팀원|캡스톤 수행 계획 및 결과보고, 자료수집

***

### 언어 및 사용기술 

- JAVA 
- Mysql
- Html, Css, Javascript
- Bootstrap 5.0
- FHIR

***

![test](https://user-images.githubusercontent.com/95139082/162564453-9b7056c3-3932-45ab-9373-cfc0ee073adb.gif)

### 구현방법 
```
// 토글바 
    if (sidebarToggle) {
        
        sidebarToggle.addEventListener('click', event => {
            
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        
        });
    }
```

***

### 프로젝트 설명

FHIR project 입니다.

중간고사 끝나면 매주 1회 이상 커밋할 예정입니다.

Test용 웹페이지 확인 : https://testfhir.netlify.app/
