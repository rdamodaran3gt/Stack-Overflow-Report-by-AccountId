--User_Information
CREATE PROCEDURE Get_User_Information 
@AccountId int 
AS 
BEGIN
	SELECT DISTINCT u.Id AS [User_Id], u.AccountId, u.DisplayName AS [Display_Name], u.LastAccessDate AS [User_Last_Access_Date], u.Views, u.Reputation
	FROM  Users AS u
	WHERE u.AccountId = @AccountId
END

GO

--User_Posts
CREATE PROCEDURE Get_User_Posts
@AccountId int 
AS 
BEGIN
	SELECT p.Title AS [Post_Title], p.Body AS [Post_Body], p.CreationDate AS [Post_Creation_Date], p.CommentCount AS [Post_Comment_Count], p.ViewCount, p.Score AS [Post_Score]
	FROM Posts AS p INNER JOIN Users as u ON u.Id = p.OwnerUserId
	WHERE u.AccountId = @AccountId
END

GO

--User_Votes
CREATE PROCEDURE Get_User_Votes 
@AccountId int 
AS 
BEGIN
SELECT  p.Title AS [Post_Title], p.Body AS [Post_Body], v.CreationDate AS [Vote_Creation_Date], t.Name AS [Vote_Type]
FROM Votes as v INNER JOIN VoteTypes as t on t.Id = v.VoteTypeId
INNER JOIN Users as u on v.UserId = u.Id
INNER JOIN Posts as p on v.PostId = p.Id 
WHERE u.AccountId = @AccountId

END

GO


--User_Comments
CREATE PROCEDURE Get_User_Comments
@AccountId int 
AS 
BEGIN
SELECT  p.Title AS [Post_Title], p.Body AS [Post_Body], c.CreationDate AS [Comment_Creation_Date], c.Text AS Comment, c.Score AS [Comment_Score]
FROM Comments AS c INNER JOIN
Users AS u on u.Id = c.UserId INNER JOIN
Posts AS p ON c.PostId = p.Id
WHERE u.AccountId = @AccountId

END

GO

--User_List
CREATE PROCEDURE Get_User_List  
AS 
BEGIN
SELECT  DISTINCT u.AccountId 
FROM dbo.Users as u 
ORDER BY u.AccountId

END

GO

-- Testing Stored Procedures
EXEC Get_User_Information 27
EXEC Get_User_Posts 27
EXEC Get_User_Comments 27
EXEC Get_User_Votes 27
EXEC Get_User_List


