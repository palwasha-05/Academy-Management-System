-- =========================================================
-- ONLINE ACADEMY MANAGEMENT SYSTEM (OAMS)
-- Sample Data File
-- =========================================================

USE oams;

-- =========================================================
-- 1. STUDENTS
-- =========================================================

INSERT INTO students
(first_name, last_name, email, phone, gender, date_of_birth, registration_date)
VALUES
('Ali', 'Khan', 'ali.khan@gmail.com', '03001234567', 'Male', '2003-05-14', '2025-01-10'),
('Ayesha', 'Ahmed', 'ayesha.ahmed@gmail.com', '03011234567', 'Female', '2004-07-20', '2025-01-12'),
('Hamza', 'Malik', 'hamza.malik@gmail.com', '03021234567', 'Male', '2002-11-01', '2025-01-15'),
('Fatima', 'Noor', 'fatima.noor@gmail.com', '03031234567', 'Female', '2003-09-18', '2025-01-18'),
('Usman', 'Sheikh', 'usman.sheikh@gmail.com', '03041234567', 'Male', '2001-12-05', '2025-01-20'),
('Hira', 'Iqbal', 'hira.iqbal@gmail.com', '03051234567', 'Female', '2004-02-27', '2025-01-22'),
('Zain', 'Raza', 'zain.raza@gmail.com', '03061234567', 'Male', '2003-04-08', '2025-01-24'),
('Maham', 'Yousaf', 'maham.yousaf@gmail.com', '03071234567', 'Female', '2002-08-30', '2025-01-25'),
('Bilal', 'Tariq', 'bilal.tariq@gmail.com', '03081234567', 'Male', '2003-10-12', '2025-01-26'),
('Sara', 'Javed', 'sara.javed@gmail.com', '03091234567', 'Female', '2004-01-17', '2025-01-28');

-- =========================================================
-- 2. INSTRUCTORS
-- =========================================================

INSERT INTO instructors
(full_name, email, phone, qualification, specialization, hire_date)
VALUES
('Dr. Ahmed Raza', 'ahmed.raza@oams.edu.pk', '03111222333', 'PhD Computer Science', 'Database Systems', '2023-03-10'),
('Ms. Sana Ali', 'sana.ali@oams.edu.pk', '03112223334', 'MS Software Engineering', 'Web Development', '2023-05-15'),
('Mr. Farhan Malik', 'farhan.malik@oams.edu.pk', '03113334445', 'MS Artificial Intelligence', 'Machine Learning', '2022-09-20'),
('Dr. Hina Yousaf', 'hina.yousaf@oams.edu.pk', '03114445556', 'PhD Data Science', 'Data Analytics', '2021-11-11'),
('Mr. Umar Khan', 'umar.khan@oams.edu.pk', '03115556667', 'MS Cyber Security', 'Networking & Security', '2024-01-05');

-- =========================================================
-- 3. COURSES
-- =========================================================

INSERT INTO courses
(course_name, description, fee, duration_months, credit_hours)
VALUES
('Database Systems', 'Relational database concepts and SQL', 25000.00, 4, 3),
('Web Development', 'Frontend and backend web technologies', 30000.00, 5, 4),
('Artificial Intelligence', 'AI and machine learning fundamentals', 45000.00, 6, 4),
('Data Science', 'Data analysis and visualization techniques', 40000.00, 5, 4),
('Cyber Security', 'Network and information security', 35000.00, 4, 3),
('Python Programming', 'Programming fundamentals using Python', 20000.00, 3, 2);

-- =========================================================
-- 4. ADMINS
-- =========================================================

INSERT INTO admins
(full_name, email, password_hash)
VALUES
('Admin User', 'admin@oams.edu.pk', 'admin123hash'),
('System Manager', 'manager@oams.edu.pk', 'manager123hash');

-- =========================================================
-- 5. BATCHES
-- =========================================================

INSERT INTO batches
(course_id, instructor_id, batch_name, start_date, end_date, schedule, max_students)
VALUES
(1, 1, 'DBS-Morning-01', '2025-02-01', '2025-06-01', 'Mon-Wed-Fri 9AM-11AM', 30),
(2, 2, 'WEB-Evening-01', '2025-02-05', '2025-07-05', 'Tue-Thu 5PM-7PM', 25),
(3, 3, 'AI-Weekend-01', '2025-02-10', '2025-08-10', 'Sat-Sun 10AM-1PM', 35),
(4, 4, 'DS-Morning-01', '2025-03-01', '2025-08-01', 'Mon-Wed 11AM-1PM', 30),
(5, 5, 'CS-Evening-01', '2025-03-05', '2025-07-05', 'Tue-Thu 6PM-8PM', 20),
(6, 2, 'PY-Morning-01', '2025-02-15', '2025-05-15', 'Mon-Fri 8AM-10AM', 40),
(1, 1, 'DBS-Evening-02', '2025-04-01', '2025-08-01', 'Tue-Thu 4PM-6PM', 30),
(3, 3, 'AI-Morning-02', '2025-05-01', '2025-11-01', 'Mon-Wed-Fri 10AM-12PM', 35);

-- =========================================================
-- 6. ENROLLMENTS
-- =========================================================

INSERT INTO enrollments
(student_id, batch_id, enrollment_date, enrollment_status)
VALUES
(1, 1, '2025-01-25', 'Active'),
(2, 1, '2025-01-26', 'Active'),
(3, 2, '2025-01-28', 'Active'),
(4, 3, '2025-01-29', 'Active'),
(5, 4, '2025-02-01', 'Active'),
(6, 5, '2025-02-03', 'Active'),
(7, 6, '2025-02-04', 'Completed'),
(8, 2, '2025-02-05', 'Active'),
(9, 3, '2025-02-06', 'Dropped'),
(10, 1, '2025-02-07', 'Active'),
(1, 3, '2025-02-08', 'Active'),
(2, 4, '2025-02-09', 'Active'),
(3, 5, '2025-02-10', 'Active'),
(4, 6, '2025-02-11', 'Completed'),
(5, 2, '2025-02-12', 'Active');

-- =========================================================
-- 7. ATTENDANCE
-- =========================================================

INSERT INTO attendance
(enrollment_id, class_date, attendance_status)
VALUES
(1, '2025-02-10', 'Present'),
(1, '2025-02-12', 'Present'),
(2, '2025-02-10', 'Absent'),
(2, '2025-02-12', 'Present'),
(3, '2025-02-11', 'Present'),
(4, '2025-02-15', 'Present'),
(5, '2025-03-05', 'Absent'),
(6, '2025-03-06', 'Present'),
(7, '2025-02-20', 'Present'),
(8, '2025-02-13', 'Present'),
(9, '2025-02-15', 'Absent'),
(10, '2025-02-14', 'Present'),
(11, '2025-02-16', 'Present'),
(12, '2025-03-02', 'Absent'),
(13, '2025-03-07', 'Present'),
(14, '2025-02-21', 'Present'),
(15, '2025-02-18', 'Present'),
(1, '2025-02-14', 'Present'),
(3, '2025-02-13', 'Present'),
(5, '2025-03-07', 'Present');

-- =========================================================
-- 8. PAYMENTS
-- =========================================================

INSERT INTO payments
(enrollment_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 25000.00, '2025-01-30', 'Bank Transfer', 'Paid'),
(2, 15000.00, '2025-01-31', 'Cash', 'Partial'),
(3, 30000.00, '2025-02-01', 'JazzCash', 'Paid'),
(4, 45000.00, '2025-02-02', 'EasyPaisa', 'Paid'),
(5, 20000.00, '2025-02-03', 'Card', 'Partial'),
(6, 35000.00, '2025-02-04', 'Bank Transfer', 'Paid'),
(7, 20000.00, '2025-02-05', 'Cash', 'Paid'),
(8, 30000.00, '2025-02-06', 'Card', 'Paid'),
(9, 10000.00, '2025-02-07', 'JazzCash', 'Pending'),
(10, 25000.00, '2025-02-08', 'EasyPaisa', 'Paid'),
(11, 45000.00, '2025-02-09', 'Bank Transfer', 'Paid'),
(12, 40000.00, '2025-02-10', 'Cash', 'Paid'),
(13, 35000.00, '2025-02-11', 'Card', 'Paid'),
(14, 20000.00, '2025-02-12', 'JazzCash', 'Paid'),
(15, 30000.00, '2025-02-13', 'EasyPaisa', 'Paid');

-- =========================================================
-- 9. EXAMS
-- =========================================================

INSERT INTO exams
(batch_id, exam_title, exam_type, total_marks, exam_date)
VALUES
(1, 'DB Midterm', 'Midterm', 100, '2025-04-10'),
(1, 'DB Final', 'Final', 100, '2025-05-25'),
(2, 'Web Quiz 1', 'Quiz', 20, '2025-03-20'),
(2, 'Web Final', 'Final', 100, '2025-06-30'),
(3, 'AI Assignment', 'Assignment', 30, '2025-04-15'),
(3, 'AI Midterm', 'Midterm', 100, '2025-05-20'),
(4, 'DS Quiz', 'Quiz', 25, '2025-04-05'),
(5, 'Cyber Final', 'Final', 100, '2025-06-25'),
(6, 'Python Midterm', 'Midterm', 100, '2025-04-01'),
(6, 'Python Final', 'Final', 100, '2025-05-10');

-- =========================================================
-- 10. RESULTS
-- =========================================================

INSERT INTO results
(exam_id, student_id, marks_obtained, grade)
VALUES
(1, 1, 88.00, 'A'),
(1, 2, 75.00, 'B'),
(2, 1, 91.00, 'A+'),
(2, 10, 69.00, 'C'),
(3, 3, 18.00, 'A'),
(4, 3, 84.00, 'A'),
(4, 8, 72.00, 'B'),
(5, 4, 26.00, 'A'),
(6, 4, 87.00, 'A'),
(6, 9, 55.00, 'D'),
(7, 5, 20.00, 'B'),
(8, 6, 90.00, 'A+'),
(9, 7, 78.00, 'B+'),
(10, 7, 85.00, 'A'),
(10, 4, 80.00, 'A');

-- =========================================================
-- 11. COURSE MATERIALS
-- =========================================================

INSERT INTO course_materials
(batch_id, title, upload_date, file_type)
VALUES
(1, 'Database Fundamentals Notes', '2025-02-05', 'PDF'),
(1, 'SQL Practice Exercises', '2025-02-10', 'DOCX'),
(2, 'HTML & CSS Slides', '2025-02-12', 'PPT'),
(3, 'Machine Learning Introduction', '2025-02-15', 'PDF'),
(4, 'Data Visualization Lecture', '2025-03-10', 'Video'),
(5, 'Cyber Security Handbook', '2025-03-12', 'PDF'),
(6, 'Python Basics Workbook', '2025-02-18', 'DOCX'),
(2, 'JavaScript Tutorial', '2025-02-20', 'ZIP');

-- =========================================================
-- END OF SAMPLE DATA
-- =========================================================