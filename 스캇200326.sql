-- 세로 연산의 핵심은 그룹을 만드는 것 
-- 같은 값을 만들어야 한다. 
SELECT MAX(POINT), G
FROM 
(
    SELECT POINT, CASE WHEN ROWNUM < 9 THEN 1 ELSE 2 END "G"
    FROM GOGAK
)
GROUP BY G;

SELECT WEEK, MAX(NUM_DAY)
FROM CAL
GROUP BY WEEK
ORDER BY WEEK;

SELECT *
FROM GOGAK;

-- 5명씩 끊어서 POINT의 합을 구하시오.
SELECT SUM(POINT), G
FROM
(
SELECT POINT, GNO, 
CASE WHEN ROWNUM BETWEEN '1' AND '5' THEN '1'
     WHEN ROWNUM BETWEEN '6' AND '10' THEN '2'
     WHEN ROWNUM BETWEEN '11' AND '15' THEN '3'
     WHEN ROWNUM BETWEEN '16' AND '20' THEN '4'
END "G"
FROM GOGAK
)
GROUP BY G
ORDER BY G;

SELECT SUM(POINT), CEIL(ROWNUM/5)
FROM GOGAK
GROUP BY CEIL(ROWNUM/5);

-- 같은 나이의 POINT의 합을 구하시오.
SELECT SUM(POINT), SUBSTR(JUMIN,1,2) "AGE"
FROM GOGAK
GROUP BY SUBSTR(JUMIN,1,2);

-- 월급 순위 구하기 
SELECT ENAME, SAL, ROWNUM "순위"
FROM
(
    SELECT ENAME, SAL
    FROM EMP
    ORDER BY SAL DESC
);

SELECT * 
FROM EMP;


SELECT ENAME, JOB,  DEPTNO, TO_CHAR(S,'$99,999')
FROM
(
    SELECT ENAME, JOB, SAL+(DECODE(COMM, NULL, 0, COMM)) "S", DEPTNO
    FROM EMP
    ORDER BY DEPTNO
)
WHERE DEPTNO = 10
UNION ALL
SELECT NULL, NULL, NULL, TO_CHAR(SUM(SAL),'$99,999')
FROM EMP
WHERE DEPTNO = 10;  

-- 소계, 총계 구하기
SELECT ENAME, JOB, DEPTNO, TO_CHAR(S,'$99,999')
FROM
(
    SELECT ENAME, JOB, SAL+(DECODE(COMM, NULL, 0, COMM)) "S", DEPTNO
    FROM EMP
    ORDER BY DEPTNO
)
WHERE DEPTNO = 10
UNION ALL
SELECT '소계', NULL, NULL, TO_CHAR(SUM(SAL),'$99,999')
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT ENAME, JOB, DEPTNO, TO_CHAR(S,'$99,999')
FROM
(
    SELECT ENAME, JOB, SAL+(DECODE(COMM, NULL, 0, COMM)) "S", DEPTNO
    FROM EMP
    ORDER BY DEPTNO
)
WHERE DEPTNO = 20
UNION ALL
SELECT '소계', NULL, NULL, TO_CHAR(SUM(SAL),'$99,999')
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT ENAME, JOB, DEPTNO, TO_CHAR(S,'$99,999')
FROM
(
    SELECT ENAME, JOB, SAL+(DECODE(COMM, NULL, 0, COMM)) "S", DEPTNO
    FROM EMP
    ORDER BY DEPTNO
)
WHERE DEPTNO = 30
UNION ALL
SELECT '소계', NULL, NULL, TO_CHAR(SUM(SAL),'$99,999')
FROM EMP
WHERE DEPTNO = 30
UNION ALL
SELECT '총계', NULL, NULL, TO_CHAR(SUM(SAL),'$99,999')
FROM EMP;


SELECT DEPTNO, JOB, AVG(SAL), COUNT(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

SELECT DEPTNO, NULL JOB, ROUND(AVG(SAL),1) AVG_SAL, COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT DEPTNO, JOB, ROUND(AVG(SAL),1) AVG_SAL, COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO, JOB
UNION ALL
SELECT NULL DEPTNO, NULL JOB, ROUND(AVG(SAL),1) AVG_SAL, COUNT(*) CNT_EMP
FROM EMP
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, ROUND(AVG(SAL),1) AVG_SAL, COUNT(*) CNT_EMP
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

SELECT *
FROM STUDENT;

-- 학생 테이블의 키(HEIGHT)의 평균을 구하시오.
SELECT ROUND(AVG(HEIGHT),1) AVG_HEIGHT
FROM STUDENT;

-- 학생 테이블에서 학과별(DEPTNO1) 학생들의 키의 평균을 구하시오.
SELECT DEPTNO1, ROUND(AVG(HEIGHT),1) AVG_HEIGHT
FROM STUDENT
GROUP BY DEPTNO1;

-- 학생 테이블에서 학과별 학생들의 키의 평균과 소계 값을 구하시오.
-- 방법 1 
SELECT DEPTNO1, ROUND(AVG(HEIGHT),1) AVG_HEIGHT, COUNT(*) CNT_STUDENT
FROM STUDENT
GROUP BY ROLLUP(DEPTNO1, HEIGHT);
-- 방법2
SELECT DEPTNO1, ROUND(AVG(HEIGHT),1) AVG_HEIGHT, COUNT(*) CNT_STUDENT
FROM STUDENT
GROUP BY DEPTNO1
ORDER BY DEPTNO1;

-- EMP에서 직업별 급여합계 조회 마지막 줄에 총 합계 추가해서 표시하기
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(JOB);

-- PANMAE 테이블에서 날짜별(P_DATE) 상품이(P_CODE) 몇 개(P_QTY) 판매되었는지와 소계 값을 구하시오.
SELECT P_DATE, P_CODE, SUM(P_QTY)
FROM PANMAE
GROUP BY P_DATE, ROLLUP(P_CODE);
-- P_DATE에 대한 전체와 P_CODE만 보이니까 전체 소계는 출력하지 않는다.


-- PANMAE 테이블에서 상품별(P_CODE)로 날짜마다(P_DATE) 얼마의 금액(P_TOTAL)이 판매되었는지와 소계 값을 구하시오.
SELECT P_CODE, P_DATE, SUM(P_TOTAL)
FROM PANMAE
GROUP BY ROLLUP(P_CODE, P_DATE);


SELECT POSITION, SUM(PAY)
FROM PROFESSOR
GROUP BY ROLLUP(POSITION);

SELECT GRADE, DEPTNO1, AVG(HEIGHT), COUNT(*)
FROM STUDENT
GROUP BY GRADE, ROLLUP(DEPTNO1);

-- 학년별 몸무게 평균 
SELECT GRADE, AVG(WEIGHT)
FROM STUDENT
GROUP BY ROLLUP(GRADE);
-- 위와 같은 쿼리지만 ROLLUP 함수를 쓰지 않았을때  
SELECT GRADE, AVG(WEIGHT)
FROM STUDENT
GROUP BY GRADE
UNION ALL
SELECT NULL, AVG(WEIGHT)
FROM STUDENT;


SELECT WEEK,
MAX(DECODE(DAY, '일', NUM_DAY)) "일", 
MAX(DECODE(DAY, '월', NUM_DAY)) "월",
MAX(DECODE(DAY, '화', NUM_DAY)) "화", 
MAX(DECODE(DAY, '수', NUM_DAY)) "수",
MAX(DECODE(DAY, '목', NUM_DAY)) "목", 
MAX(DECODE(DAY, '금', NUM_DAY)) "금", 
MAX(DECODE(DAY, '토', NUM_DAY)) "토" 
FROM CAL
GROUP BY WEEK
ORDER BY WEEK; 

SELECT DEPTNO, 
COUNT(DECODE(JOB, 'CLERK', 0)) "CLERK",
COUNT(DECODE(JOB, 'MANAGER', 0)) "MANAGER",
COUNT(DECODE(JOB, 'PRESIDENT', 0)) "PRESIDENT",
COUNT(DECODE(JOB, 'ANALYST', 0)) "ANALYST",
COUNT(DECODE(JOB, 'SALESMAN', 0))"SALESMAN"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

SELECT 
FLOOR (AVG(DECODE(POSITION, '정교수', PAY))) "정교수",
FLOOR (AVG(DECODE(POSITION, '조교수', PAY))) "조교수",
FLOOR (AVG(DECODE(POSITION, '전임강사', PAY))) "전임강사"
FROM PROFESSOR
ORDER BY PAY;

-- EMP_TYPE별, DEPTNO별, PAY의 합
SELECT EMP_TYPE,
SUM(DECODE(DEPTNO, '1008', PAY)) "1008",
SUM(DECODE(DEPTNO, '1009', PAY)) "1009",
SUM(DECODE(DEPTNO, '1010', PAY)) "1010",
SUM(DECODE(DEPTNO, '1011', PAY)) "1011"
FROM EMP2
WHERE EMP_TYPE = '계약직'
GROUP BY EMP_TYPE;

