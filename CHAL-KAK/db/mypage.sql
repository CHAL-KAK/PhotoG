CREATE OR REPLACE PROCEDURE P_MYPAGE
(
	PID NOTICE_BOARD.P_ID%TYPE,
	RES OUT SYS_REFCURSOR
)
IS
BEGIN
	OPEN RES FOR SELECT * FROM NOTICE_BOARD WHERE P_ID = PID;
END P_MYPAGE;
/

VAR RET REFCURSOR;
EXEC P_MYPAGE('ID1',:RET);
PRINT RET;
--
CREATE OR REPLACE PROCEDURE M_MYPAGE(
MID RESERVATION.M_ID%TYPE,
RES OUT SYS_REFCURSOR
)
IS
BEGIN
OPEN RES FOR SELECT* FROM RESERVATION WHERE M_ID=MID;
END;
/		

VAR RET REFCURSOR;
EXEC M_MYPAGE('b',:RET);
PRINT RET;


--
CREATE OR REPLACE PROCEDURE RESERVATION_SPRAY
(
	SEQ RESERVATION.BRD_SEQ%TYPE,
	RES OUT SYS_REFCURSOR
)
IS
BEGIN
	OPEN RES FOR SELECT * FROM RESERVATION WHERE BRD_SEQ = SEQ;
END RESERVATION_SPRAY;
/

VAR RET REFCURSOR;
EXEC RESERVATION_SPRAY(1,:RET);
PRINT RET;
