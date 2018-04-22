#OBTENER EL TOTAL DE PUNTOS ACUMULADOS EN LA QUINIELA PARA UN USUARIO
DROP FUNCTION IF EXISTS GET_USER_TOTAL_POINTS;
CREATE FUNCTION GET_USER_TOTAL_POINTS(user_id VARCHAR(45)) RETURNS INT
BEGIN
    DECLARE POINTS INT;

  SELECT sum(b.goals_team_a) INTO POINTS
  FROM users U
    JOIN bets b on U.id = b.user_id
  WHERE U.id=user_id;
    #INTO POINTS FROM users U WHERE U.username=userName;
# FLOOR(RAND() * (<max> - <min> + 1)) + <min>
  RETURN POINTS;
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