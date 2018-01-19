USE [business_db]
GO
/****** Object:  Table [dbo].[adm_usuario]    Script Date: 18/01/2018 13:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_usuario](
	[usr_id] [bigint] IDENTITY(1,1) NOT NULL,
	[usr_usuario] [varchar](20) NOT NULL,
	[usr_password] [varchar](50) NOT NULL,
	[usr_nombre] [varchar](60) NOT NULL,
	[usr_fecha_tran] [datetime] NOT NULL,
	[usr_usuario_tran] [int] NOT NULL,
	[usr_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_admin_usuario] PRIMARY KEY CLUSTERED 
(
	[usr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_cliente]    Script Date: 18/01/2018 13:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_cliente](
	[cli_id] [int] IDENTITY(1,1) NOT NULL,
	[cli_nombres] [varchar](100) NOT NULL,
	[cli_direccion] [varchar](200) NULL,
	[cli_no_registro] [varchar](10) NULL,
	[cli_telefono] [varchar](15) NULL,
	[cli_activo] [bit] NOT NULL,
	[cli_fecha_tran] [datetime] NOT NULL,
	[cli_usuario_tran] [int] NOT NULL,
	[cli_eliminado] [int] NOT NULL,
 CONSTRAINT [PK_fac_cliente] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_cxc]    Script Date: 18/01/2018 13:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_cxc](
	[cxc_id] [int] IDENTITY(1,1) NOT NULL,
	[cxc_fecha] [date] NULL,
	[cxc_factura] [int] NULL,
	[cxc_cliente] [int] NULL,
	[cxc_monto] [decimal](18, 2) NULL,
	[cxc_dias_credito] [int] NULL,
	[cxc_fecha_trans] [datetime] NULL,
	[cxc_usuario_trans] [int] NULL,
 CONSTRAINT [PK_fac_cuenta_cobrar] PRIMARY KEY CLUSTERED 
(
	[cxc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_cxc_detalle]    Script Date: 18/01/2018 13:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_cxc_detalle](
	[cde_id] [int] IDENTITY(1,1) NOT NULL,
	[cde_cuenta] [int] NULL,
	[cde_fecha] [date] NULL,
	[cde_abono] [decimal](18, 2) NULL,
	[cde_no_documento] [varchar](10) NULL,
	[cde_fecha_tran] [datetime] NULL,
	[cde_usuario_tran] [int] NULL,
 CONSTRAINT [PK_fac_cxc_detalle] PRIMARY KEY CLUSTERED 
(
	[cde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_factura]    Script Date: 18/01/2018 13:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_factura](
	[fac_id] [int] IDENTITY(1,1) NOT NULL,
	[fac_serie] [varchar](10) NOT NULL,
	[fac_tipo_factura] [int] NOT NULL,
	[fac_tipo_pago] [int] NOT NULL,
	[fac_caja] [int] NULL,
	[fac_fecha] [date] NULL,
	[fac_numero] [int] NULL,
	[fac_no_registro] [varchar](10) NULL,
	[fac_cliente] [varchar](70) NULL,
	[fac_vendedor] [int] NULL,
	[fac_monto] [decimal](18, 4) NULL,
	[fac_impuesto] [decimal](18, 4) NULL,
	[fac_total] [decimal](18, 4) NULL,
	[fac_nota] [varchar](70) NULL,
	[fac_eliminado] [bit] NULL,
	[fac_usuario_tran] [int] NULL,
	[fac_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_factura] PRIMARY KEY CLUSTERED 
(
	[fac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_factura_detalle]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_factura_detalle](
	[fde_id] [int] IDENTITY(1,1) NOT NULL,
	[fde_factura] [int] NULL,
	[fde_producto] [varchar](30) NULL,
	[fde_descripcion] [varchar](70) NULL,
	[fde_cantidad] [int] NULL,
	[fde_unidad_medida] [varchar](10) NULL,
	[fde_precio_unitario] [decimal](18, 2) NULL,
	[fde_descuento_porcen] [decimal](18, 2) NULL,
	[fde_descuento_monto] [decimal](18, 2) NULL,
	[fde_costo] [decimal](18, 2) NULL,
	[fde_usuario_tran] [int] NULL,
	[fde_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_factura_detalle] PRIMARY KEY CLUSTERED 
(
	[fde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_pedido]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_pedido](
	[ped_id] [int] IDENTITY(1,1) NOT NULL,
	[ped_numero] [int] NULL,
	[ped_fecha] [date] NULL,
	[ped_cliente] [int] NULL,
	[ped_vendedor] [int] NULL,
	[ped_estado] [int] NULL,
	[ped_factura] [int] NULL,
	[ped_eliminado] [bit] NULL,
	[ped_usuario_tran] [int] NULL,
	[ped_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_pedido] PRIMARY KEY CLUSTERED 
(
	[ped_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_pedido_detalle]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_pedido_detalle](
	[pde_id] [int] IDENTITY(1,1) NOT NULL,
	[pde_pedido] [int] NULL,
	[pde_cantidad] [int] NULL,
	[pde_producto] [int] NULL,
	[pde_precio_uni] [decimal](18, 2) NULL,
	[pde_descuento_porcen] [decimal](18, 2) NULL,
	[fde_descuento_monto] [decimal](18, 2) NULL,
	[pde_costo] [decimal](18, 2) NULL,
	[pde_eliminado] [bit] NULL,
	[pde_usuario_tran] [int] NULL,
	[pde_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_pedido_detalle] PRIMARY KEY CLUSTERED 
(
	[pde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_pedido_estado]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_pedido_estado](
	[pes_id] [int] IDENTITY(1,1) NOT NULL,
	[pes_estado] [varchar](50) NULL,
 CONSTRAINT [PK_fac_pedido_estado] PRIMARY KEY CLUSTERED 
(
	[pes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_precio]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_precio](
	[pre_id] [int] IDENTITY(1,1) NOT NULL,
	[pre_descripcion] [varchar](70) NULL,
	[pre_activo] [bit] NULL,
	[pre_fecha_tran] [datetime] NULL,
	[pre_usuario_tran] [int] NULL,
 CONSTRAINT [PK_fac_precio] PRIMARY KEY CLUSTERED 
(
	[pre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_precio_detalle]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_precio_detalle](
	[pde_id] [int] IDENTITY(1,1) NOT NULL,
	[pde_precio] [int] NULL,
	[pde_producto] [int] NULL,
	[pde_valor] [decimal](18, 2) NULL,
	[pde_activo] [bit] NULL,
	[pde_fecha_tran] [datetime] NULL,
	[pde_usuario_tran] [int] NULL,
 CONSTRAINT [PK_fac_precio_detalle] PRIMARY KEY CLUSTERED 
(
	[pde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_tipo_factura]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_tipo_factura](
	[tfa_id] [int] IDENTITY(1,1) NOT NULL,
	[tfa_tipo_factura] [varchar](50) NOT NULL,
	[tfa_eliminado] [bit] NOT NULL,
	[tfa_usuario_tran] [int] NULL,
	[tfa_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_tipo_factura] PRIMARY KEY CLUSTERED 
(
	[tfa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_tipo_pago]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_tipo_pago](
	[tpa_id] [int] IDENTITY(1,1) NOT NULL,
	[tpa_tipo_pago] [varchar](50) NOT NULL,
	[tpa_num_dias] [int] NOT NULL,
	[tpa_eliminado] [bit] NOT NULL,
	[tpa_usuario_tran] [int] NULL,
	[tpa_fecha_tran] [datetime] NULL,
 CONSTRAINT [PK_fac_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[tpa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fac_vendedor]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_vendedor](
	[ven_id] [int] IDENTITY(1,1) NOT NULL,
	[ven_codigo] [varchar](10) NULL,
	[ven_nombre] [varchar](70) NULL,
	[ven_activo] [bit] NULL,
 CONSTRAINT [PK_fac_vendedor] PRIMARY KEY CLUSTERED 
(
	[ven_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_despacho]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_despacho](
	[des_id] [int] IDENTITY(1,1) NOT NULL,
	[des_factura] [int] NOT NULL,
	[des_fecha] [date] NOT NULL,
	[des_cliente] [varchar](70) NOT NULL,
	[des_direccion] [varchar](200) NULL,
	[des_aplicado] [bit] NULL,
	[des_comentario] [varchar](100) NULL,
	[des_fecha_tran] [datetime] NOT NULL,
	[des_usuario_tran] [int] NOT NULL,
	[des_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_despacho] PRIMARY KEY CLUSTERED 
(
	[des_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_despacho_detalle]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_despacho_detalle](
	[ddt_id] [int] IDENTITY(1,1) NOT NULL,
	[ddt_despacho] [int] NOT NULL,
	[ddt_cantidad] [int] NOT NULL,
	[ddt_producto] [int] NOT NULL,
	[ddt_descripcion] [varchar](70) NULL,
	[ddt_costo] [decimal](18, 2) NULL,
	[ddt_ubicacion] [int] NULL,
	[ddt_fecha_tran] [datetime] NOT NULL,
	[ddt_usuario_tran] [int] NOT NULL,
	[ddt_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_despacho_detalle] PRIMARY KEY CLUSTERED 
(
	[ddt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_producto]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_producto](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_codigo] [varchar](15) NOT NULL,
	[pro_descripcion] [varchar](70) NULL,
	[pro_unidad_medida] [int] NULL,
	[pro_tipo] [int] NULL,
	[pro_existencia_min] [int] NOT NULL,
	[pro_existencia_max] [int] NOT NULL,
	[pro_proveedor] [int] NULL,
	[pro_activo] [bit] NOT NULL,
	[pro_fecha_tran] [datetime] NOT NULL,
	[pro_usuario_tran] [int] NOT NULL,
	[pro_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_producto] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_producto_stock]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_producto_stock](
	[sto_id] [int] IDENTITY(1,1) NOT NULL,
	[sto_cantidad] [int] NOT NULL,
	[sto_producto] [int] NOT NULL,
	[sto_ubicacion] [int] NULL,
	[sto_costo] [decimal](18, 4) NOT NULL,
	[sto_fecha_tran] [datetime] NOT NULL,
	[sto_usuario_tran] [int] NOT NULL,
	[sto_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_producto_stock] PRIMARY KEY CLUSTERED 
(
	[sto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_producto_tipo]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_producto_tipo](
	[pti_id] [int] IDENTITY(1,1) NOT NULL,
	[pti_descripcion] [varchar](50) NULL,
	[pti_visible] [bit] NULL,
	[pti_fecha_tran] [datetime] NOT NULL,
	[pti_usuario_tran] [int] NOT NULL,
	[pti_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_producto_tipo] PRIMARY KEY CLUSTERED 
(
	[pti_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_proveedor]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_proveedor](
	[prv_id] [int] IDENTITY(1,1) NOT NULL,
	[prv_nombre] [varchar](70) NOT NULL,
	[prv_direccion] [varchar](200) NULL,
	[prv_telefono] [varchar](15) NULL,
	[prv_fecha_trans] [datetime] NOT NULL,
	[prv_usuario_trans] [int] NOT NULL,
	[prv_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_proveedor] PRIMARY KEY CLUSTERED 
(
	[prv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_trans]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_trans](
	[tra_id] [int] IDENTITY(1,1) NOT NULL,
	[tra_fecha] [date] NULL,
	[tra_usuario] [varchar](20) NULL,
	[tra_tipo] [int] NULL,
	[tra_comentario] [varchar](150) NULL,
	[tra_fecha_trans] [datetime] NULL,
	[tra_usuario_trans] [int] NULL,
	[tra_eliminado] [bit] NULL,
 CONSTRAINT [PK_inv_trans] PRIMARY KEY CLUSTERED 
(
	[tra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_trans_detalle]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_trans_detalle](
	[tde_id] [int] IDENTITY(1,1) NOT NULL,
	[tde_trans] [int] NOT NULL,
	[tde_cantidad] [int] NULL,
	[tde_producto] [int] NULL,
	[tde_descripcion] [varchar](70) NULL,
	[tde_costo] [decimal](18, 4) NULL,
	[tde_ubicacion] [int] NULL,
	[tde_fecha_trans] [datetime] NULL,
	[tde_usuario_trans] [int] NULL,
	[tde_eliminado] [bit] NULL,
 CONSTRAINT [PK_inv_trans_detalle] PRIMARY KEY CLUSTERED 
(
	[tde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_ubicacion]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_ubicacion](
	[ubi_id] [int] IDENTITY(1,1) NOT NULL,
	[ubi_codigo] [varchar](10) NOT NULL,
	[ubi_descripcion] [varchar](70) NULL,
	[ubi_activo] [bit] NOT NULL,
	[ubi_fecha_tran] [datetime] NOT NULL,
	[ubi_usuario_tran] [int] NOT NULL,
	[ubi_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_ubicacion] PRIMARY KEY CLUSTERED 
(
	[ubi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inv_unidad_medida]    Script Date: 18/01/2018 13:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inv_unidad_medida](
	[uni_id] [int] IDENTITY(1,1) NOT NULL,
	[uni_descripcion] [varchar](50) NULL,
	[uni_fecha_tran] [datetime] NOT NULL,
	[ubi_usuario_tran] [int] NOT NULL,
	[ubi_eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_inv_unidad_medida] PRIMARY KEY CLUSTERED 
(
	[uni_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[adm_usuario] ON 

INSERT [dbo].[adm_usuario] ([usr_id], [usr_usuario], [usr_password], [usr_nombre], [usr_fecha_tran], [usr_usuario_tran], [usr_eliminado]) VALUES (1, N'Christian', N'123456', N'Christian Cordova', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[adm_usuario] OFF
SET IDENTITY_INSERT [dbo].[fac_pedido] ON 

INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (1, 1001, CAST(N'2017-06-01' AS Date), 1, 1, 1, NULL, 0, 1, CAST(N'2017-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (2, 1002, CAST(N'2017-06-05' AS Date), 1, 1, 2, NULL, 0, 1, CAST(N'2017-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (3, 1003, CAST(N'2017-06-05' AS Date), 1, 1, 3, NULL, 0, 1, CAST(N'2017-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido] ([ped_id], [ped_numero], [ped_fecha], [ped_cliente], [ped_vendedor], [ped_estado], [ped_factura], [ped_eliminado], [ped_usuario_tran], [ped_fecha_tran]) VALUES (4, 1004, CAST(N'2017-06-05' AS Date), 1, 1, 1, NULL, 0, 1, CAST(N'2017-06-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[fac_pedido] OFF
SET IDENTITY_INSERT [dbo].[fac_pedido_detalle] ON 

INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (1, 1, 1, 1, CAST(500.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (2, 2, 1, 1, CAST(600.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (3, 3, 2, 1, CAST(350.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[fac_pedido_detalle] ([pde_id], [pde_pedido], [pde_cantidad], [pde_producto], [pde_precio_uni], [pde_descuento_porcen], [fde_descuento_monto], [pde_costo], [pde_eliminado], [pde_usuario_tran], [pde_fecha_tran]) VALUES (4, 4, 1, 1, CAST(100.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 1, CAST(N'2017-06-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[fac_pedido_detalle] OFF
SET IDENTITY_INSERT [dbo].[fac_pedido_estado] ON 

INSERT [dbo].[fac_pedido_estado] ([pes_id], [pes_estado]) VALUES (1, N'Analisis')
INSERT [dbo].[fac_pedido_estado] ([pes_id], [pes_estado]) VALUES (2, N'Aprobado')
INSERT [dbo].[fac_pedido_estado] ([pes_id], [pes_estado]) VALUES (3, N'Rechazado')
SET IDENTITY_INSERT [dbo].[fac_pedido_estado] OFF
SET IDENTITY_INSERT [dbo].[fac_tipo_factura] ON 

INSERT [dbo].[fac_tipo_factura] ([tfa_id], [tfa_tipo_factura], [tfa_eliminado], [tfa_usuario_tran], [tfa_fecha_tran]) VALUES (1, N'Consumidor Final', 0, NULL, NULL)
INSERT [dbo].[fac_tipo_factura] ([tfa_id], [tfa_tipo_factura], [tfa_eliminado], [tfa_usuario_tran], [tfa_fecha_tran]) VALUES (2, N'Credito Fiscal', 0, NULL, NULL)
INSERT [dbo].[fac_tipo_factura] ([tfa_id], [tfa_tipo_factura], [tfa_eliminado], [tfa_usuario_tran], [tfa_fecha_tran]) VALUES (3, N'Ticket', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[fac_tipo_factura] OFF
SET IDENTITY_INSERT [dbo].[fac_tipo_pago] ON 

INSERT [dbo].[fac_tipo_pago] ([tpa_id], [tpa_tipo_pago], [tpa_num_dias], [tpa_eliminado], [tpa_usuario_tran], [tpa_fecha_tran]) VALUES (1, N'Contado', 0, 0, NULL, NULL)
INSERT [dbo].[fac_tipo_pago] ([tpa_id], [tpa_tipo_pago], [tpa_num_dias], [tpa_eliminado], [tpa_usuario_tran], [tpa_fecha_tran]) VALUES (2, N'Credito 30 Dias', 30, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[fac_tipo_pago] OFF
SET IDENTITY_INSERT [dbo].[fac_vendedor] ON 

INSERT [dbo].[fac_vendedor] ([ven_id], [ven_codigo], [ven_nombre], [ven_activo]) VALUES (1, N'V001', N'William Perez', NULL)
SET IDENTITY_INSERT [dbo].[fac_vendedor] OFF
SET IDENTITY_INSERT [dbo].[inv_producto] ON 

INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (1, N'S001', N'Juguete carritos policia', 1, 1, 25, 10000, 1, 1, CAST(N'2018-01-07T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (3, N'S002', N'Muneca Barbie', 1, 1, 25, 500, 1, 1, CAST(N'2017-12-30T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (4, N'S003', N'Camisas Mi', 1, 1, 25, 300, 1, 1, CAST(N'2017-12-31T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (5, N'S004', N'Short', 1, 1, 10, 100, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (6, N'S005', N'Pants', 1, 1, 20, 50, 1, 1, CAST(N'2017-12-31T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (7, N'S006', N'Coche para bebe', 1, 1, 5, 25, 1, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (10, N'S007', N'Lapiceros', 1, 1, 10, 100, 1, 1, CAST(N'2018-01-10T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (11, N'S008', N'Cuadernos', 1, 1, 10, 200, 1, 1, CAST(N'2018-01-10T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (12, N'S009', N'Libretas', 1, 1, 10, 50, 1, 1, CAST(N'2018-01-10T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (13, N'S010', N'Cartulinas', 1, 1, 10, 45, 1, 1, CAST(N'2018-01-10T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (14, N'S011', N'Plastico para forrar cuadernos', 2, 1, 5, 30, 1, 1, CAST(N'2018-01-10T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto] ([pro_id], [pro_codigo], [pro_descripcion], [pro_unidad_medida], [pro_tipo], [pro_existencia_min], [pro_existencia_max], [pro_proveedor], [pro_activo], [pro_fecha_tran], [pro_usuario_tran], [pro_eliminado]) VALUES (15, N'S0012', N'Prueba', 1, 1, 20, 50, 1, 1, CAST(N'2018-01-18T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_producto] OFF
SET IDENTITY_INSERT [dbo].[inv_producto_tipo] ON 

INSERT [dbo].[inv_producto_tipo] ([pti_id], [pti_descripcion], [pti_visible], [pti_fecha_tran], [pti_usuario_tran], [pti_eliminado]) VALUES (1, N'Almacenable', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_producto_tipo] ([pti_id], [pti_descripcion], [pti_visible], [pti_fecha_tran], [pti_usuario_tran], [pti_eliminado]) VALUES (2, N'Servicio', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_producto_tipo] OFF
SET IDENTITY_INSERT [dbo].[inv_proveedor] ON 

INSERT [dbo].[inv_proveedor] ([prv_id], [prv_nombre], [prv_direccion], [prv_telefono], [prv_fecha_trans], [prv_usuario_trans], [prv_eliminado]) VALUES (1, N'Importadora Canaan', N'Miami. Estados Unidos', N'001-253-8909', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_proveedor] ([prv_id], [prv_nombre], [prv_direccion], [prv_telefono], [prv_fecha_trans], [prv_usuario_trans], [prv_eliminado]) VALUES (2, N'Nuevo', N'San Salvador', N'2222-2221', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_proveedor] OFF
SET IDENTITY_INSERT [dbo].[inv_trans] ON 

INSERT [dbo].[inv_trans] ([tra_id], [tra_fecha], [tra_usuario], [tra_tipo], [tra_comentario], [tra_fecha_trans], [tra_usuario_trans], [tra_eliminado]) VALUES (1, CAST(N'2017-10-01' AS Date), N'1', 1, N'Apertura de Inventario', CAST(N'2017-10-01T00:00:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[inv_trans] OFF
SET IDENTITY_INSERT [dbo].[inv_ubicacion] ON 

INSERT [dbo].[inv_ubicacion] ([ubi_id], [ubi_codigo], [ubi_descripcion], [ubi_activo], [ubi_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (1, N'BOD001', N'Ubicacion 001', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_ubicacion] OFF
SET IDENTITY_INSERT [dbo].[inv_unidad_medida] ON 

INSERT [dbo].[inv_unidad_medida] ([uni_id], [uni_descripcion], [uni_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (1, N'Unidades', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[inv_unidad_medida] ([uni_id], [uni_descripcion], [uni_fecha_tran], [ubi_usuario_tran], [ubi_eliminado]) VALUES (2, N'Cajas', CAST(N'2017-01-01T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[inv_unidad_medida] OFF
ALTER TABLE [dbo].[adm_usuario] ADD  CONSTRAINT [DF_adm_usuario_usr_fecha_tran]  DEFAULT (getdate()) FOR [usr_fecha_tran]
GO
ALTER TABLE [dbo].[adm_usuario] ADD  CONSTRAINT [DF_adm_usuario_usr_usuario_tran]  DEFAULT ((0)) FOR [usr_usuario_tran]
GO
ALTER TABLE [dbo].[adm_usuario] ADD  CONSTRAINT [DF_adm_usuario_usr_eliminado]  DEFAULT ((0)) FOR [usr_eliminado]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_fecha_tran]  DEFAULT (getdate()) FOR [cli_fecha_tran]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_usuario_tran]  DEFAULT ((0)) FOR [cli_usuario_tran]
GO
ALTER TABLE [dbo].[fac_cliente] ADD  CONSTRAINT [DF_fac_cliente_cli_eliminado]  DEFAULT ((0)) FOR [cli_eliminado]
GO
ALTER TABLE [dbo].[fac_factura] ADD  CONSTRAINT [DF_fac_factura_fac_eliminado]  DEFAULT ((0)) FOR [fac_eliminado]
GO
ALTER TABLE [dbo].[fac_tipo_factura] ADD  CONSTRAINT [DF_fac_tipo_factura_tfa_eliminado]  DEFAULT ((0)) FOR [tfa_eliminado]
GO
ALTER TABLE [dbo].[fac_tipo_pago] ADD  CONSTRAINT [DF_fac_tipo_pago_tpa_eliminado]  DEFAULT ((0)) FOR [tpa_eliminado]
GO
ALTER TABLE [dbo].[inv_despacho] ADD  CONSTRAINT [DF_inv_despacho_des_aplicado]  DEFAULT ((0)) FOR [des_aplicado]
GO
ALTER TABLE [dbo].[inv_despacho_detalle] ADD  CONSTRAINT [DF_inv_despacho_detalle_ddt_fecha_tran]  DEFAULT (getdate()) FOR [ddt_fecha_tran]
GO
ALTER TABLE [dbo].[inv_despacho_detalle] ADD  CONSTRAINT [DF_inv_despacho_detalle_ddt_usuario_tran]  DEFAULT ((0)) FOR [ddt_usuario_tran]
GO
ALTER TABLE [dbo].[inv_despacho_detalle] ADD  CONSTRAINT [DF_inv_despacho_detalle_ddt_eliminado]  DEFAULT ((0)) FOR [ddt_eliminado]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_activo]  DEFAULT ((1)) FOR [pro_activo]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_fecha_tran]  DEFAULT (getdate()) FOR [pro_fecha_tran]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_usuario_tran]  DEFAULT ((0)) FOR [pro_usuario_tran]
GO
ALTER TABLE [dbo].[inv_producto] ADD  CONSTRAINT [DF_inv_producto_pro_eliminado]  DEFAULT ((0)) FOR [pro_eliminado]
GO
ALTER TABLE [dbo].[inv_producto_stock] ADD  CONSTRAINT [DF_inv_producto_stock_sto_fecha_tran]  DEFAULT (getdate()) FOR [sto_fecha_tran]
GO
ALTER TABLE [dbo].[inv_producto_stock] ADD  CONSTRAINT [DF_inv_producto_stock_sto_usuario_tran]  DEFAULT ((0)) FOR [sto_usuario_tran]
GO
ALTER TABLE [dbo].[inv_producto_stock] ADD  CONSTRAINT [DF_inv_producto_stock_sto_eliminado]  DEFAULT ((0)) FOR [sto_eliminado]
GO
ALTER TABLE [dbo].[inv_producto_tipo] ADD  CONSTRAINT [DF_inv_producto_tipo_pti_fecha_tran]  DEFAULT (getdate()) FOR [pti_fecha_tran]
GO
ALTER TABLE [dbo].[inv_producto_tipo] ADD  CONSTRAINT [DF_inv_producto_tipo_pti_usuario_tran]  DEFAULT ((0)) FOR [pti_usuario_tran]
GO
ALTER TABLE [dbo].[inv_producto_tipo] ADD  CONSTRAINT [DF_inv_producto_tipo_pti_eliminado]  DEFAULT ((0)) FOR [pti_eliminado]
GO
ALTER TABLE [dbo].[inv_proveedor] ADD  CONSTRAINT [DF_inv_proveedor_prv_fecha_trans]  DEFAULT (getdate()) FOR [prv_fecha_trans]
GO
ALTER TABLE [dbo].[inv_proveedor] ADD  CONSTRAINT [DF_inv_proveedor_prv_usuario_trans]  DEFAULT ((0)) FOR [prv_usuario_trans]
GO
ALTER TABLE [dbo].[inv_proveedor] ADD  CONSTRAINT [DF_inv_proveedor_prv_eliminado]  DEFAULT ((0)) FOR [prv_eliminado]
GO
ALTER TABLE [dbo].[inv_trans] ADD  CONSTRAINT [DF_inv_trans_tra_eliminado]  DEFAULT ((0)) FOR [tra_eliminado]
GO
ALTER TABLE [dbo].[inv_ubicacion] ADD  CONSTRAINT [DF_inv_ubicacion_ubi_activo]  DEFAULT ((1)) FOR [ubi_activo]
GO
ALTER TABLE [dbo].[inv_ubicacion] ADD  CONSTRAINT [DF_inv_ubicacion_ubi_fecha_tran]  DEFAULT (getdate()) FOR [ubi_fecha_tran]
GO
ALTER TABLE [dbo].[inv_ubicacion] ADD  CONSTRAINT [DF_inv_ubicacion_ubi_eliminado]  DEFAULT ((0)) FOR [ubi_eliminado]
GO
ALTER TABLE [dbo].[inv_unidad_medida] ADD  CONSTRAINT [DF_inv_unidad_medida_uni_fecha_tran]  DEFAULT (getdate()) FOR [uni_fecha_tran]
GO
ALTER TABLE [dbo].[inv_unidad_medida] ADD  CONSTRAINT [DF_inv_unidad_medida_ubi_usuario_tran]  DEFAULT ((0)) FOR [ubi_usuario_tran]
GO
ALTER TABLE [dbo].[inv_unidad_medida] ADD  CONSTRAINT [DF_inv_unidad_medida_ubi_eliminado]  DEFAULT ((0)) FOR [ubi_eliminado]
GO
ALTER TABLE [dbo].[fac_cxc_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_cxc_detalle_fac_cxc] FOREIGN KEY([cde_cuenta])
REFERENCES [dbo].[fac_cxc] ([cxc_id])
GO
ALTER TABLE [dbo].[fac_cxc_detalle] CHECK CONSTRAINT [FK_fac_cxc_detalle_fac_cxc]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_tipo_factura] FOREIGN KEY([fac_tipo_factura])
REFERENCES [dbo].[fac_tipo_factura] ([tfa_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_tipo_factura]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_tipo_pago] FOREIGN KEY([fac_tipo_pago])
REFERENCES [dbo].[fac_tipo_pago] ([tpa_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_tipo_pago]
GO
ALTER TABLE [dbo].[fac_factura]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_fac_vendedor] FOREIGN KEY([fac_vendedor])
REFERENCES [dbo].[fac_vendedor] ([ven_id])
GO
ALTER TABLE [dbo].[fac_factura] CHECK CONSTRAINT [FK_fac_factura_fac_vendedor]
GO
ALTER TABLE [dbo].[fac_factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_factura_detalle_fac_factura] FOREIGN KEY([fde_factura])
REFERENCES [dbo].[fac_factura] ([fac_id])
GO
ALTER TABLE [dbo].[fac_factura_detalle] CHECK CONSTRAINT [FK_fac_factura_detalle_fac_factura]
GO
ALTER TABLE [dbo].[fac_pedido]  WITH CHECK ADD  CONSTRAINT [FK_fac_pedido_fac_pedido_estado] FOREIGN KEY([ped_estado])
REFERENCES [dbo].[fac_pedido_estado] ([pes_id])
GO
ALTER TABLE [dbo].[fac_pedido] CHECK CONSTRAINT [FK_fac_pedido_fac_pedido_estado]
GO
ALTER TABLE [dbo].[fac_pedido_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_pedido_detalle_fac_pedido] FOREIGN KEY([pde_pedido])
REFERENCES [dbo].[fac_pedido] ([ped_id])
GO
ALTER TABLE [dbo].[fac_pedido_detalle] CHECK CONSTRAINT [FK_fac_pedido_detalle_fac_pedido]
GO
ALTER TABLE [dbo].[fac_precio_detalle]  WITH CHECK ADD  CONSTRAINT [FK_fac_precio_detalle_fac_precio] FOREIGN KEY([pde_precio])
REFERENCES [dbo].[fac_precio] ([pre_id])
GO
ALTER TABLE [dbo].[fac_precio_detalle] CHECK CONSTRAINT [FK_fac_precio_detalle_fac_precio]
GO
ALTER TABLE [dbo].[inv_despacho_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_despacho_detalle_inv_despacho] FOREIGN KEY([ddt_despacho])
REFERENCES [dbo].[inv_despacho] ([des_id])
GO
ALTER TABLE [dbo].[inv_despacho_detalle] CHECK CONSTRAINT [FK_inv_despacho_detalle_inv_despacho]
GO
ALTER TABLE [dbo].[inv_producto]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_inv_producto_tipo] FOREIGN KEY([pro_tipo])
REFERENCES [dbo].[inv_producto_tipo] ([pti_id])
GO
ALTER TABLE [dbo].[inv_producto] CHECK CONSTRAINT [FK_inv_producto_inv_producto_tipo]
GO
ALTER TABLE [dbo].[inv_producto]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_inv_proveedor] FOREIGN KEY([pro_proveedor])
REFERENCES [dbo].[inv_proveedor] ([prv_id])
GO
ALTER TABLE [dbo].[inv_producto] CHECK CONSTRAINT [FK_inv_producto_inv_proveedor]
GO
ALTER TABLE [dbo].[inv_producto]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_inv_unidad_medida] FOREIGN KEY([pro_unidad_medida])
REFERENCES [dbo].[inv_unidad_medida] ([uni_id])
GO
ALTER TABLE [dbo].[inv_producto] CHECK CONSTRAINT [FK_inv_producto_inv_unidad_medida]
GO
ALTER TABLE [dbo].[inv_producto_stock]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_stock_inv_producto] FOREIGN KEY([sto_producto])
REFERENCES [dbo].[inv_producto] ([pro_id])
GO
ALTER TABLE [dbo].[inv_producto_stock] CHECK CONSTRAINT [FK_inv_producto_stock_inv_producto]
GO
ALTER TABLE [dbo].[inv_producto_stock]  WITH CHECK ADD  CONSTRAINT [FK_inv_producto_stock_inv_ubicacion] FOREIGN KEY([sto_ubicacion])
REFERENCES [dbo].[inv_ubicacion] ([ubi_id])
GO
ALTER TABLE [dbo].[inv_producto_stock] CHECK CONSTRAINT [FK_inv_producto_stock_inv_ubicacion]
GO
ALTER TABLE [dbo].[inv_trans_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_trans_detalle_inv_producto] FOREIGN KEY([tde_producto])
REFERENCES [dbo].[inv_producto] ([pro_id])
GO
ALTER TABLE [dbo].[inv_trans_detalle] CHECK CONSTRAINT [FK_inv_trans_detalle_inv_producto]
GO
ALTER TABLE [dbo].[inv_trans_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_trans_detalle_inv_trans] FOREIGN KEY([tde_trans])
REFERENCES [dbo].[inv_trans] ([tra_id])
GO
ALTER TABLE [dbo].[inv_trans_detalle] CHECK CONSTRAINT [FK_inv_trans_detalle_inv_trans]
GO
ALTER TABLE [dbo].[inv_trans_detalle]  WITH CHECK ADD  CONSTRAINT [FK_inv_trans_detalle_inv_ubicacion] FOREIGN KEY([tde_ubicacion])
REFERENCES [dbo].[inv_ubicacion] ([ubi_id])
GO
ALTER TABLE [dbo].[inv_trans_detalle] CHECK CONSTRAINT [FK_inv_trans_detalle_inv_ubicacion]
GO
