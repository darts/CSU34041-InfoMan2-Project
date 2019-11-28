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
CREATE TRIGGER update_latest_commit BEFORE INSERT
ON bcommit FOR EACH ROW
BEGIN 
	UPDATE branch 
	SET latest_commit = NEW.ID
	WHERE ID = NEW.branch;
END;
//

delimiter ;
