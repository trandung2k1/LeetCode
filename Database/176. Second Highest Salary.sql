/* Write your T-SQL query statement below */
SELECT (
    SELECT TOP 1 salary
    FROM (
        SELECT salary,
               DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
        FROM Employee
    ) AS ranked
    WHERE rank = 2
) AS SecondHighestSalary;


-- DENSE_RANK() OVER (ORDER BY salary DESC) — Phân hạng lương theo thứ tự giảm dần:

-- Lương cao nhất → hạng 1

-- Lương kế tiếp → hạng 2 (nếu khác nhau)

-- Lọc ra các bản ghi có rank = 2 → đây là mức lương cao thứ hai.

-- TOP 1 salary — Lấy một giá trị lương trong các bản ghi hạng 2 (nếu có nhiều mức lương trùng).


SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary) FROM Employee
);

-- SELECT MAX(salary) FROM Employee — Truy vấn mức lương cao nhất trong bảng.

-- WHERE salary < (...) — Lọc ra các bản ghi có lương thấp hơn mức lương cao nhất.

-- MAX(salary) ở ngoài — Tìm mức lương cao nhất trong các mức lương còn lại, chính là mức lương cao thứ hai.


SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT DISTINCT salary
    FROM Employee
) AS distinct_salaries
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);