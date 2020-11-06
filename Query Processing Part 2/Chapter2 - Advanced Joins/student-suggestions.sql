/*
Name: Christian Jantz
Video: Chapter 2 Advanced Joins
Time:
My suggestion: This is an experiment I did to get some practice with self-joins.
Figuring out a way to verify that the query is correct is one of the big challenges for me.
*/

-- Query:

/*
In section 2. Advanced Joins, Self and inequality joins, the solution took multiple iterations. A common question that I ask is 'How do I know the query is correct?". 

I tried a query using database Animal_Shelter, table Persons.

I used a self join to find all persons with the same first name.
*/

SELECT A.First_Name AS FirstName, A.Email AS EmailA, B.Email AS EmailB, A.City AS CityA, B.City AS CityB
FROM Persons AS A
INNER JOIN Persons AS B
ON A.First_Name = B.First_Name
AND A.Email != B.Email
ORDER BY A.First_Name

/*
When I looked at the results, people with the same first name also lived in the same city. This seemed strange. For example, Ashley Adams and Ashley Flores both lived in Carson.

Bruce Cook and Bruce Harris both lived in South Whittier.

Ashley,ashley.adams@icloud.com,ashley.flores@animalshelter.com,Carson,Carson
Ashley,ashley.flores@animalshelter.com,ashley.adams@icloud.com,Carson,Carson
Bruce,bruce.cook@icloud.com,bruce.harris@hotmail.com,South Whittier,South Whittier
Bruce,bruce.harris@hotmail.com,bruce.cook@icloud.com,South Whittier,South Whittier

I added another clause to the query to get only people with the same first name and living in the same town. I got the same result.
*/

SELECT A.First_Name AS FirstName, A.Email AS EmailA, B.Email AS EmailB, A.City AS CityA, B.City AS CityB
FROM Persons AS A
INNER JOIN Persons AS B
ON A.First_Name = B.First_Name
AND A.Email != B.Email
AND A.City = B.City
ORDER BY A.First_Name

/*
So I decided to look at all the data with a simple query.
*/

SELECT First_Name, City FROM Persons
ORDER BY First_Name

/*
The original query gave the correct results. So I rewrote the query, changing first name to last name.
*/

SELECT A.Last_Name AS LastName, A.Email AS EmailA, B.Email AS EmailB, A.City AS CityA, B.City AS CityB
FROM Persons AS A
INNER JOIN Persons AS B
ON A.Last_Name = B.Last_Name
AND A.Email != B.Email
AND A.City = B.City
ORDER BY A.Last_Name

/*
Only a small number of people with the same last name live in the same city.

Baker,samuel.baker@gmail.com,scott.baker@gmail.com,Los Angeles,Los Angeles
Baker,scott.baker@gmail.com,samuel.baker@gmail.com,Los Angeles,Los Angeles
Phillips,charles.phillips@gmail.com,jacqueline.phillips@gmail.com,Long Beach,Long Beach
Phillips,jacqueline.phillips@gmail.com,charles.phillips@gmail.com,Long Beach,Long Beach
Thompson,sharon.thompson@gmail.com,anna.thompson@hotmail.com,Los Angeles,Los Angeles
Thompson,anna.thompson@hotmail.com,sharon.thompson@gmail.com,Los Angeles,Los Angeles
Young,laura.young@gmail.com,doris.young@icloud.com,Torrance,Torrance
Young,doris.young@icloud.com,laura.young@gmail.com,Torrance,Torrance
*/
