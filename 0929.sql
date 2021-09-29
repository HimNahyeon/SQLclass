

계정생성 비밀번호 생성 명령어
    ALTER USER 아이디 ACCOUNT UNLOCK IDENTIFIED BY 비밀번호;

현재 접속한 계정의 이름 확인
    SHOW USER;

SELECT -데이터베이스의 데이터를 조회한다.
        SELECT 를 이용하여 테이블에서 행을 선택하고 열을 선택하고 테이블과 테이블을 연결할 수 있다.
        데이터베이스에서 가장 기본이면서 중요한 SQL 구문이다.
    
        SELECT 은 항상 FROM 과 같이 사용된다.
        WHERE, ORDER BY 와도 함께 사용된다.

        * 주의 : 기본적으로 SQL은 대소문자를 가리지 않지만 보통 SQL구문은 대문자로 사용하는 관례가 있다. 
                 ***명령어는 대문자로 작성하고 나머지는 모두 소문자로 작성하자

        SQL은 한줄 여러줄로 작성할 수 있다. 들여쓰기도 필요없다. 하지만 관례적으로 들여쓰기를 사용하기도 한다.


    전체 데이터 조회하기 
        EX)
        SELECT * FROM TAB;     #TAB의 데이터를 조회한다.

        *는 모든 열을 의미한다.
        FROM 은 ~테이블로부터 라는 의미이다.


    원하는 열만 조회하기
        SELECT 명령문 뒤에 나열한 열 이름들의 순서대로 결과가 조회된다.
        열의 이름들은 쉼표를 계속 붙여서 나열할 수 있다.
        결과는 나열한 순서대로 출력된다. 모든 열을 조회하는 * 대신
        열 이름을 모두 나열해도 같은 결과가 출력된다.

        EX)
        SELECT employee_id, first_name, last_name
        FROM employees
        ORDER BY employee_id DESC;                # employee id 를 역순으로 (내림차순) 정렬

            
        