#OBTENER EL TOTAL DE PUNTOS ACUMULADOS EN LA QUINIELA PARA UN USUARIO
DROP  FUNCTION IF EXISTS GET_USER_TOTAL_POINTS;
CREATE FUNCTION GET_USER_TOTAL_POINTS (p_user_id int) RETURNS int(11)
  BEGIN
    DECLARE vGamesId, vGolBetsA, vGolBetsB, vGolGamesA,
    vGolGamesB, vPtos, vIdTeamA, vIdTeamB, vPtosTot INT;
    DECLARE vWinGame, vWinBets CHAR(1 );

    DECLARE done INT DEFAULT 0;

    DECLARE cPuntoUser CURSOR FOR
      select g.id games_id, b.goals_team_a , b.goals_team_b , g.goals_team_a ,
        g.goals_team_b, g.team_a_id, g.team_b_id -- INTO vGamesId, vGolBetsA, vGolBetsB, vGolGamesA, vGolGamesB, vIdTeamA, vIdTeamB
      FROM bets b, games g
      WHERE b.game_id=g.id
      AND date_add(g.date_up, INTERVAL '1 40' HOUR_MINUTE) <= SYSdate()
      AND b.user_id = p_user_id;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    set vPtos = 0;
    set vPtosTot =0;

    OPEN cPuntoUser;
    --
    inicia_cursor: REPEAT


      FETCH cPuntoUser INTO vGamesId, vGolBetsA, vGolBetsB, vGolGamesA, vGolGamesB, vIdTeamA, vIdTeamB;
      IF NOT done THEN
        -- Buscar ganador del partido
        IF vGolGamesA > vGolGamesB THEN
          SET vWinGame = 'A';
        ELSEIF vGolGamesB > vGolGamesA THEN
          set vWinGame = 'B';
        ELSE
          SET vWinGame = 'E';  -- Revisar empate entra de la condicion 1
        END IF;

        -- Buscar ganador del Usuario
        IF vGolBetsA > vGolBetsB THEN
          SET vWinBets = 'A';
        ELSEIF vGolBetsB > vGolBetsA THEN
          SET vWinBets = 'B';
        ELSE
          SET vWinBets = 'E'; -- Revisar empate entra de la condicion 1
        END IF;

        IF vGolBetsA = vGolGamesA AND vGolBetsB = vGolGamesB THEN
          SET vPtos = 10;
        ELSEIF (vWinGame = vWinBets) AND (vGolGamesA = vGolBetsA OR vGolGamesB = vGolBetsB) THEN
          SET vPtos = 6;
        ELSEIF (vWinGame = vWinBets) AND (vGolGamesA != vGolBetsA OR vGolGamesB != vGolBetsB) THEN
          set vPtos = 4;
        ELSEIF (vGolGamesA = vGolBetsA) OR (vGolGamesB = vGolBetsB) THEN
          SET vPtos = 2;
        ELSE
          SET vPtos = 0;
        END IF;

        SET vPtosTot = vPtosTot +  vPtos;
      END IF;
    UNTIL done END REPEAT;
    CLOSE cPuntoUser;

    RETURN vPtosTot;
  END;

#calcula la posicion en la quiniela de un usuario segun su puntuacion total
DROP FUNCTION IF EXISTS GET_USER_RANK;
CREATE FUNCTION GET_USER_RANK(total_points INTEGER) RETURNS INT
  BEGIN
    DECLARE rank INT;
    SELECT FIND_IN_SET(total_points,
                           (SELECT GROUP_CONCAT(  DISTINCT GET_USER_TOTAL_POINTS(x.id)
                                                  ORDER BY GET_USER_TOTAL_POINTS(x.id) DESC )
                            FROM users x)
                      ) INTO rank FROM dual;
    RETURN rank;
  END;

#calcula la posicion en la quiniela de un usuario segun su puntuacion total
DROP FUNCTION IF EXISTS GET_USER_POINTS_BY_GAME;
CREATE FUNCTION `GET_USER_POINTS_BY_GAME`(p_user_id int, p_game_id INT) RETURNS int(11)
BEGIN

     DECLARE vGamesId, vGolBetsA, vGolBetsB, vGolGamesA, 
            vGolGamesB, vPtos, vIdTeamA, vIdTeamB, vPtosTot, vIdTeamFav INT; 
	DECLARE vWinGame, vWinBets INT;
        DECLARE done INT DEFAULT 0;
        
         DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
         
         SET vGamesId = 0; SET vGolBetsA = 0; SET vGolBetsB = 0; SET vGolGamesA = 0; 
            SET vGolGamesB = 0; SET vPtos = 0; set vIdTeamA = 0; SET vIdTeamB = 0; 
            SET vPtosTot = 0;
         
       SELECT g.id games_id, b.goals_team_a bets_goal_a, b.goals_team_b bets_goal_a, g.goals_team_a games_goal_a,
		g.goals_team_b games_goal_a, g.team_a_id , g.team_b_id 
        INTO vGamesId, vGolBetsA, vGolBetsB, vGolGamesA, vGolGamesB, vIdTeamA, vIdTeamB
		FROM bets b join  games g on  b.game_id=g.id
		WHERE g.id = p_game_id 
		AND b.user_id = p_user_id  AND b.deleted = 0
        AND g.deleted = 0;
         
        SELECT id_team_fav  INTO vIdTeamFav
           FROM users 
        WHERE id = p_user_id;
        
         IF vGolGamesA > vGolGamesB THEN 
           SET vWinGame = vIdTeamA;
		ELSEIF vGolGamesB > vGolGamesA THEN 
           set vWinGame = vIdTeamB;
		ELSE 
           SET vWinGame = 'E'; 
		END IF;    
     
        -- Buscar ganador del Usuario
	    IF vGolBetsA > vGolBetsB THEN 
			SET vWinBets = vIdTeamA;
		ELSEIF vGolBetsB > vGolBetsA THEN 
            SET vWinBets = vIdTeamB;
		ELSE 
            SET vWinBets = 'E'; 
		END IF;
        
	   IF vGolBetsA = vGolGamesA AND vGolBetsB = vGolGamesB THEN
          select value INTO vPtos
            from configurations 
          where short_name = 'POINST-CAT-UNO';
          
	   ELSEIF (vWinGame = vWinBets) AND (vGolGamesA = vGolBetsA OR vGolGamesB = vGolBetsB) THEN
		  select value INTO vPtos
            from configurations 
          where short_name = 'POINTS-CAT-DOS';
          
	   ELSEIF (vWinGame = vWinBets) AND (vGolGamesA != vGolBetsA OR vGolGamesB != vGolBetsB) THEN
          select value INTO vPtos
            from configurations 
          where short_name = 'POINTS-CAT-TRES';
          
	   ELSEIF (vGolGamesA = vGolBetsA) OR (vGolGamesB = vGolBetsB) THEN
          select value INTO vPtos
            from configurations 
          where short_name = 'POINTS-CAT-CUATRO';
	   ELSE 
          SET vPtos = 0;
       END IF;
       
       SET vPtosTot = vPtosTot +  vPtos;
       
       IF vIdTeamFav = vWinGame THEN
		     select value into vptos
            from configurations 
            where short_name='POINTS-TEAM-FAV';
		END IF;
	       SET vPtosTot = vPtosTot +  vPtos;
           
	RETURN vPtosTot;
END;

#transforma una cantidad entera de minutos en formato '00:00:00'
DROP FUNCTION IF EXISTS GET_TIME_FORMAT;
CREATE FUNCTION GET_TIME_FORMAT(MINUTES INTEGER) RETURNS VARCHAR(8)
  BEGIN
    DECLARE FORMATED_TIME VARCHAR(8);
    DECLARE HOURS varchar(2);
    DECLARE MINS varchar(2);
#     DECLARE MINUTES INT;

    set HOURS   = substr(concat('00',MINUTES DIV 60),-2);
    set MINS   = substr(concat('00',MINUTES MOD 60),-2);

    set FORMATED_TIME= CONCAT(HOURS,':',MINS,':00');
    RETURN FORMATED_TIME;
  END;
=======
