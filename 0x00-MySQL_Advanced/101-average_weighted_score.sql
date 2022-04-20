--Average weighted score for all!
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER |
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
  UPDATE users,
    (SELECT users.id, (SUM(score*weight)/SUM(weight)) AS average
    FROM users 
    INNER JOIN corrections ON users.id = corrections.user_id
    INNER JOIN projects ON corrections.project_id = projects.id
    GROUP BY users.id)
  AS query
  SET users.average_score = query.average
  WHERE users.id=query.id;
END;
