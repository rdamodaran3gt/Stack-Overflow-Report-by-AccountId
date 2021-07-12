SELECT TOP 100 id, AccountId
FROM Users

SELECT  *
FROM Users u
WHERE AccountId = 27
-- 1 row

SELECT TOP 100 *
FROM Posts


SELECT  *
FROM Posts
WHERE OwnerUserId = 36

-- 137 rows


SELECT *
FROM PostTypes
-- 8 rows

SELECT TOP 100 *
FROM Comments


SELECT *
FROM Comments
WHERE PostId = 1407942
-- 6 rows

SELECT TOP 100 *
FROM Votes

SELECT TOP 100 *
FROM Votes
WHERE PostId = 1407942
-- 48 rows

SELECT *
FROM VoteTypes
-- 15 rows

SELECT --DISTINCT
u.*
, p.*
, c.*
, v.*
FROM Users u
LEFT OUTER JOIN Posts p ON u.id = p.OwnerUserId
LEFT OUTER  JOIN Comments c ON p.id = c.PostId
LEFT OUTER  JOIN Votes v ON p.id = v.PostId
WHERE u.AccountId = 27


SELECT DISTINCT u.Id, u.DisplayName, u.LastAccessDate, u.Views, u.Reputation
, p.Id, p.Title, p.Body, p.CreationDate as [Post Creation Date], p.CommentCount, 
p.ViewCount, p.Score as [Post Score]
, v.CreationDate as [Vote Creation Date]
, t.Name as [Vote Type]
, c.CreationDate as [Comment Creation Date], c.Text as [Comment], c.Score as [Comment Score]
FROM dbo.Users as u 
LEFT OUTER JOIN dbo.Posts as p on u.Id = p.OwnerUserId
LEFT OUTER JOIN dbo.Comments as c on p.Id = c.PostId
LEFT OUTER JOIN dbo.Votes as v on p.Id = v.PostId
LEFT OUTER JOIN dbo.VoteTypes as t on v.VoteTypeId = t.Id
WHERE u.Id = 1


SELECT 
u.Id as [User Id], u.DisplayName as [Display Name], u.LastAccessDate [User Last Access Date], u.Views, u.Reputation
, p.Id as [Post Id], p.Title as [Post Title], p.Body as [Post Body], p.CreationDate as [Post Creation Date], p.CommentCount as [Post Comment Count], 
p.ViewCount, p.Score as [Post Score]
, v.Id, v.CreationDate as [Vote Creation Date]
, t.Id, t.Name as [Vote Type]
, c.Id, c.CreationDate as [Comment Creation Date], c.Text as [Comment], c.Score as [Comment Score]
FROM dbo.Users as u 
inner join dbo.Posts as p on u.Id = p.OwnerUserId
inner join dbo.Comments as c on p.Id = c.PostId
inner join dbo.Votes as v on p.Id = v.PostId
inner join dbo.VoteTypes as t on v.VoteTypeId = t.Id
WHERE u.Id = 1


SELECT u.Id AS [User_Id], u.AccountId, u.DisplayName AS [Display_Name], u.LastAccessDate AS [User_Last_Access_Date], u.Views, u.Reputation, p.Id AS [Post_Id], p.Title AS [Post_Title], p.Body AS [Post_Body], p.CreationDate AS [Post_Creation_Date], p.CommentCount AS [Post_Comment_Count],
             p.ViewCount, p.Score AS [Post_Score], v.Id as [Vote_Id], v.CreationDate AS [Vote_Creation_Date], t.Id AS [Vote_Type Id], t.Name AS [Vote_Type], c.Id AS [Comment_Id], c.CreationDate AS [Comment_Creation_Date], c.Text AS Comment, c.Score AS [Comment_Score]
FROM  Users AS u 
LEFT OUTER JOIN Posts AS p ON u.Id = p.OwnerUserId 
LEFT OUTER JOIN Comments AS c ON p.Id = c.PostId 
LEFT OUTER JOIN Votes AS v ON p.Id = v.PostId 
LEFT OUTER JOIN VoteTypes AS t ON v.VoteTypeId = t.Id
WHERE u.AccountId = 27





