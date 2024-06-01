SELECT SYS_DATE FROM DUAL;

CREATE OR REPLACE function fc_Media
(p_nt1 in number, p_nt2 in number, p_nt3 in  number, p_nt4 in number)
return number
AS
v_media number;
Begin 
    v_media := (p_nt1 + p_nt2 + p_nt3 + p_nt4)/4;
    Return(v_media);
End fc_Media;

CREATE OR REPLACE function fc_Media
(p_nt1 in number, p_nt2 in number, p_nt3 in  number, p_nt4 in number)
return number
AS
Begin 
    Return((p_nt1 + p_nt2 + p_nt3 + p_nt4)/4);
End fc_Media;

CREATE OR REPLACE function fc_Media
(p_nt1 in number, p_nt2 in number, p_nt3 in  number, p_nt4 in number)
return number
AS
Begin 
    Return((p_nt1 + p_nt2 + p_nt3 + p_nt4)/4);
End fc_Media;

CREATE OR REPLACE function fc_Mensa2
RETURN varchar2
AS
v_mensa2 varchar2(50);
v_media number(5,2);
Begin
    v_media := fc_media(70, 70, 100, 100);
    v_mensa2 := ('Chama função média e mostra' || TO_CHAR(v_media));
    Return(v_mensa2);
End fc_Mensa2;

CREATE OR REPLACE function fc_Mensa3
RETURN varchar2
AS
v_mensa2 varchar2(50);
Begin
    SELECT nome INTO v_mensa2 FROM empregado WHERE codE = 1;
    Return ('Mostra um nome da tabela Empregado:'  || v_mensa2);
End fc_Mensa3;