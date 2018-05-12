#OBTENER EL TOTAL DE PUNTOS ACUMULADOS EN LA QUINIELA PARA UN USUARIO
DROP FUNCTION GET_USER_TOTAL_POINTS;
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
CREATE FUNCTION GET_USER_POINTS_BY_GAME(USER_ID INTEGER, GAME_ID INTEGER) RETURNS INT
  BEGIN
    RETURN TRUNCATE(RAND()*10,0);
  END;