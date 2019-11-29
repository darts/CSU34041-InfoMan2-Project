-- Senán d'Art
-- 17329580

CREATE VIEW not_logged_in_repos(repo_name, user_name, start_date) AS 
SELECT repo_name, user_name, start_date FROM repo WHERE (public = true);

CREATE VIEW newest_ten_commits(ID, branch, commit_comment, commit_title, date_time) AS 
SELECT ID, branch, commit_comment, commit_title, date_time FROM bcommit ORDER BY ID DESC LIMIT 10;
