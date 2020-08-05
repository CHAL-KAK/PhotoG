select * from model;
insert into model values (model_seq.nextval,'a','1','jihye','F',to_date('1995-08-15', 'yyyy-MM-dd'), 'kko');





create or replace procedure VOALL(VO_RES OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN VO_RES for
	SELECT id, password, name FROM tb_customer;
END;
/

-----------------
var res refcursor;
1.exec VOALL(VO_RES값을 리턴받을 변수를 대입)
exec voall(:res)
2.print VO_RES값을 리턴받을 변수
print res
