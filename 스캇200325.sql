SELECT *
FROM EMP;

SELECT HIREDATE
FROM EMP
WHERE HIREDATE = '80/12/17';

ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

SELECT *
FROM EMP;

-- BETWEEN
SELECT *
FROM EMP
WHERE SAL >= 1500 AND SAL <= 2000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 1500 AND 2000;

SELECT *
FROM EMP
WHERE ENAME LIKE '%N';

SELECT *
FROM EMP
WHERE ENAME LIKE 'A%';

SELECT *
FROM EMP
WHERE ENAME LIKE 'A%N';

SELECT *
FROM EMP
WHERE ENAME LIKE '%N%';

SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 사원들 중에 보너스가 500보다 작은 사람?
SELECT ENAME, SAL, NVL(COMM,0)
FROM EMP
WHERE NVL(COMM,0) < 500;

SELECT NVL(NULL, 0), NVL(100,0)
FROM DUAL;


SELECT *
FROM EMP
WHERE SAL > 1000
ORDER BY SAL ASC;

SELECT *
FROM EMP
WHERE SAL > 1000
ORDER BY SAL DESC;

SELECT POWER(2,10)
FROM DUAL;

SELECT MOD(121, 10), CEIL(123.45), FLOOR(123.45)
FROM DUAL;

SELECT TRUNC(12.345,2), ROUND(12.345,2)
FROM DUAL;

alter session set nls_date_format = 'YYYY-MON-DD HH12:MI:SS';

SELECT SYSDATE
FROM DUAL;


SELECT DECODE('LOVE', 'LOV', '참', '거짓')
FROM DUAL;

SELECT * FROM PROFESSOR;

-- 유형 2
SELECT DEPTNO, NAME, DECODE(DEPTNO, 101, 'Computer Engineering', ' ')
FROM PROFESSOR;

-- 유형 3
SELECT NAME, DEPTNO, DECODE(DEPTNO, 101, 'Computer Engineering',
                                     102, 'Multimedia Engineering',
                                     103, 'Software Engineering', ' ')
FROM PROFESSOR;

-- 유형 4
SELECT NAME, DEPTNO, DECODE(DEPTNO, 101, DECODE(NAME, '조인형', 'BEST!'))
FROM PROFESSOR;

-- 유형 5
SELECT NAME, DEPTNO, DECODE(DEPTNO, 101, DECODE(NAME, '조인형', 'BEST!', 'GOOD!'))
FROM PROFESSOR; 

-- 유형 6
SELECT NAME, DEPTNO, DECODE(DEPTNO, 101, DECODE(NAME, '조인형', 'BEST!', 'GOOD!'), 'N/A')
FROM PROFESSOR;

SELECT *
FROM STUDENT;


-- DECODE 퀴즈 1
SELECT NAME, JUMIN, DECODE(SUBSTR(JUMIN,7,1),'1','MAN','WOMAN') "GENDER"
FROM STUDENT
WHERE DEPTNO1 = 101;


-- DECODE 퀴즈 2
SELECT NAME, TEL, 
DECODE(SUBSTR(TEL,1,INSTR(TEL,')')-1),'02','SEOUL',
                                      '031','GYEONGGI',
                                      '051', 'BUSAN',
                                      '052', 'ULSAN',
                                      '055', 'GYEONGNAM') "LOC"
FROM STUDENT
WHERE DEPTNO1 = 101;


SELECT ENAME, SAL, COMM
FROM EMP
ORDER BY COMM DESC, SAL DESC;

SELECT ENAME, SUBSTR(SAL,1,1)
FROM EMP
ORDER BY 2 DESC; -- 번호 넘버링 = SUBSTR(SAL,1,1) = 2번째 컬럼을 내림차순


SELECT *
FROM EMP;

alter session set nls_date_format = 'YYYY/MM/DD';

-- MYSQL 문제 1
SELECT  EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10;

-- MYSQL 문제 2
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE EMPNO = 7369;

-- MYSQL 문제 3
SELECT *
FROM EMP
WHERE ENAME = 'ALLEN';

-- MYSQL 문제 4
SELECT ENAME, DEPTNO, SAL 
FROM EMP
WHERE HIREDATE = '1980/12/17';

-- MYSQL 문제 5
SELECT *
FROM EMP
WHERE JOB != 'MANAGER';

-- MYSQL 문제 6
SELECT *
FROM EMP
WHERE HIREDATE > '1981/04/02';

-- MYSQL 문제 7
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL >= 800;

-- MYSQL 문제 8
SELECT *
FROM EMP
WHERE DEPTNO >= 20;

-- MYSQL 문제 9
SELECT *
FROM EMP
WHERE HIREDATE < '1981/12/09';

-- MYSQL 문제 10
SELECT EMPNO, ENAME
FROM EMP
WHERE EMPNO <= 7698;

-- MYSQL 문제 11
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE HIREDATE > '1981/04/02' AND HIREDATE < '1982/12/09';

-- MYSQL 문제 12
SELECT ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1600 AND SAL < 3000;

-- MYSQL 문제 13 CHECK
SELECT *
FROM EMP
WHERE EMPNO > 7654 AND EMPNO < 7782; 

-- MYSQL 문제 14
SELECT *
FROM EMP
WHERE ENAME BETWEEN 'C%' AND 'J%';

-- MYSQL 문제 15
SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE,3,2) <> '81';

-- MYSQL 문제 16
SELECT *
FROM EMP
WHERE JOB IN('MANAGER','SALESMAN');

-- MYSQL 문제 17
SELECT ENAME, EMPNO, DEPTNO
FROM EMP
WHERE DEPTNO <> 20 AND DEPTNO <> 30;

-- MYSQL 문제 18
SELECT EMPNO, ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%';

-- MYSQL 문제 19
SELECT * 
FROM EMP
WHERE SUBSTR(HIREDATE,3,2) = '81';

-- MYSQL 문제 20
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%';

-- MYSQL 문제 21
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%H';

-- MYSQL 문제 22
SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';

-- MYSQL 문제 23
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- MYSQL 문제 24
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- MYSQL 문제 25
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = '30' AND SAL >= 1500;

-- MYSQL 문제 26
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE ENAME LIKE 'K%' OR DEPTNO = '30';

-- MYSQL 문제 27
SELECT *
FROM EMP
WHERE SAL >= 1500 AND DEPTNO = '30'AND JOB = 'MANAGER';

-- MYSQL 문제 28
SELECT *
FROM EMP
WHERE DEPTNO = '30'
ORDER BY EMPNO ASC;

-- MYSQL 문제 29
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- MYSQL 문제 30
SELECT *
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

-- MYSQL 문제 31
SELECT *
FROM EMP
ORDER BY DEPTNO DESC, ENAME ASC, SAL DESC;

-- MYSQL 문제 32
SELECT ENAME, SAL, COMM, (SAL+COMM) "SUM"
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY 4 DESC;

-- MYSQL 문제 33
SELECT ENAME, SAL, DEPTNO, (SAL*0.13) "BONUS" 
FROM EMP
WHERE DEPTNO = '10';

-- MYSQL 문제 34
SELECT ENAME, DEPTNO, SAL, (SAL*12+(SAL*1.5))
FROM EMP
WHERE DEPTNO = '30';

-- MYSQL 문제 35





--------------------------------------
SELECT COUNT(ENAME) -- ENAME은 각각 다 다르기 때문에 GROUP화 할 수 없다. 
FROM EMP;

SELECT MAX(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

SELECT DISTINCT JOB
FROM EMP;

SELECT MAX(SAL), DEPTNO, ENAME
FROM EMP
GROUP BY DEPTNO, ENAME;

SELECT MAX(SAL), EMPNO
FROM EMP;

SELECT SUM(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO
ORDER BY 1 DESC;

-- 각 직업별 직원 수 COUNT 를 출력하시오. 
SELECT COUNT(*), JOB
FROM EMP
GROUP BY JOB; 

-- 각 직업별 연봉 평균을 출력하시오. 
SELECT FLOOR(AVG(SAL)), JOB
FROM EMP
GROUP BY JOB
HAVING JOB != 'MANAGER';


-- 서브쿼리
SELECT *
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- HAVING 예시 
SELECT DEPTNO, AVG(NVL(SAL,0))
FROM EMP 
GROUP BY DEPTNO
HAVING AVG(NVL(SAL,0)) >= 2000;


SELECT *
FROM GOGAK;

SELECT MAX(POINT)
FROM GOGAK;

SELECT MAX(POINT)
FROM GOGAK
WHERE ROWNUM > 0 AND ROWNUM < 9
UNION ALL
SELECT MAX(POINT)
FROM (SELECT GNO, POINT, ROWNUM "NO"
FROM GOGAK)
WHERE NO > 8 AND NO < 21;

-- ROWNUM 중간 자리부터 끝자리를 쓰기 위한 식
SELECT GNO, POINT, ROWNUM "NO"
FROM GOGAK;

SELECT *
FROM GOGAK;

-- 1부터 8번까지랑 9번부터 20번까지의 ROWNUM 순서대로 그룹핑해라
SELECT GNO, GNAME, POINT, NO,
CASE WHEN NO < 9 THEN 1 ELSE 2 END "NUMBERING"
FROM
(
    SELECT GNO, GNAME, POINT, ROWNUM "NO"
    FROM GOGAK
);


-- CASE문 예시
SELECT NAME, SUBSTR(JUMIN,3,2) "MONTH",
CASE WHEN SUBSTR(JUMIN,3,2) BETWEEN '01' AND '03' THEN '1/4'
      WHEN SUBSTR(JUMIN,3,2) BETWEEN '04' AND '06' THEN '2/4'
      WHEN SUBSTR(JUMIN,3,2) BETWEEN '07' AND '09' THEN '3/4'
      WHEN SUBSTR(JUMIN,3,2) BETWEEN '10' AND '12' THEN '4/4'
END "QUARTER"
FROM STUDENT;











