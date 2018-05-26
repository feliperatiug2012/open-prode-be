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
DROP TRIGGER IF EXISTS TRG_team_favorite_users
CREATE DEFINER=`batman`@`%` TRIGGER `nullpoin_open-fixture`.`TRG_team_favorite_users` 
  BEFORE update ON `users` FOR EACH ROW
BEGIN
  
  DECLARE l_date datetime;

  SELECT date_format(value, '%Y-%m-%d')  INTO l_date
    FROM configurations 
  WHERE title ='WordWide Start Date';
   
  IF old.id_team_fav IS NULL THEN
     IF date_format(now(),'%Y-%m-%d') = l_date  THEN
        set new.id_team_fav =  old.id_team_fav ;
  ELSEIF  NEW.id_team_fav is not null THEN
      set new.id_team_fav = new.id_team_fav ;
  END IF;
   ELSE 
     set new.id_team_fav =  old.id_team_fav ;  
  END IF;
END;
