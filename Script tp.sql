SELECT nombre FROM Alumno;
SELECT distinct ciudad from Docente d;

SELECT nombre FROM Materia WHERE codigo > 102;

SELECT nombre FROM Alumno WHERE ciudad = 'Córdoba';

SELECT Materia.nombre, Cursa.nota
FROM Cursa
JOIN Materia ON Cursa.codigo = Materia.codigo
WHERE Cursa.legajo = 2;

SELECT Alumno.nombre AS alumno, Materia.nombre AS materia
FROM Cursa
JOIN Alumno ON Cursa.legajo = Alumno.legajo
JOIN Materia ON Cursa.codigo = Materia.codigo;

SELECT Alumno.nombre 
FROM Cursa
JOIN Alumno ON Cursa.legajo = Alumno.legajo
WHERE Cursa.nota = 10;

SELECT DISTINCT Docente.nombre 
FROM Docente
JOIN Alumno ON Docente.ciudad = Alumno.ciudad;

SELECT DISTINCT Docente.nombre, Docente.ciudad
FROM Docente
LEFT JOIN Dicta ON Docente.legajo = Dicta.legajo AND Dicta.codigo = 102
WHERE Dicta.legajo IS NULL;

SELECT DISTINCT A.nombre
FROM Alumno A
JOIN Cursa C ON A.legajo = C.legajo
WHERE NOT EXISTS (
    SELECT D.codigo 
    FROM Dicta D
    WHERE D.legajo = 3
    EXCEPT
    SELECT C2.codigo 
    FROM Cursa C2
    WHERE C2.legajo = A.legajo);


SELECT DISTINCT A.nombre
FROM Alumno A
JOIN Cursa C ON A.legajo = C.legajo
JOIN Dicta D ON C.codigo = D.codigo
GROUP BY A.legajo, A.nombre
HAVING COUNT(DISTINCT D.legajo) = (SELECT COUNT(*) FROM Docente);

SELECT DISTINCT D.nombre
FROM Docente D
JOIN Dicta DI ON D.legajo = DI.legajo
WHERE NOT EXISTS (
    SELECT C.legajo 
    FROM Cursa C
    WHERE C.codigo = DI.codigo
    AND C.nota < 6);

SELECT DISTINCT A.nombre
FROM Alumno A
WHERE NOT EXISTS (
    SELECT C.codigo
    FROM Cursa C
    WHERE C.legajo = A.legajo
    AND C.nota < 6);



