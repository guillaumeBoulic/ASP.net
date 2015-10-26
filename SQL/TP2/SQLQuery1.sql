USE [stri7]
GO
/****** Objet :  StoredProcedure [dbo].[AFFICHAGE_COMMANDE]    Date de génération du script : 10/26/2015 10:11:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AFFICHAGE_COMMANDE] 
	@id_commande int = 10
AS
BEGIN
	DECLARE @message varchar(500);
	DECLARE @idprod varchar(500);
	DECLARE @cnt varchar(500);

	-- cursor display id
	DECLARE crs_aff CURSOR FOR
		SELECT id_prod
		FROM detail_commande
		WHERE id_com = @id_commande;

	OPEN crs_aff
	FETCH NEXT FROM crs_aff
	INTO @idprod

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @cnt = count(*)
			FROM detail_commande
			WHERE id_prod=@idprod;
			
			SELECT @message  = 'Product ' + @idprod + ' ' + @cnt
			PRINT @message

			FETCH NEXT FROM crs_aff
			INTO @idprod
		END
	CLOSE crs_aff
	DEALLOCATE crs_aff
END
		