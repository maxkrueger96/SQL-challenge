# SQL-challenge
Repo for HW #7 on SQL

## Data Modeling and Engineering
I began with a solar system-esque ERD model, centering the employees.csv file and having every other file growing from that file. I soon realized that a straight-forward linear, three-stage relationship would serve me best. So, titles.csv and salaries.csv both hang onto employees.csv, titles as a dependency and salaries as a dependent. Furthermore, salaries.csv didnt have any other relations with the other files, much like titles.csv, so I considered them similarly. Of course, the relationships they have to employees.csv is opposite, and so the order in which their tables are created has to be titles -> employees -> ... -> salaries -> ..., to support the foreign key structure.

Then came, from my viewpoint, the two pillars of the six files, employees.csv and departments.csv. These two files don't share attributes, and so would eventually need to be connected through a child table. Though they don't have any relation to each other, they act as the two major parent tables for the other files, not including titles, which I think of like a grandparent table and didn't actually come into play in this assignment. Anyway, these two tables would need to be created right after titles, although it wouldn't have mattered if I created departments first.

Finally, we have the two problem children of the files, dept_emp.csv and dept_manager.csv. First of all, dept_manager is a proper subset of dept_emp, and so why the two columns were reversed between the two files boggles my mind to this day. This mirroring of columns made it so my ERD couldn't possibly be symmetric, which seems cruel.

...Anyway, like I said, dept_manager inherits all of its data from dept_emp, and yet I related them both back to employees and departments with foreign keys for simplicity. The connection specifically between dept_emp, employees, and departments was vital in this homework, as dept_emp was the link between employees and departments we needed to look at the two side by side.

## Data Analysis
I found these queries pretty straightforward. As far as an analysis is concerned, I didnt learn much from this data set besides the fact that there are tons of Hercules that supposedly worked there, and there are far too many shared last names for this data set to be plausible, even over two decades. It seems fishy at least.

