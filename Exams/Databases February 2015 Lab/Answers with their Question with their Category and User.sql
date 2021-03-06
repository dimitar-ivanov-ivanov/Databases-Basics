SELECT a.Content AS [Answer Content],
a.CreatedOn,u.Username AS [Answer Author],
q.Title AS [Question Title],
c.Name AS [Category Name]
FROM Answers AS a
JOIN Questions AS q ON q.Id = a.QuestionId
JOIN Categories AS c ON c.CategoryId = q.CategoryId
JOIN Users AS u ON u.Id = a.UserId
ORDER BY a.Content,u.Username,a.CreatedOn