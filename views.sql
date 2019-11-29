CREATE VIEW not_logged_in_repos(repo_name, user_name, start_date) AS 
SELECT repo_name, user_name, start_date FROM repo WHERE (public = true);

CREATE VIEW newest_five_repos(repo_name, user_name, start_date) AS 
SELECT repo_name, user_name, start_date FROM repo ORDER BY unique_ID DESC LIMIT 5;
