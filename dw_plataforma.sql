
-- mdl_user
CREATE TABLE dim_usuario(
    id_usuario SERIAL PRIMARY KEY,
    id_usuario_database INT,
    username TEXT,
    firstname TEXT,
    lastname TEXT,
    city TEXT
);


-- mdl_course (startdate, enddate)
-- mdl_assign (duedate, allowsubmissionsfromdate,cutoffdate,  gradingduedate)
CREATE TABLE dim_fecha(
    id_fecha SERIAL PRIMARY KEY,
    minuto INT,
    hora INT,
    dia INT,
    mes INT,
    anio INT
);

-- mdl_course
-- mdl_course_categories
CREATE TABLE dim_curso(
    id_curso SERIAL PRIMARY KEY,
    id_curso_database INT,
    fullname TEXT,
    category TEXT
);

-- mdl_assign
CREATE TABLE dim_asignatura(
    id_asignatura SERIAL PRIMARY KEY,
    id_asignatura_database INT,
    titulo TEXT, -- name es el nombre de la columna en la base de datos
    grade INT
);

-- mdl_assign_submission
-- mdl_assign_grades
CREATE TABLE hecho_entrega_asignatura(
    id_hecho SERIAL PRIMARY KEY,
    id_alumno INT,
    id_profesor INT,
    id_curso INT,
    id_asignatura INT,
    id_fecha_de_entrega INT,
    id_fecha_cierre INT,
    id_fecha_subida INT, -- usar timemodified?
    hecho_entrega INT,
    FOREIGN KEY (id_alumno) REFERENCES dim_usuario(id_usuario),
    FOREIGN KEY (id_profesor) REFERENCES dim_usuario(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES dim_curso(id_curso),
    FOREIGN KEY (id_asignatura) REFERENCES dim_asignatura(id_asignatura),
    FOREIGN KEY (id_fecha_de_entrega) REFERENCES dim_fecha(id_fecha),
    FOREIGN KEY (id_fecha_cierre) REFERENCES dim_fecha(id_fecha),
    FOREIGN KEY (id_fecha_subida) REFERENCES dim_fecha(id_fecha)
);