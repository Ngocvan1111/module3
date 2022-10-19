USE QuanLySinhVien;
-- Hiện thị tất cả thông tin môn học có credit lớn nhất -- 
select *
	from subject
	where subject.Credit in (select max(subject.Credit)
	from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất. -- 
select*
	from subject
	join mark on mark.SubId = subject.SubId
	where mark.Mark in (select max(mark.Mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần--
select *, avg(mark.Mark)
from student
join mark on mark.StudentId = student.StudentId
group by student.StudentId
order by avg(mark.Mark) desc;
