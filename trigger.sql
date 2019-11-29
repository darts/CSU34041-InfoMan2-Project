-- Senán d'Art
-- 17329580

delimiter //
CREATE TRIGGER repo_check BEFORE INSERT
ON repo FOR EACH ROW
BEGIN 
	IF EXISTS (SELECT * FROM repo WHERE (repo_name = NEW.repo_name) AND (user_name = NEW.user_name))
	THEN SIGNAL sqlstate '45001' set message_text = "User cannot have multiple repos with the same name!";
	END IF;
END;
//

CREATE TRIGGER branch_check BEFORE INSERT
ON branch FOR EACH ROW
BEGIN 
	IF EXISTS (SELECT * FROM branch WHERE (branch_name = NEW.branch_name) AND (repo = NEW.repo))
	THEN SIGNAL sqlstate '45001' set message_text = "Repo cannot have multiple branches with the same name!";
	END IF;
END;
//

CREATE TRIGGER update_latest_commit AFTER INSERT
ON bcommit FOR EACH ROW
BEGIN 
	UPDATE branch 
	SET latest_commit = NEW.ID
	WHERE ID = NEW.branch;
END;
//

CREATE TRIGGER curr_time_user BEFORE INSERT
ON user FOR EACH ROW
BEGIN
	SET NEW.join_date = CURRENT_TIMESTAMP;
END;
//

CREATE TRIGGER curr_time_repo BEFORE INSERT
ON repo FOR EACH ROW
BEGIN
	SET NEW.start_date = CURRENT_TIMESTAMP;
END;
//

CREATE TRIGGER curr_time_branch BEFORE INSERT
ON branch FOR EACH ROW
BEGIN
	SET NEW.create_date = CURRENT_TIMESTAMP;
END;
//

CREATE TRIGGER curr_time_bcommit BEFORE INSERT
ON bcommit FOR EACH ROW
BEGIN
	SET NEW.date_time = CURRENT_TIMESTAMP;
END;
//

CREATE TRIGGER curr_time_ccomment BEFORE INSERT
ON ccomment FOR EACH ROW
BEGIN
	SET NEW.date_time = CURRENT_TIMESTAMP;
END;
//

delimiter ;
