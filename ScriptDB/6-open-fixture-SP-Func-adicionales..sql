##### SP que le actualiza goles de la tabla games para simular y testear la aplicacion
CREATE DEFINER=`batman`@`%` PROCEDURE `SP_SIMULA_RESULTADO_GAMES`()
BEGIN

	   DECLARE  vID int(11);
	   DECLARE done INT DEFAULT 0;
	   DECLARE cCursor CURSOR FOR
		SELECT id FROM games WHERE deleted = 0;
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
		
		OPEN cCursor;

		Inicia_cursor: REPEAT 
			FETCH cCursor INTO  vId;
				IF NOT done THEN 
					UPDATE games 
					SET goals_team_a = TRUNCATE(RAND()*5,0),
						goals_team_b = TRUNCATE(RAND()*5,0),
                                             finished = 1
					WHERE id = vID;
				END IF;
		UNTIL done END REPEAT;
	-- Cierra cursor
		CLOSE cCursor;
	END
