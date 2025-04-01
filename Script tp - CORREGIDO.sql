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

SELECT nombre 
FROM Alumno 
WHERE nombre LIKE 'L%';

SELECT nombre 
FROM Materia 
WHERE codigo NOT IN (
    SELECT DISTINCT codigo 
    FROM Dicta 
    WHERE legajo IN (2, 4));

SELECT nombre 
FROM Alumno 
WHERE ciudad = 'Rosario' AND legajo > 2;


SELECT DISTINCT Alumno.nombre 
FROM Cursa
JOIN Alumno ON Cursa.legajo = Alumno.legajo
WHERE Cursa.codigo = 103 AND Cursa.nota BETWEEN 6 AND 8;

SELECT nombre 
FROM Alumno 
WHERE ciudad = 'Mar del Plata' AND nombre NOT LIKE '%a%';

SELECT DISTINCT Alumno.nombre 
FROM Cursa
JOIN Alumno ON Cursa.legajo = Alumno.legajo
WHERE Cursa.codigo IN (101, 105) AND Cursa.nota < 7;


