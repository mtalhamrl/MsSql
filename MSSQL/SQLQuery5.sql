--SELECT * FROM TBLURUNLER
--UPDATE TBLURUNLER SET URUNAD='SU ISITICI' WHERE URUNAD='KETTLE'

--SELECT KATEGORIAD,COUNT(*) AS 'TOPLAM URUN'  FROM TBLURUNLER INNER JOIN TBLKATEGORI
--ON TBLURUNLER.KATEGORI=TBLKATEGORI.KATEGORIID GROUP BY KATEGORIAD ORDER BY COUNT(*)
--UPDATE TBLURUNLER SET URUNSATISFIYAT+=500
--WHERE KATEGORI=(SELECT KATEGORIID FROM TBLKATEGORI WHERE KATEGORIAD='BILGISAYAR')
--SELECT * FROM TBLURUNLER
--SELECT URUNID,URUNAD,URUNMARKA,KATEGORIAD,URUNSATISFIYAT,URUNALISFIYAT,URUNSTOK,
--(URUNSATISFIYAT-URUNALISFIYAT) AS 'KAR',
--(URUNSATISFIYAT-URUNALISFIYAT)*URUNSTOK AS 'TOPLAM KAR'
--FROM TBLURUNLER INNER JOIN TBLKATEGORI
--ON TBLURUNLER.KATEGORI=TBLKATEGORI.KATEGORIID
--UPDATE TBLURUNLER SET URUNSATISFIYAT*=0.20 WHERE (URUNSATISFIYAT-URUNALISFIYAT)*URUNSTOK<1000
--CREATE PROCEDURE HAREKETLER
--AS
--select HAREKETID,URUNAD,MUSTERIAD + ' ' + MUSTERISOYAD AS 'AD SOYAD' , 
--PERSONELADSOYAD
--from TBLHAREKET  INNER JOIN TBLURUNLER
--ON TBLHAREKET.URUN=TBLURUNLER.URUNID
--INNER JOIN TBLMUSTERI
--ON TBLHAREKET.MUSTERI=TBLMUSTERI.MUSTERIID
--INNER JOIN TBLPERSONEL
--ON TBLHAREKET.PERSONEL=TBLPERSONEL.PERSONELID

--EXECUTE HAREKETLER
--CREATE PROCEDURE DENEME
--AS
--SELECT * FROM TBLURUNLER WHERE URUNSTOK>10

--EXEC DENEME
--DROP PROCEDURE DENEME procedure'yi siler!!

--alter procedure URUNGETIR
--@Deger varchar(50)='BUZDOLABI'
--as
--SELECT URUNAD,URUNSTOK,URUNMARKA FROM TBLURUNLER 
--WHERE URUNAD=@Deger

--EXEC URUNGETIR @Deger='LAPTOP'
--SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 3 AND 5 AND MUSTERI='1'
--SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 3 AND
--MUSTERI=(SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ANKARA')
--SELECT DATENAME(MONTH,getdate()),datename(MONTH,'2019.01.15')
--SELECT DATENAME(YEAR,GETDATE())
--SELECT DATEDIFF(YEAR,'2010.10.25',GETDATE())
--SELECT DATEDIFF(MONTH,'2010.06.14',GETDATE())
--SELECT DATEADD(YEAR,3,'2009.10.25')
--SELECT DATEADD(DAY,45,GETDATE())
--SELECT DATEADD(MONTH,350,GETDATE())

--SELECT URUNAD,COUNT(*) AS 'URUN ADETI' FROM TBLHAREKET 
--INNER JOIN TBLURUNLER ON TBLHAREKET.URUN=TBLURUNLER.URUNID
--GROUP BY URUNAD ORDER BY COUNT(*) ASC

--SELECT * FROM TBLHAREKET WHERE URUN IN(SELECT URUNID FROM TBLURUNLER WHERE
--KATEGORI=1)
--SELECT * FROM TBLHAREKET WHERE MUSTERI IN
--(SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

--SELECT * FROM TBLHAREKET WHERE URUN IN
--(SELECT URUNID FROM TBLURUNLER WHERE KATEGORI=
--(SELECT KATEGORIID FROM TBLKATEGORI WHERE KATEGORIAD='BEYAZ ESYA'))
--SELECT SUM(TUTAR) FROM TBLHAREKET WHERE MUSTERI IN
--(SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA' OR MUSTERISEHIR='ANKARA')

--UPDATE TBLURUNLER SET URUNSTOK=URUNSTOK-(SELECT SUM(ADET) FROM TBLHAREKET WHERE
--URUN=5) WHERE URUNID=5

--CREATE TABLE TBLKASA (
--TOPLAM decimal(18,2)
--)
--insert into TBLKASA VALUES (0)
--SELECT * FROM TBLKASA
--UPDATE TBLKASA SET TOPLAM=TOPLAM+(SELECT SUM(TUTAR) FROM TBLHAREKET)
