

# 중복 제거 distinct

    SQL 연산이나 보고서를 작성할 때 데이터 값의 행이 중복되었다면 중복을 제거하고 계산하거나 출력한다.

    SELECT job_id
    FROM employees;

    job_id 출력했는데 중복값이 그대로 다 출력된다.
    이 출력 결과만으로는 job_id의 전 종류를 한눈에 보기 어렵다.
    이럴때 중복을 제거하여 데이터의 값을 종류별로 하나만 출력해보자.

    SELECT DISTINCT job_id
    FROM employees;

    데이터 값이 종류별로 하나씩만 출력되었다.
    열 이름 뒤에 다른 열이름도 나열하면 모두 적용된다.



# 별명 사용하기

    SELECT 문의 결과를 출력할 때 열 이름이 제목으로 출력된다.
    원래 이름 대신에 임의로 다른 이름을 표시할 수 있다. alias

    - 별명은 열이름을 임시로 변경하는데 사용된다. 원래 이름을 바꾸는 것이 아니다.
    - 별명은 열이름 바로 뒤에 as 를 붙여서 만든다.
    - as 는 생략 가능하다.
    - 별명에 공백, 특수문자, 대소문자를 사용하려면 "" 묶어서 사용한다.


    # 그냥 뽑아주기
    SELECT employee_id, first_name, last_name
    FROM employees;

    # 별명 사용해서 뽑기
    SELECT employee_id AS 사원번호,
         first_name AS 이름,
         last_name AS 성
    FROM employees;



# 연결해서 출력  (버티컬바 ||)

    EX) 성하고 이름하고 붙여서 찍고싶은경우..

    SELECT employee_id AS 사원번호,
         first_name||' '||last_name AS 이름,            #여백넣기위해 ' '  를 넣고 버티컬바를 또 적음
    FROM employees;

# Quiz
    이메일 뒤에 몽땅 @yahoo.com 붙여서 출력하기

        SELECT employee_id AS 사원번호,
         first_name||' '||last_name AS 이름,
         email||'@yahoo.com' AS 이메일주소
    FROM employees;




# 산술 처리
    #세금 40% , 실수령 60%
    SELECT employee_id,                 # 사원번호
    salary,                             # 월급
    salary*0.4,                         # 세금
    salary*0.6                          # 실수령액
    FROM employees;

    산술연산은 실무에서 많이 사용된다. 특히 비즈니스를 위한 다양한 보고서 작성 시 필수이다.



# WHERE 구문을 활용한 데이터 검색

    행에서 특정 데이터 값을 조회하거나 비교연산처리하는 방법
    사용자가 원하는 데이터를 조회할 때 사용하는 WHERE문은 
    FROM 다음에 기술한다.

    SELECT *
    FROM employees
    WHERE employee_id <= 200;
    
    
    SELECT *
    FROM employees
    WHERE first_name = 'David';

    찾는 문자열에서는 당연히 **대소문자를 구분한다.  david 로 소문자로 입력하면 당연히 안나옴.


    # BETWEEN 은 숫자의 범위사이를 나타낼때 쓴다.

        SELECT *
        FROM employees
        WHERE salary BETWEEN 10000 AND 20000; 
        #월급이 만불에서 이만불 사이



# IN 연산자

    조회하고자 하는 데이터가 여러개일때 사용한다.
    = 과 유사하지만 =은 조회조건으로 데이터 값을 하나만 지정할 수 있는데 반해
    IN 연산자는 데이터 값을 여러개 즉 목록으로 지정할 수 있다. 
    여러개의 값 목록 중에서 하나의 값이라도 만족하면 조건에 해당하는 결과를 출력한다.



    employees 테이블에서 salary가 10000, 17000, 24000 인 직원의 정보를 출력하세요.
    
        SELECT *
        FROM employees
        WHERE salary IN (10000, 17000, 240000);


# LIKE 연산자

    조회 조건의 값이 명확하지 않을 때 사용한다.
    % 

    employees 테이블에서 job_id가 AD포함하는 모든 데이터를 출력하세요.

        SELECT *
        FROM employees
        WHERE job_id LIKE '%AD%';     # %AD%   AD 앞뒤에 어떤글자가 있어도 모두 검색


        응용)

        last_name  LIKE '김%' '김'으로 시작하는 이름을 모두 출력
        first_name LIKE '%나%' 이름에 '나'가 있으면 모두 출력
        first_name LIKE '%자' 이름 맨 끝에 '자'가 있으면 모두 출력


    Q. employees 테이블의 job_id에서 AD를 포함하면서 뒤에 글자 3개인 데이터를 조회하시오.

        SELECT *
        FROM employees
        WHERE job_id LIKE '%AD___';  # 뒤의 글자수는 언더바로 나타낸다.



# IS NULL

    null은 값이 없는것(비어있는)을 뜻한다. 0 이나 공백과 다르다.

      SELECT *
      FROM employees
      WHERE manager_id IS NULL;



    




Q. employees 테이블의 salary가 4000을 초과하면서 job_id가 IT_PROG 인 데이터를 조회


     SELECT *
      FROM employees
      WHERE salary > 4000
      AND job_id = 'IT_PROG';



Q. employees 테이블의 salary가 4000을 초과하면서 job_id가 IT_PROG이거나 FI_ACCOUNT인 데이터를 조회

     SELECT *
      FROM employees
      WHERE salary > 4000
      AND job_id = 'IT_PROG'
      OR job_id = 'FI_ACCOUNT';


Q. employees 테이블의 salary가 4000을 초과하면서 job_id  IT_PROG 아닌 데이터를 조회

     SELECT *
      FROM employees
      WHERE salary > 4000
      AND job_id NOT LIKE 'IT_PROG';


      ** 아니다.  라고할때 파이썬과 자바에서  !=  이렇게 표기하지만
        오라클에서는 <> 가 표준이다.





-------------------------------------------------------------------------------------------------------------


# 함수


    오라클 데이터 베이스 에서의 함수는 문자, 숫자, 날짜 값 등을 조작할 수 있고 데이터 타입 끼리 변환할 수 있다.
    복수의 행을 조합하여 그룹당 하나의 결과로 출력할 수 있다.

    - 데이터 값을 계산하거나 조작한다.
    - 행을 그룹으로 계산하거나 요약한다.
    - 열의 데이터 타입을 변환한다.

    단일행 함수 : 한번에 하나의 데이터를 처리하는 함수.
    그룹행 함수 : 여러 데이터를 동시에 처리하여 그 결과를 반환하는 함수.
                 GROUP BY 와 함께 많이 사용되며 요약 정보를 출력할 때 유용하다.
        
        
        문자 CHAR     - 고정 길이의 문자 타입
        
        문자 VARCHAR2 - 가변 길이의 문자 타입
        숫자 NUMBER (INT) - 숫자 타입을 저장
        날짜 DATE

        * 실무에서는 VARCHAR2 를 많이 사용한다.




    # 단일행 함수
        
        테이블의 열은 한가지 데이터 타입으로 지정되어 있다. 지정된 데이터 타입과 일치하는 데이터 값만
        저장할 수 있다.

        1. 각 행에 대해 수행
        2. 데이터 타입에 맞는 함수를 사용해야 한다.
        3. 행별로 하나의 결과를 반환한다.
        4. SELECT, WHERE, ORDER BY 절에서 사용된다.
        5. 함수 안의 함수 처럼 중복해서 사용할 수 있다.
        6. 중첩 할 경우 안쪽에서 바깥쪽 순서로 진행된다.


    
    LOWER / UPPER / INICAP    
        소문자로 / 대문자로 / 첫 글자만 대문자로.

            # last_name 모두 소문자/대문자 로 바꾸기
            email 소문자로 바꾸기

                SELECT last_name,
                        LOWER(last_name),
                        UPPER(last_name),
                    email,
                        INITCAP(email)
                FROM employees;



    SUBSTR
        문자열 중 지정한 길이만큼을 추출한다.
        데이터의 값이 이미 가공되어 저장되어 있어도 일부 문자열을 잘라내 가공해야 할 때가 많이 사용된다.

        추출된 데이터는 기초 통계 처리나 다른 테이블과 붙일 때 등  상황에 맞게 유용하게 응용할 수 있다.


            # employees 테이블에서 JOB_ID열의 앞의 두자리는 부서를 나타낸다.
             앞의 두자리 데이터를 잘라내면 부서를 표시할 수 있다.
 
                SELECT job_id,
                SUBSTR(job_id, 1,2)
                FROM employees;



    REPLACE 
        특정 문자열을 찾아서 바꾼다

            # job_id에서 ACCOUNT를 찾아서 바꾸자

                SELECT job_id,
                REPLACE (job_id,'ACCOUNT','ACCNT')
                FROM employees;



    LPAD / RPAD
        특정 문자로 자리수 만들어 채우기 (여기서 PAD는 padding 이다.)
        LPAD - 왼쪽부터 특정 문자로 자리수를 채우는 함수
        RPAD - 오른쪽 부터 특정 문자로 자리수를 채우는 함수


        #   first_name을 12자리로 만드는데, 왼쪽기준으로 비는곳은 *로 채워서 12자리 만들어라.
            (보통 글자수를 맞춰서 끝자리가 보기좋게 딱 떨어지게 만들려는 의도)
            
                SELECT first_name,
                LPAD(first_name, 12, '*')
                FROM employees;
                
        #   first_name을 12자리로 만드는데, 오른쪽기준으로 비는곳은 여백으로 채워서 12자리 만들어라.(딱히 보이진않음)
               
                SELECT first_name,
                LPAD(first_name, 12, ' ')
                FROM employees;



    CONCAT
        문자열을 연결한다.

    LENGTH
        문자열의 길이를 구한다. 
    
    INSTR 
        문자의 위치를 구한다.

    LTRIM / RTRIM
        좌측 / 우측 여백 제거 


































