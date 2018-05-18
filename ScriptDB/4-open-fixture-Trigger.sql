## CREACION DE TRIGGER EN TABLA USERS PARA CREAR APUESTAS POR DEFECTO.
DROP trigger  IF EXISTS trg_insert_bets_default;
CREATE TRIGGER trg_insert_bets_default AFTER INSERT ON users
FOR each row 
BEGIN
DECLARE vGameId INT;
 DECLARE done INT DEFAULT 0;
DECLARE cBets CURSOR FOR
	SELECT id FROM games where deleted =0;
    
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
	 
     OPEN cBets;

		INI_REPET: REPEAT
		FETCH cBets INTO vGameId;
        IF NOT done THEN
		INSERT INTO bets (user_id, game_id, goals_team_a, goals_team_b,created, modified, deleted) 
		   VALUE(new.id,vGameId,0,0,now(),now(),0);
		END IF;
        UNTIL done END REPEAT;
END;
