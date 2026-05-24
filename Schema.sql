-- =========================================================
-- ONLINE ACADEMY MANAGEMENT SYSTEM (OAMS)
-- Schema File
-- =========================================================

CREATE DATABASE IF NOT EXISTS oams;
USE oams;

-- =========================================================
-- 1. STUDENTS TABLE
-- =========================================================

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    gender VARCHAR(10)
        CHECK (gender IN ('Male', 'Female')),
    date_of_birth DATE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

-- =========================================================
-- 2. INSTRUCTORS TABLE
-- =========================================================

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    qualification VARCHAR(100),
    specialization VARCHAR(100),
    hire_date DATE
);

-- =========================================================
-- 3. COURSES TABLE
-- =========================================================

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    fee DECIMAL(10,2) NOT NULL,
    duration_months INT NOT NULL,
    credit_hours INT NOT NULL
);

-- =========================================================
-- 4. ADMINS TABLE
-- =========================================================

CREATE TABLE admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- =========================================================
-- 5. BATCHES TABLE
-- =========================================================

CREATE TABLE batches (
    batch_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    batch_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    schedule VARCHAR(100),
    max_students INT DEFAULT 30,

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
        ON DELETE CASCADE,

    FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id)
        ON DELETE CASCADE
);

-- =========================================================
-- 6. ENROLLMENTS TABLE
-- =========================================================

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    batch_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),

    enrollment_status VARCHAR(20) DEFAULT 'Active'
        CHECK (enrollment_status IN ('Active', 'Completed', 'Dropped')),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON DELETE CASCADE,

    FOREIGN KEY (batch_id)
        REFERENCES batches(batch_id)
        ON DELETE CASCADE
);

-- =========================================================
-- 7. ATTENDANCE TABLE
-- =========================================================

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    class_date DATE NOT NULL,

    attendance_status VARCHAR(10)
        CHECK (attendance_status IN ('Present', 'Absent')),

    FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(enrollment_id)
        ON DELETE CASCADE
);

-- =========================================================
-- 8. PAYMENTS TABLE
-- =========================================================

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,

    payment_method VARCHAR(30)
        CHECK (payment_method IN ('Cash', 'Card', 'Bank Transfer', 'JazzCash', 'EasyPaisa')),

    payment_status VARCHAR(20)
        CHECK (payment_status IN ('Paid', 'Pending', 'Partial')),

    FOREIGN KEY (enrollment_id)
        REFERENCES enrollments(enrollment_id)
        ON DELETE CASCADE
);

-- =========================================================
-- 9. EXAMS TABLE
-- =========================================================

CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_id INT NOT NULL,
    exam_title VARCHAR(100) NOT NULL,

    exam_type VARCHAR(50)
        CHECK (exam_type IN ('Quiz', 'Midterm', 'Final', 'Assignment')),

    total_marks INT NOT NULL,
    exam_date DATE NOT NULL,

    FOREIGN KEY (batch_id)
        REFERENCES batches(batch_id)
        ON DELETE CASCADE
);

-- =========================================================
-- 10. RESULTS TABLE
-- =========================================================

CREATE TABLE results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL,

    grade VARCHAR(5)
        CHECK (grade IN ('A+', 'A', 'B+', 'B', 'C', 'D', 'F')),

    FOREIGN KEY (exam_id)
        REFERENCES exams(exam_id)
        ON DELETE CASCADE,

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON DELETE CASCADE
);

-- =========================================================
-- 11. COURSE MATERIALS TABLE
-- =========================================================

CREATE TABLE course_materials (
    material_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    upload_date DATE DEFAULT (CURRENT_DATE),

    file_type VARCHAR(30)
        CHECK (file_type IN ('PDF', 'DOCX', 'PPT', 'Video', 'ZIP')),

    FOREIGN KEY (batch_id)
        REFERENCES batches(batch_id)
        ON DELETE CASCADE
);

-- =========================================================
-- END OF SCHEMA
-- =========================================================