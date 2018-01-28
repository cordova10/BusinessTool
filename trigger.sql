USE [business_db]
GO
/****** Object:  Trigger [dbo].[trg_actualiza_stock]    Script Date: 26/01/2018 22:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create TRIGGER [dbo].[trg_actualiza_stock] ON [dbo].[inv_trans_detalle]
	AFTER INSERT, UPDATE, DELETE
AS 
BEGIN

    SET NOCOUNT ON;

	Declare @id int,
			@trans int,
			@pro int,
			@ubi int,
			@can int,
			@cos decimal(18,4)


    IF EXISTS(SELECT * FROM INSERTED)
	Begin

		SELECT
			@id = tde_id,
			@trans = tde_trans,
			@can = tde_cantidad,
			@pro = tde_producto,
			@ubi = tde_ubicacion,
			@cos = tde_costo
		FROM INSERTED



		IF NOT EXISTS(Select sto_id from [dbo].[inv_producto_stock] where sto_producto = @pro and sto_ubicacion = @ubi and sto_costo = @cos)
			Begin
				-- Nuevo
				Insert Into [dbo].[inv_producto_stock]
					Select 
						tde_cantidad,
						tde_producto,
						tde_ubicacion,
						tde_costo,
						GETDATE(),
						tde_usuario_trans,
						0
					from [dbo].[inv_trans_detalle]
					Where tde_id = @id
			End
		Else
			Begin
				-- Actualizamos
				IF((Select [tra_tipo] from [dbo].[inv_trans] where [tra_id] = @trans) = 1)
					Begin
						-- Entrada
						Update [dbo].[inv_producto_stock]
							Set [sto_cantidad] = [sto_cantidad] + @can
						Where		[sto_producto] = @pro
								And [sto_ubicacion] = @ubi
								And [sto_costo] = @cos
					End
				Else
					Begin
						-- Salida
						Update [dbo].[inv_producto_stock]
							Set [sto_cantidad] = [sto_cantidad] - @can
						Where		[sto_producto] = @pro
								And [sto_ubicacion] = @ubi
								And [sto_costo] = @cos

					End
			End

    End
	ELSE
	Begin

		SELECT
			@trans = tde_trans,
			@can = tde_cantidad,
			@pro = tde_producto,
			@ubi = tde_ubicacion,
			@cos = tde_costo
		FROM DELETED

		-- Salida
		Update [dbo].[inv_producto_stock]
			Set [sto_cantidad] = [sto_cantidad] - @can
		Where		[sto_producto] = @pro
				And [sto_ubicacion] = @ubi
				And [sto_costo] = @cos

	End

END
