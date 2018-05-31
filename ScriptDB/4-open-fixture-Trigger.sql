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

## CREACION DE TRIGGER EN TABLA USERS PARA VALIDAR LA ACTUALIZACION DEL EQUIPO FAVORITO DE CADA PARTICIPANTE
DROP TRIGGER IF EXISTS TRG_team_favorite_users;
CREATE TRIGGER TRG_team_favorite_users
  BEFORE update ON users FOR EACH ROW
BEGIN
  
  DECLARE l_date datetime;

  	IF (OLD.approved = 0 AND NEW.approved = 1) THEN
		SET NEW.date_approved=now();
	END IF;

  SELECT value INTO l_date
    FROM configurations 
  WHERE short_name ='EVENT-START';

  IF  now() >= l_date  THEN
     set new.id_team_fav =  old.id_team_fav ;
  END IF;
END;
## CREACION DE TRIGGER EN TABLA USERS PARA CREAR APUESTAS POR DEFECTO.
# DROP trigger  IF EXISTS trg_update_user;
# CREATE TRIGGER trg_update_user BEFORE UPDATE ON users
# FOR each row
# BEGIN
# 	IF (OLD.approved = 0 AND NEW.approved = 1) THEN
# 		SET NEW.date_approved=now();
# 	END IF;
# END;
