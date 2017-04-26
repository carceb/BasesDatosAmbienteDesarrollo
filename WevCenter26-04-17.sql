USE [WebCenter]
GO
/****** Object:  Table [dbo].[EstatusSolicitudServicio]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstatusSolicitudServicio](
	[EstatusSolicitudServicioID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstatusSolicitudServicio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstatusSolicitudServicio] PRIMARY KEY CLUSTERED 
(
	[EstatusSolicitudServicioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EstatusSolicitudServicio] ON
INSERT [dbo].[EstatusSolicitudServicio] ([EstatusSolicitudServicioID], [NombreEstatusSolicitudServicio]) VALUES (1, N'EN COLA')
INSERT [dbo].[EstatusSolicitudServicio] ([EstatusSolicitudServicioID], [NombreEstatusSolicitudServicio]) VALUES (2, N'TECNICO ASIGNADO')
INSERT [dbo].[EstatusSolicitudServicio] ([EstatusSolicitudServicioID], [NombreEstatusSolicitudServicio]) VALUES (3, N'TECNICO TRABAJANDO')
INSERT [dbo].[EstatusSolicitudServicio] ([EstatusSolicitudServicioID], [NombreEstatusSolicitudServicio]) VALUES (4, N'FINALIZADO TECNICO')
INSERT [dbo].[EstatusSolicitudServicio] ([EstatusSolicitudServicioID], [NombreEstatusSolicitudServicio]) VALUES (5, N'FINALIZADO')
SET IDENTITY_INSERT [dbo].[EstatusSolicitudServicio] OFF
/****** Object:  Table [dbo].[AreaServicio]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaServicio](
	[AreaServicioID] [int] IDENTITY(1,1) NOT NULL,
	[NombreAreaServicio] [varchar](150) NOT NULL,
	[EstatusAreaServicio] [varchar](10) NOT NULL,
 CONSTRAINT [PK_AreaServicio] PRIMARY KEY CLUSTERED 
(
	[AreaServicioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AreaServicio] ON
INSERT [dbo].[AreaServicio] ([AreaServicioID], [NombreAreaServicio], [EstatusAreaServicio]) VALUES (1, N'Soporte Técnico', N'Activo')
INSERT [dbo].[AreaServicio] ([AreaServicioID], [NombreAreaServicio], [EstatusAreaServicio]) VALUES (2, N'Administración de Servidores', N'Activo')
INSERT [dbo].[AreaServicio] ([AreaServicioID], [NombreAreaServicio], [EstatusAreaServicio]) VALUES (3, N'Apoyo en Programas de Aplicacion', N'Activo')
INSERT [dbo].[AreaServicio] ([AreaServicioID], [NombreAreaServicio], [EstatusAreaServicio]) VALUES (4, N'Telefonía', N'Activo')
SET IDENTITY_INSERT [dbo].[AreaServicio] OFF
/****** Object:  Table [dbo].[SeguridadObjeto]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeguridadObjeto](
	[SeguridadObjetoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreObjeto] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SeguridadObjeto] PRIMARY KEY CLUSTERED 
(
	[SeguridadObjetoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] ON
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (1, N'Solicitud Apoyo Técnico')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (2, N'Asignación de Apoyo')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (3, N'Actualizar Asignaciones')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (4, N'Cola de Solicitudes')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (5, N'Agregar Personal')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (9, N'Consulta Movimientos')
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] OFF
/****** Object:  Table [dbo].[SeguridadGrupo]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeguridadGrupo](
	[SeguridadGrupoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreGrupo] [varchar](50) NOT NULL,
	[DescripcionGrupo] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SeguridadGrupo] PRIMARY KEY CLUSTERED 
(
	[SeguridadGrupoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] ON
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (1, N'HelpDesk Avanzado', N'Atienden llamdas, asignan casos y establecen estatus')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (2, N'HelpDesk', N'Atienden llamdas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (3, N'Asignar Apoyo', N'Asignan casos y establecen estatus')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (5, N'Tecnicos', N'Actualizan sus estatus')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (6, N'Consultas', N'Solo realizan consultas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (9, N'Opciones Especiales', N'Actualizan tablas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (10, N'ADMINISTRADOR', N'ACCESO A TODO')
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] OFF
/****** Object:  Table [dbo].[Gerencia]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gerencia](
	[GerenciaID] [int] NOT NULL,
	[NombreGerencia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Gerencia] PRIMARY KEY CLUSTERED 
(
	[GerenciaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (1, N'Consejo Directivo')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (2, N'Presidencia')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (3, N'Consultoria Juridica')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (4, N'Relaciones Institucionales')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (5, N'Planificacion y Presupuesto')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (6, N'Oficina de Atencion al Ciudadano')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (7, N'Auditoria Interna')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (8, N'Administracion')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (9, N'Recursos Humanos')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (10, N'Finanzas')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (11, N'Tecnologia de La Informacion')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (13, N'Inversiones Locales')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (14, N'Flota')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (15, N'Pasaje Estudiantil')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (16, N'Programa Vial III')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (17, N'Vivex-Vao')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (29, N'Cobranzas')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (30, N'Peajes')
INSERT [dbo].[Gerencia] ([GerenciaID], [NombreGerencia]) VALUES (31, N'Seguridad y Proteccion Integral')
/****** Object:  Table [dbo].[SeguridadUsuarioDatos]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeguridadUsuarioDatos](
	[SeguridadUsuarioDatosID] [int] IDENTITY(1,1) NOT NULL,
	[LoginUsuario] [varchar](100) NOT NULL,
	[ClaveUsuario] [varchar](100) NOT NULL,
	[NombreCompleto] [varchar](150) NOT NULL,
	[DescripcionUsuario] [varchar](150) NOT NULL,
	[SeguridadGrupoID] [int] NOT NULL,
	[UsuarioTecnico] [bit] NOT NULL,
	[EstatusUsuario] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SeguridadUsuariosDatos] PRIMARY KEY CLUSTERED 
(
	[SeguridadUsuarioDatosID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] ON
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (2, N'Carceb', N'2', N'CARLOS CEBALLOS', N'ADMINISTRADOR', 10, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (4, N'Admin', N'1', N'Administrador', N'Admin', 10, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (5, N'MDTorres', N'1', N'Michael Torres', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (6, N'EPerez', N'1', N'ENYELI PEREZ', N'TECNICO', 1, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (7, N'MMejias', N'1', N'MARIA MEJIAS', N'TECNICO', 2, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (9, N'CCastillo', N'1', N'Cesar Castillo', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (10, N'MJTorres', N'1', N'Morelia Torres', N'Tecnico', 3, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (11, N'EBerlett', N'1', N'Edison Berlett', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (12, N'JSalazar', N'1', N'Javier Salazar', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (13, N'RRodriguez', N'1', N'Ruben Rodriguez', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (14, N'CRios', N'1', N'CARLOS RIOS', N'TECNICO', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (16, N'CPortillo', N'1', N'Cesar Portillo', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (17, N'DGonzalez', N'1', N'Danny Gonzalez', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (18, N'MSsalcedo', N'1', N'Manuel Salcedo', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (19, N'IMedina', N'1', N'Irbym Medina', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (20, N'VPompa', N'1', N'Venancio Pompa', N'Tecnico', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (21, N'Mmaldonado', N'MMaldonado', N'MICHAEL MALDONADO', N'TÉCNICO ', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (22, N'REscalona', N'1', N'ROLANDO ESCALONA', N'TECNICO', 5, 1, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (23, N'GValero', N'5524771', N'GLADYS VALERO', N'SOPORTE', 1, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (24, N'Jquintero', N'1', N'JOSÉ QUINTERO', N'TECNICO', 5, 1, N'Activo')
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] OFF
/****** Object:  Table [dbo].[AreaServicioDetalle]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaServicioDetalle](
	[AreaServicioDetalleID] [int] IDENTITY(1,1) NOT NULL,
	[AreaServicioID] [int] NOT NULL,
	[NombreAreaServicioDetalle] [varchar](200) NOT NULL,
	[EstatusAreaServicioDetalle] [varchar](10) NOT NULL,
 CONSTRAINT [PK_AreaServicioDetalle] PRIMARY KEY CLUSTERED 
(
	[AreaServicioDetalleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AreaServicioDetalle] ON
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (1, 1, N'Configuración de Impresoras', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (2, 1, N'Mantenimiento de Impresoras', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (3, 1, N'Mantenimiento completo de hardware y software', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (5, 1, N'Movimiento de equipos e instalación', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (6, 1, N'Sistema Internos (Instalación, configuración, permisología)', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (8, 1, N'Respaldo Información Usuarios', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (9, 2, N'Servidor de correo', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (11, 2, N'Servidor de autenticacion', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (12, 2, N'Servidores de archivo', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (13, 2, N'Servidores de Bases de Datos', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (14, 2, N'Servidores de Impresoras', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (15, 2, N'Mantenimiento y/o instalación', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (16, 3, N'Asesoria en cuanto a uso de correo', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (17, 3, N'Asesoria en sistemas de oficina (Word, Excel, Power Point Access)', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (19, 3, N'Asesoria en cuanto a uso de internet', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (20, 3, N'Apoyo Sistema SIGA', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (21, 4, N'Operaciones en la Central Teléfonica', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (22, 4, N'Administración Central Telefonica', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (23, 4, N'Cableado Telefonico', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (24, 4, N'Soporte Telefonico (Revisión y/o reparación de accesorios telefonicos)', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (25, 4, N'Permisología de Accesos (DDN, DDC, DDI, DDE, DDL)', N'Activo')
INSERT [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID], [AreaServicioID], [NombreAreaServicioDetalle], [EstatusAreaServicioDetalle]) VALUES (26, 1, N'Conexión a la RED', N'Activo')
SET IDENTITY_INSERT [dbo].[AreaServicioDetalle] OFF
/****** Object:  Table [dbo].[Division]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Division](
	[DivisionID] [int] NOT NULL,
	[GerenciaID] [int] NOT NULL,
	[NombreDivision] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (1, 1, N'Consejo Directivo')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (2, 2, N'Presidencia Ejecutiva')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (3, 3, N'Consultoría Jurídica')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (4, 4, N'Gerencia Relaciones Institucionales')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (5, 5, N'Gerencia Planificación y Presupuesto')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (6, 5, N'Planificación y Estadísticas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (7, 5, N'Organización y Sistemas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (8, 5, N'Control Gestión')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (9, 6, N'Oficina Atención al Ciudadano')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (10, 6, N'Centro Información y Documentación en Transporte')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (11, 6, N'Denuncias y Reclamos')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (12, 7, N'Auditoría Interna')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (13, 7, N'Averiguaciones Administrativas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (14, 7, N'Control Administrativo')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (15, 7, N'Auditoría Técnica y Gestión')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (16, 7, N'Auditoría Financiera')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (17, 7, N'Auditoría Sistemas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (18, 8, N'Gerencia Administración')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (19, 8, N'Presupuesto')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (20, 8, N'Contabilidad')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (21, 8, N'Compras y Suministros')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (22, 8, N'Servicios Generales')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (23, 9, N'Gerencia Recursos Humanos')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (24, 9, N'Programas Técnicos')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (25, 9, N'Programas Administrativos')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (26, 9, N'Bienestar Social')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (27, 9, N'Seguridad y Protección Integral')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (28, 10, N'Gerencia Finanzas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (29, 10, N'Planificación, Análisis y Control Financiero')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (30, 10, N'Seguimiento y Control Licitaciones Externas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (31, 10, N'Tesorería')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (32, 10, N'Gestión Crédito y Cobranza')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (33, 11, N'Gerencia Tecnología La Información')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (34, 11, N'Desarrollo y Mantenimiento Sistemas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (35, 11, N'Soporte Técnico')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (43, 13, N'Gerencia Inversiones Locales')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (44, 13, N'Registro y Control')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (45, 13, N'Estudios')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (46, 13, N'Capacitación y Apoyo Técnico')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (47, 13, N'Convenios')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (48, 14, N'Gerencia Flota')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (49, 14, N'Estudios y Evaluación Técnica')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (50, 14, N'Operativa')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (51, 15, N'Gerencia Pasaje Estudiantil')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (52, 15, N'Subsidio Directo')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (53, 15, N'Subsidio Indirecto')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (54, 15, N'Apoyo a los Estados')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (55, 15, N'Coordinaciones Estados')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (56, 16, N'Gerencia Programa Vial III')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (57, 16, N'Programación y Control')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (58, 16, N'Proyectos e Inversiones')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (59, 16, N'Operaciones Financieras')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (60, 17, N'Gerencia Vivex-Vao')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (61, 17, N'Operaciones')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (62, 17, N'Logística')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (63, 17, N'Radiocomunicaciones')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (66, 29, N'Cobranzas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (67, 29, N'Cartera Créditos')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (68, 29, N'Cobranzas')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (69, 29, N'Seguros')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (71, 30, N'Peajes')
INSERT [dbo].[Division] ([DivisionID], [GerenciaID], [NombreDivision]) VALUES (72, 31, N'Seguridad y Proteccion Integral')
/****** Object:  Table [dbo].[Personal]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[PersonalID] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [int] NOT NULL,
	[NombrePersonal] [varchar](50) NOT NULL,
	[DivisionID] [int] NOT NULL,
	[NumeroExtension] [varchar](12) NOT NULL,
	[EstatusPersonal] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[PersonalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Personal] ON
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3204, 642257, N'JOSE APONTE', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3205, 643362, N'ANSELMO GONZALEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3206, 648491, N'JESUS MERCHAN', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3207, 966695, N'JOSE QUINTERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3208, 1113221, N'EDMUNDO ALVARADO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3209, 1425448, N'ANGEL GOITIA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3210, 1640228, N'RAMON GONZALEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3211, 2148072, N'STANLY NYLANDER', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3212, 2900654, N'IVAN CHACON', 15, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3213, 3059762, N'NORA BETANCOURT', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3214, 3265944, N'CARMEN GUTIERREZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3215, 3365483, N'MANUEL RODRIGUEZ', 61, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3216, 3378727, N'JOSE VALBUENA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3217, 3473586, N'WILFREDO PAZ', 16, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3218, 3508592, N'JESUS CAMPOS', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3219, 3561101, N'RAFAEL OLDENBURG', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3220, 3659800, N'ARISTIDES SALAS', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3221, 3664664, N'ARGENIS MACHADO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3222, 3742201, N'EDUARDO IBARRA', 62, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3223, 3809078, N'JESUS DELGADO', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3224, 3820836, N'LUISA GARCIA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3225, 3869286, N'SAUL MANZANO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3226, 3932036, N'IVAN PEÑA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3227, 3932757, N'PEDRO MARQUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3228, 4051731, N'GILDA GIL', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3229, 4177691, N'NELSON LAGUNA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3230, 4225063, N'CARMEN ARAUJO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3231, 4249572, N'NIDIA GARCIA', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3232, 4327556, N'WILLIAM URDANETA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3233, 4361014, N'HIDEMAR GUEDEZ', 53, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3234, 4388625, N'ZOILA CARRUIDO', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3235, 4431600, N'JOSE LINCON', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3236, 4447078, N'EVELIA LOZADA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3237, 4519114, N'RODOLFO SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3238, 4530642, N'PEDRO PRADO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3239, 4551126, N'CRUZ MOLEIRO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3240, 4559207, N'BLANCA AGUILAR', 68, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3241, 4602427, N'MARCO MEDINA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3242, 4611952, N'SIRIO TORRES', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3243, 4621534, N'NANCY CHACOA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3244, 4679077, N'JESUS LOVERA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3245, 4703297, N'LUIS MATINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3246, 4793582, N'BEDDIER BRETT', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3247, 4817982, N'ARELIS ROJAS', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3248, 4822236, N'LUIS PICHARDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3249, 4826797, N'ALIDES SANTOS', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3250, 4834690, N'NUBIA YERENA', 7, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3251, 4849176, N'ANGEL MORILLO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3252, 4863671, N'JOSE MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3253, 4884986, N'GREGORIO ASKIOGLI', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3254, 5039765, N'RAFAEL SEGOVIA', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3255, 5062604, N'LILIA BARBOZA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3256, 5137367, N'FREDDY BAYONA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3257, 5143658, N'MARIANA HERNANDEZ', 6, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3258, 5150207, N'SIMEON HERNANDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3259, 5152602, N'LUCIA DELGADO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3260, 5157846, N'VICTOR GONZALEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3261, 5166608, N'YALITZA SOTO', 69, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3262, 5167479, N'JORGE SANCHEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3263, 5199372, N'JOSE SANCHEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3264, 5225513, N'YOLLY COROMOTO SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3265, 5235955, N'MAGALI FERNANDEZ', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3266, 5251539, N'REYNA CASTAÑEDA', 47, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3267, 5298161, N'OSCAR RUBIDO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3268, 5307079, N'ELSY RENDILES', 67, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3269, 5315421, N'OMAIRA CASTILLO', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3271, 5405535, N'FLOR ROBLES', 26, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3272, 5410169, N'ZORAIDA BAUTISTA', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3273, 5411947, N'DANNY ALVAREZ', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3274, 5413222, N'MORAYMA LUNA', 29, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3275, 5418508, N'NORARYS PADILLA', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3276, 5516574, N'HORACIO PEREZ', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3277, 5520172, N'BLANCA ZAMBRANO', 17, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3278, 5521596, N'JOSE AGUILERA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3279, 5524771, N'GLADYS VALERO', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3280, 5540003, N'YAJAIRA BLANCO', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3281, 5543746, N'EDGAR DELGADO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3282, 5578706, N'JACOB REYES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3283, 5580641, N'HUGO ORTIZ', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3284, 5580675, N'CRUZ GUERRA', 27, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3286, 5592357, N'CARLOS VASQUEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3287, 5810877, N'BELKIS SANCHEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3288, 5890041, N'ROLANDO CASTILLO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3289, 5937062, N'JUAN PIÑA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3290, 5963805, N'REINALDO LUGO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3291, 6018030, N'SARA MORALES', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3292, 6018347, N'CESAR RAMIREZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3293, 6039739, N'MARIA RODRIGUEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3294, 6044898, N'RICARDO RIVERA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3295, 6054041, N'MARIA ROA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3296, 6076896, N'GLIGIS GUZMAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3297, 6098294, N'WILLIANS ORTIZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3298, 6102379, N'LUCRECIA GUEDEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3299, 6104075, N'MARIA RODRIGUEZ', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3300, 6115903, N'FREDDY MOLINA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3302, 6134332, N'JUAN TORRES', 29, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3303, 6140254, N'JACQUELINE AVENDAÑO', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3304, 6149239, N'JUAN SMITH', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3305, 6161747, N'CIPRIANO SUAREZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3306, 6166118, N'NESTOR GONZALEZ', 18, N'0', N'Activo')
GO
print 'Processed 100 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3307, 6169103, N'YSAIAS PEÑA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3308, 6181777, N'JOSE SAAVEDRA', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3309, 6189791, N'VICTOR VALDERRAMA', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3310, 6190589, N'CARLOS SILVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3311, 6194687, N'ROSA COLMENARES', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3312, 6199607, N'SONIA ROMERO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3313, 6203860, N'BELKIS SAYAGO', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3314, 6204974, N'INES ILARRAZA', 31, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3315, 6213343, N'MIRTHA PEREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3316, 6246170, N'JULIETA SERRANO', 20, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3317, 6252572, N'JOSE PETIT', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3318, 6257720, N'MIRELYS ULLOA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3319, 6261674, N'HAYDEE CLAVIJO', 57, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3320, 6280139, N'NUBIA CAMPOS', 53, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3321, 6300916, N'RICHARD RIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3322, 6301102, N'GRISELDA ORTA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3323, 6302908, N'CESAR JIMENEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3325, 6308158, N'DILIA ACUÑA', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3326, 6313455, N'JUAN LÓPEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3327, 6315609, N'YAIRI LEON', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3328, 6320601, N'WILMER CHACON', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3329, 6322454, N'MARISOL LOPEZ', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3330, 6324990, N'GLAIMAR VIEIRA', 16, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3331, 6325857, N'JOSE OJEDA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3332, 6327419, N'ROSA HURTADO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3333, 6332182, N'JUDITH SALAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3334, 6336686, N'EVELIA ROJAS', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3335, 6336755, N'RAMON ROMAN', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3336, 6338961, N'ALFREDO VALERA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3337, 6348727, N'KEYLA VELASQUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3338, 6348740, N'SABINA ALVAREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3339, 6354164, N'ZENAIDA HERNANDEZ', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3340, 6354353, N'ZULAY HERNANDEZ', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3341, 6354581, N'AUGUSTO PEÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3342, 6355680, N'BELINDA FERNANDEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3343, 6361852, N'ABRAHAM LARA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3344, 6364758, N'JOSE MARRERO', 27, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3345, 6396426, N'HENRY VILLEGAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3346, 6399052, N'ADRIAN ILARRAZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3347, 6402781, N'FORTUNATO COLAUTTI', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3348, 6412618, N'MARIO MARTINEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3349, 6414853, N'EDGAR TORREALBA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3350, 6425680, N'DIOVA MARQUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3351, 6432161, N'TIBISAY RAMIREZ', 49, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3352, 6432899, N'NESTOR CHACON', 47, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3353, 6438375, N'ENEIDA MARVAL', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3354, 6466031, N'ALMA LEON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3355, 6484516, N'JOSE MALAVE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3356, 6498683, N'GLENDA CRUZCO', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3357, 6501139, N'ANGEL GONZALEZ', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3358, 6544637, N'ZAMARI MORENO', 69, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3359, 6553375, N'DANNYS MARTINEZ', 67, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3361, 6643384, N'CESAR BRITO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3362, 6698467, N'GLADYS HURTADO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3363, 6727473, N'DALITZA PALACIO', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3364, 6748355, N'ODRILYS PAREDES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3365, 6801899, N'NEIRO LEDEZMA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3366, 6830199, N'CLAUDIO CUBILLAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3367, 6841037, N'JOSE LIENDO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3368, 6865061, N'HAYDEE ALVAREZ', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3369, 6866730, N'JEANNETTE STRAUSS', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3370, 6867747, N'DIMAS VERASMENDI', 57, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3371, 6868924, N'YOLANDA DI SEVO', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3372, 6869745, N'LEIDYS MENDOZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3373, 6876691, N'CARMEN UZCATEGUI', 44, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3374, 6890248, N'EDUARDO CAMACHO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3375, 6895274, N'ERMELINDA HERNANDEZ', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3376, 6897007, N'VIOLETA GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3377, 6898233, N'REBECA MOLINA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3378, 6902245, N'ADRIAN CALDERON', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3379, 6905164, N'JOSE MELO', 27, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3380, 6905726, N'ANTONIA CASTILLO', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3381, 6905727, N'MANUELA VARGAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3382, 6908746, N'ANGEL CABRERA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3383, 6926535, N'JUAN MURIA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3384, 6963105, N'BEATRIZ LOBO', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3385, 6965312, N'FLOR ALVIAREZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3386, 6968068, N'FRANK RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3387, 6969208, N'LIZET NAVAS', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3388, 6969248, N'MARIA VALLEJOS', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3389, 6992490, N'LUIS SILVA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3390, 7027906, N'ERNESTA BORGES', 29, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3391, 7057192, N'IRIS GRATEROL', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3392, 7063700, N'PABLO MATA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3393, 7098425, N'MARIBEL ROMAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3394, 7159543, N'NUMAN HERNANDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3395, 7164719, N'ARESBI MORGADO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3396, 7169806, N'CESAR ALVAREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3397, 7191859, N'RAFAEL ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3398, 7202035, N'ROBERTO LARA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3399, 7221665, N'MAXIMILIANO IRIZA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3400, 7224322, N'CARLOS ROA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3401, 7229899, N'JOSE SANCHEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3402, 7241683, N'CESAR VASQUEZ', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3403, 7249920, N'JESUS MARTINEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3404, 7276523, N'DAMELYS ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3405, 7303394, N'NATIVIDAD SEQUERA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3406, 7324788, N'MARIO ZAPATA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3407, 7398089, N'ALBA COLMENAREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3408, 7402353, N'WILLIS DIAZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3409, 7488851, N'JHONNY GARMENDIA', 23, N'0', N'Activo')
GO
print 'Processed 200 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3410, 7573047, N'CARMEN ARES', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3411, 7587025, N'JOSE CHAVEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3412, 7589917, N'JOSE LUCENA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3413, 7611930, N'MERVIN RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3414, 7660251, N'SORAIDA ALBORNOZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3415, 7684817, N'CESAR CASTILLO', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3416, 7726564, N'ENDER MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3417, 7816687, N'HECTOR PINEDA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3418, 7822966, N'JOSE PIÑERO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3419, 7831515, N'ANTONIO MOLINA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3420, 7869718, N'JOSE MAS Y RUBI', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3421, 7884151, N'LUCIA BARRIOS', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3422, 7925526, N'OSWALDO HERNANDEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3423, 7929268, N'RUBEN CARRILLO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3424, 7929371, N'MIRALLY FIGUERA', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3425, 7942205, N'OMAR GARCIA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3426, 7943550, N'JHONNY RAMOS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3427, 7951656, N'MILAGROS OROPEZA', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3428, 7958193, N'GRACIELA GUSMAN', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3429, 7958658, N'SONIA ZAMBRANO', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3430, 7959053, N'ANGELA LEAL', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3431, 7962764, N'FRANKLIN LUJANO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3432, 7965295, N'NILSON CARIDAD', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3433, 8002304, N'MARIA PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3434, 8013085, N'MARIA VERGARA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3435, 8025004, N'CARMEN PEREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3436, 8046478, N'ROSA CALDERON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3437, 8103912, N'HUGO ARIAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3438, 8161791, N'TULIO RUIZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3439, 8307998, N'JUAN RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3440, 8379535, N'RENNY MEDINA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3441, 8418250, N'JOSE RAMIREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3443, 8480858, N'ANTONIO MENESES', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3444, 8508946, N'RICHARD FINOL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3445, 8550411, N'CARLOS JURADO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3446, 8575584, N'ZAIDA AMAYA', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3447, 8584590, N'ANGEL ZAPATA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3448, 8609849, N'CARMEN FIGUEREDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3449, 8623580, N'ABRAHAN LOPEZ', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3450, 8631866, N'LUIS CASTILLO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3451, 8654796, N'MARIO RUIZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3452, 8661782, N'ZOILO SANCHEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3453, 8679344, N'DEISY GALIPOLLI', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3454, 8703114, N'LUCIDIO FLORES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3455, 8706779, N'ORLANDO PEREIRA', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3456, 8719398, N'MORELIA TORRES', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3457, 8722999, N'ALBA TROMPETERO', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3458, 8732274, N'JOSE MORA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3459, 8744626, N'CARLOS RAMIREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3460, 8762306, N'FIDIAS HURTADO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3461, 8776228, N'YANET BELLO', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3462, 8789003, N'ISABEL TOLEDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3463, 8795569, N'ADRIANA RUIZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3464, 8795979, N'EMILIA MENDEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3465, 8807695, N'SANDRA RON', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3466, 8929358, N'LEONEL MEZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3467, 8929792, N'JOSE REINA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3468, 8953745, N'YOEL YANEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3469, 8980830, N'PEDRO FUENTES', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3470, 8998778, N'ALVARO BARROSO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3471, 9004988, N'ANTONIO VILLARREAL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3472, 9045310, N'MILIDA CASTILLO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3473, 9052357, N'NIBARDO GUTIERREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3474, 9064067, N'CARLOS HERNANDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3475, 9096429, N'WILFREDO FLORES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3476, 9145396, N'JESUS CAMARGO', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3477, 9159527, N'VILMA LOPÈZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3478, 9222596, N'LUIS BOSCAN', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3479, 9237223, N'JANYE VIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3480, 9260296, N'CARLOS RAMIREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3481, 9329257, N'EDUARDO CASTELLANOS', 68, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3482, 9348891, N'ELISA COLMENARES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3483, 9415376, N'PINA SICA', 67, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3484, 9418336, N'ESTHER RUEDA', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3485, 9431613, N'AUDREY MONTES DE OCA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3486, 9435991, N'MARIBEL ROMERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3487, 9437860, N'HENRY UTRERA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3488, 9462970, N'NESTOR CONTRERAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3489, 9470273, N'CARMEN OSORIO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3490, 9484058, N'MAGDA LOPEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3491, 9484302, N'ANGELA GONZALEZ', 53, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3492, 9487105, N'GLORIS DIAZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3493, 9493613, N'ANABEL LOZADA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3494, 9493911, N'BELKYS LOPEZ', 49, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3495, 9504493, N'FRANK CUAURO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3496, 9520874, N'FRANK GARCIA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3497, 9524036, N'ANTONIO RUIZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3498, 9524318, N'PAIS CAMACHO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3499, 9546720, N'MARIA MEJIAS', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3500, 9561131, N'ALEXIS LINARES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3501, 9563240, N'YSMAEL MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3502, 9629038, N'SABINO ALEJO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3503, 9657281, N'MORAIMA HERNANDEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3504, 9662454, N'EUCLIDES GONZALEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3505, 9667269, N'JOSE SOTERAN', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3506, 9675383, N'ALEXANDRA MONTES DE OCA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3507, 9694866, N'YULIMAR GADEA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3508, 9710077, N'YOLANDA MORENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3509, 9803304, N'ROXINA RIVAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3510, 9817045, N'RAMON ARREAZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3511, 9817466, N'YURBELIA LA ROSA', 51, N'0', N'Activo')
GO
print 'Processed 300 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3512, 9822543, N'MAGALYS HEREDIA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3513, 9839546, N'CESAR CAMPOS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3514, 9839928, N'JOSE RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3515, 9878110, N'MIRLA TORRES', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3516, 9884727, N'ROSA ADAMES', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3517, 9890874, N'MIGUEL VASQUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3518, 9897426, N'JACQUELINE PADRON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3519, 9928777, N'JANETH MEDINA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3520, 9930114, N'VLADIMIR SANDOVAL', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3521, 9955256, N'ALI MALDONADO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3522, 9956028, N'IRAMA MENDOZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3523, 9964740, N'MARILU CEDEÑO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3524, 9971278, N'RODOLFO D´CESARE', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3525, 9974793, N'MARIA GARCIA', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3526, 9981485, N'CELESTINO SALGADO', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3527, 10039627, N'VICTOR BRICEÑO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3528, 10057563, N'PABLO JUSTO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3529, 10074870, N'PABLA GONZALEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3530, 10084420, N'LUIS OCANDO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3531, 10100287, N'JOSE RONDON', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3532, 10101471, N'CESAR CONTRERAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3533, 10104721, N'LEYMA AVILA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3534, 10106062, N'OMAIRA BAPTISTA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3535, 10108224, N'JESUS BRICEÑO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3536, 10111354, N'INDIRA PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3537, 10113141, N'JOSE GRANADO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3538, 10125546, N'YAMILET PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3539, 10151574, N'MIGUEL ALVAREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3540, 10178071, N'YVELYN ROSALES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3541, 10186912, N'CESAR ARIAS', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3542, 10218739, N'JUAN MARTINEZ', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3543, 10236670, N'SERGIO PIRELA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3544, 10257690, N'MIREYA TERAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3545, 10265352, N'ALECIA APONTE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3546, 10267722, N'VICTOR UVIEDA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3547, 10283051, N'DORIS AVILAN', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3548, 10287028, N'OMAR OCHOA', 17, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3549, 10287603, N'FRANCISCO GOMEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3550, 10353646, N'LEIDYS CARBALLO', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3551, 10358864, N'WILLIAMS ARANDA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3552, 10363720, N'ELIANA REYES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3553, 10369009, N'MAILYSABEL HERRERA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3554, 10381010, N'MAYERLING TERAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3555, 10383447, N'GASTON MORALES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3556, 10383988, N'HUMBERTO GALINDO', 50, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3557, 10412688, N'REGULO BOSCAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3558, 10415310, N'ALEXIS VILLAMIZAR', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3559, 10423989, N'JOSE CAICEDO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3560, 10454908, N'MICHEL RIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3561, 10456391, N'YSMAEL BOLIVAR', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3562, 10467506, N'MIRIAN FIGUEROA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3563, 10471612, N'KETTY NAVARRO', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3564, 10471926, N'ZENAIDA BASTIDAS', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3565, 10473048, N'JENNY HIDALGO', 67, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3566, 10473914, N'CARMEN ACOSTA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3567, 10480734, N'YENNYS OLIVARES', 69, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3568, 10484406, N'REBECA SILVA', 68, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3569, 10485903, N'JOSE QUINTERO', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3570, 10489460, N'MELISA PALOMERAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3571, 10502576, N'JENNY BRAVO', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3572, 10507623, N'MARIA YARAURE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3573, 10513123, N'ROSA RODRIGUEZ', 68, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3574, 10517188, N'ROSA NAVA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3575, 10517386, N'CESAR TEJADA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3576, 10517644, N'DAVID BLANCO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3577, 10519994, N'MARIA MISTRE', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3578, 10520335, N'RAHIL LINARES', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3579, 10530364, N'CARLOS CEBALLOS', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3580, 10531045, N'SONIA SANTARELLI', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3581, 10542099, N'JOSE PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3582, 10543022, N'NILOA CASTRO', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3583, 10559752, N'MARLON CRESPO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3584, 10581436, N'YORLAY URIBE', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3585, 10603835, N'DUBAN BLANCO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3586, 10627111, N'CARLOS RIVERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3587, 10632562, N'LUIS VALECILLOS', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3588, 10638700, N'MILTON RAMOS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3589, 10683875, N'MARITZA OCHOA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3590, 10686563, N'EDEBERTO RINCON', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3591, 10701621, N'ALI GUERRA', 27, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3592, 10701694, N'ELVIS MEDINA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3593, 10728471, N'YENIS LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3594, 10728740, N'OMAR TORRES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3595, 10761221, N'FREDDY SUAREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3596, 10761892, N'HENRY PAEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3597, 10765350, N'OMAR SUAREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3598, 10775887, N'RAFAEL DE LA ROSA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3599, 10784471, N'GLENNYS CARBALLO', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3600, 10789503, N'YAMIRA ESPINOZA', 49, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3601, 10794811, N'FERMIN IRIARTE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3602, 10798368, N'EDWIN REYES', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3603, 10799949, N'JUDITH FONSECA', 20, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3604, 10804392, N'EGLIS MARIA OLIVEROS', 68, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3605, 10807555, N'JACQUELINE ROMERO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3606, 10810038, N'YUHIRY GUTIERREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3607, 10817832, N'LILIANA MARTINEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3608, 10826123, N'DOUGLAS SUAREZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3609, 10826429, N'NUBIA SANTOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3610, 10826971, N'LOURDES GONZALEZ', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3611, 10828751, N'YENECIA NORIEGA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3612, 10865558, N'ANTONIO CAZORLA', 14, N'0', N'Activo')
GO
print 'Processed 400 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3613, 10877200, N'NANCY LARRIBA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3614, 10883913, N'LAURA GARDIE', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3615, 10894783, N'MIRIAMS RIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3616, 10897091, N'SONIA MENDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3617, 10919276, N'GUADALUPE MENDOZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3618, 10973963, N'YRMA COELLO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3619, 10976545, N'DUBRASKA DIAZ', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3620, 10982070, N'RICHARD LARA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3621, 10990277, N'JESUS VEGAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3622, 11030163, N'JESUS ORTIZ', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3623, 11032681, N'REINALDO RIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3624, 11044622, N'ANA RENGIFO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3625, 11046948, N'ERASMO HERRERA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3626, 11049771, N'ERNESTO RAMOS', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3627, 11059275, N'NORKA OLIVARES', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3628, 11090225, N'MAIGUALIDA GUEVARA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3629, 11092181, N'JOEL SILVA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3630, 11097313, N'RODOLFO LORMOS', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3631, 11102159, N'KARINA BARRETO', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3632, 11107695, N'LEONARDO MORILLO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3633, 11117864, N'ANA RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3634, 11130431, N'SOLEDAD HERRERA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3635, 11159508, N'FRANKLIN SANCHEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3636, 11164510, N'LEONARDO BITTAR', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3637, 11164853, N'FELIPE PINO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3638, 11165463, N'ARELYS LOBO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3639, 11196430, N'LEONARDO AFANADOR', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3640, 11199056, N'JOSE ECHEVERRIA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3641, 11201542, N'NAYIBE ZAMBRANO', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3642, 11204187, N'CARLOS TEJERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3643, 11204298, N'UBALDO HENRIQUEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3644, 11231773, N'GUSTAVO BLANCO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3645, 11246526, N'OCTAVIO MATERANO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3646, 11248850, N'JOSE ALASTRE', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3647, 11265649, N'LUIS STEELHEART', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3648, 11280038, N'PATRIZIA PETRILLI', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3649, 11280784, N'JANETH CASTELLANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3650, 11291261, N'EDIXON SOTO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3651, 11316388, N'JOAN DURAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3652, 11348914, N'GABRIELA ESPINOZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3653, 11357498, N'ALFREDO VIVES', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3654, 11361745, N'EUSEBIO DELGADO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3655, 11407151, N'JOEL ACOSTA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3656, 11408643, N'ERIKA LANDAETA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3657, 11411373, N'ROSA MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3658, 11414909, N'AURA GUTIERREZ', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3659, 11419557, N'LUIS GARBAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3660, 11427824, N'LUCY MAITA', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3661, 11438488, N'HAIDEE ALCANTARA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3662, 11446288, N'YOHENY CARIPE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3663, 11460468, N'LUIS SOTO', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3664, 11466780, N'AURA MATUTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3665, 11477797, N'LILIA RAMOS', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3666, 11550609, N'DANNY MENDOZA', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3667, 11556192, N'VENANCIO POMPA', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3668, 11556962, N'CAROL GRANDA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3669, 11561697, N'NELSON GIL', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3670, 11567774, N'SOLIMAR FREITES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3671, 11568954, N'MARIA RODRIGUEZ', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3672, 11590710, N'YEAMPOOL DUQUE', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3673, 11599666, N'MANUEL SIFUENTES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3674, 11612714, N'GILBERTO ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3675, 11639618, N'FRANCISCO SALAZAR', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3676, 11639868, N'JOSE DENIS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3677, 11640301, N'MAYRA LOPEZ', 47, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3678, 11641517, N'LIZNEIDY GOMEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3679, 11641793, N'PEDRO LUGO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3680, 11665887, N'NEIRY BENITEZ', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3681, 11668753, N'ZURAMERICA AGUILAR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3682, 11675050, N'WILLIAMS ARRECHEDERA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3683, 11681383, N'ELIZABETH VILLEGAS', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3684, 11683237, N'YULMAY CORREA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3685, 11690179, N'ALEXANDRA BORGES', 50, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3686, 11690196, N'NANCY FUENTES', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3687, 11690579, N'JOAN MORENO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3688, 11735548, N'JUAN CARRILLO', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3689, 11740118, N'EDUARD HERRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3690, 11743831, N'ELIANA QUINTERO', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3691, 11771000, N'YSORMA RIVAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3692, 11779948, N'SONIA RIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3693, 11818386, N'YLENIA SULBARAN', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3694, 11828095, N'ROSALINDA DEL CASTILLO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3695, 11835074, N'GERMAN MORALES', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3696, 11848897, N'SONIA PICHARDO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3697, 11851868, N'LUIS OROPEZA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3698, 11867188, N'MARIBEL PIRELA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3699, 11884142, N'FERNANDO PAZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3700, 11886791, N'HEBERTO ACOSTA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3701, 11891623, N'DIONISIO GARCIA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3702, 11897630, N'CARLOS PADILLA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3703, 11913211, N'LILIANA CARRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3704, 11924746, N'JACKELINE VARGAS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3705, 11929123, N'GLEVIS ALBORNOZ', 53, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3707, 11938472, N'NEUBY BERROTERAN', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3708, 11940714, N'EDWARD GUTIERREZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3709, 11948227, N'EDIXON COLMENARES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3710, 11954876, N'ANA MARQUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3711, 11966228, N'SANDRA MUJICA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3712, 11968263, N'PEDRO ORTEGA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3713, 11977538, N'DAISY CASTILLO', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3714, 11993161, N'JUAN LEMUS', 55, N'0', N'Activo')
GO
print 'Processed 500 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3715, 11995682, N'CONSUELO MANRIQUE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3716, 12039977, N'GLAYDE RIVERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3717, 12045690, N'CLAUDIA CONTRERAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3718, 12045708, N'ALBA LOPEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3719, 12056953, N'DENNIS QUINTERO', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3720, 12066529, N'ADRIANA MONTES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3721, 12071444, N'DESIREE CABRERA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3722, 12076432, N'JOSE ORTEGA', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3723, 12080505, N'EVERLYS GIMENEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3724, 12091242, N'MARY SILVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3725, 12096258, N'WILLIAM GONZALEZ', 13, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3726, 12096328, N'HARRY GUERRERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3727, 12096922, N'OSCAR REYES', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3728, 12106083, N'LENIS CARDENAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3729, 12112198, N'ANA VASQUEZ', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3730, 12116471, N'CARLOS RUIZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3731, 12133886, N'MARIA CHACON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3732, 12136062, N'CELIMARY OCHOA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3733, 12157621, N'KARIN SERRANO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3734, 12159205, N'YUBISAY HERNANDEZ', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3735, 12161933, N'JOSE VELASQUEZ', 44, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3736, 12163551, N'OMARILIS CARIEL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3737, 12166110, N'MARY TOVAR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3738, 12175058, N'ELVIS GONZALEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3739, 12212675, N'EVER RIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3740, 12212847, N'DARWIN QUINTERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3741, 12213236, N'PEDRO GUERRA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3742, 12215127, N'CRUZ INDRIAGO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3743, 12224278, N'ARAIBEL SALAZAR', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3744, 12245122, N'YAJAIRA JIMENEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3745, 12250936, N'GILBERTO GIL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3746, 12253778, N'MARIA PEÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3747, 12259622, N'RICHARD BRIZUELA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3748, 12265539, N'CELIDA BALDALLO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3749, 12270847, N'RICEIDA RAMIREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3750, 12280185, N'NAIROBI DURAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3751, 12280634, N'ANNELYS GARRIDO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3752, 12295122, N'JUAN VERA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3753, 12301312, N'JOSE BLANCO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3754, 12301416, N'OBDALIS RODRIGUEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3755, 12348033, N'JESUS RIVERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3756, 12350801, N'RAMON DELGADO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3757, 12356458, N'TANIA OSORIO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3758, 12356570, N'GREGORIA MADERA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3759, 12362032, N'CELIA GONZALEZ', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3760, 12391073, N'BEATRIZ OTERO', 16, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3761, 12393896, N'YEANINNE ESPAÑA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3762, 12398246, N'WUILMER PINTO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3763, 12434197, N'GLORIA DURAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3764, 12445848, N'ENRIQUE RAGA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3765, 12449186, N'ORMIDA ALVAREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3766, 12465978, N'NERIO SANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3767, 12470246, N'JOSE MEDINA', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3768, 12480648, N'GREGSILET ALEMAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3769, 12483717, N'ASDRUBAL YBARRA', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3770, 12485932, N'REGINO PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3771, 12501787, N'CARLOS GRANADO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3772, 12511856, N'HECTOR RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3773, 12521589, N'FRANCISCO MORENO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3774, 12562878, N'ROCIO LEON', 14, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3775, 12571215, N'ANDY MOHAMMED', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3776, 12584932, N'YESTER CASTILLO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3777, 12586423, N'ANTONIO ESPINOZA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3778, 12593199, N'ROSA COLMENARES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3779, 12625003, N'MARY MOSQUERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3780, 12628381, N'YENNY DIAZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3781, 12634005, N'JEFFERSON PAEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3782, 12641749, N'DANIELE RECCARDO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3783, 12655052, N'YUDITH CONTRERAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3784, 12664315, N'ENGELS GOMEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3785, 12694775, N'MARIA RAMIREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3786, 12700748, N'MIGUEL GOZAINE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3787, 12707624, N'CAROLE MOLINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3788, 12719715, N'MARISAGLEHTT SANTOS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3789, 12721221, N'NORELYS ROJAS', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3790, 12722001, N'ROCIO ESPINETTY', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3791, 12744270, N'ELIS NAL', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3792, 12761438, N'KARLA MORA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3793, 12761773, N'JHONNY RAMIREZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3794, 12761838, N'RAQUEL LUCERO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3795, 12768656, N'MANUEL GRINZONES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3796, 12780777, N'CLARITZA PACHECO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3797, 12784826, N'NORKYS CALDERAS', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3798, 12785680, N'ZOIKLER MONSALVE', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3799, 12785884, N'YDEQUI GONZALEZ', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3800, 12805835, N'NIUWMAN FUENMAYOR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3801, 12809486, N'MARIA GALINDO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3802, 12820901, N'MILANGELLY BLANCA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3803, 12825349, N'FRANK MARQUINA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3804, 12832214, N'ENYELI PEREZ', 35, N'332', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3805, 12842722, N'ANA GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3806, 12845311, N'HENDRIX GONZALEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3807, 12874819, N'CARLOS GONZALEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3808, 12881540, N'MIGUEL TOTESAUT', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3809, 12902404, N'ANA CORTEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3810, 12917815, N'JEAN GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3811, 12935757, N'FLORANGEL YEPEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3812, 12944467, N'MARIA PIÑA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3813, 12944834, N'CARMEN ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3814, 12950512, N'TIBISAY HERNANDEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3815, 12951446, N'DANNELLYS TORCAT', 55, N'0', N'Activo')
GO
print 'Processed 600 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3816, 12953867, N'VIRMARTE DA SILVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3817, 12959922, N'MERLY FERRER', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3818, 12995741, N'RAMON SANCHEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3819, 13005368, N'ADRIANA MARTINEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3820, 13025610, N'JUAN RAMOS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3821, 13039244, N'JOSE ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3822, 13041565, N'ROGER YEPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3823, 13042621, N'KARINA ROMERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3824, 13043432, N'MIGUEL DAVILA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3825, 13046531, N'CAROLINA SILVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3826, 13067865, N'YULEIMA PEREZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3827, 13073429, N'NAUDY CORDERO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3828, 13087733, N'ADOLFO VALERO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3829, 13098691, N'VICTOR BETANCOURT', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3830, 13105671, N'BENITO CEPEDES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3831, 13107958, N'NUREIBYS ACOSTA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3832, 13114543, N'JONATHAN MOLINA', 10, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3833, 13125183, N'SAHILY SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3834, 13126487, N'LUIS HEVIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3835, 13127792, N'JOSE LOPEZ', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3836, 13127837, N'MIGUEL RODRIGUEZ', 27, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3837, 13134517, N'WILLIS GONZALEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3838, 13143408, N'VICTOR URIEPERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3839, 13145561, N'JEFFERSON CAMPEROS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3840, 13146336, N'JOHAN GUERRA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3841, 13158718, N'KARIN CARDENAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3842, 13161037, N'WUENDY AÑANGUREN', 58, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3843, 13177373, N'JOSE RONDON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3844, 13186150, N'EDWING VILLAMIZAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3845, 13201812, N'ADRIANA AGREDA', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3846, 13208745, N'NEPTALI ROBERTIS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3847, 13225689, N'MAIBA FIGUEROA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3848, 13231380, N'NEYDA VILLARREAL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3849, 13246376, N'HECTOR CONTRERAS', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3850, 13248617, N'JESUS DIAZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3851, 13260546, N'MARBELLA VALERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3852, 13270567, N'MARBELIS BETANCOURT', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3853, 13272845, N'HEGGLY ESQUEDA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3854, 13287679, N'JERSON ASCANIO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3855, 13295735, N'ADRIANA COVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3856, 13296445, N'VICTOR MELENDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3857, 13307539, N'JOSE GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3858, 13311559, N'YUSMARY SANZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3859, 13324656, N'IBELIS ALVARADO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3860, 13328363, N'WILMER BADILLO', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3861, 13363656, N'ISAEL GUTIERREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3862, 13417609, N'JULIO LEON', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3863, 13444685, N'ALFREDO MENDOZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3864, 13448066, N'DAYSIS VEGAS', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3865, 13458453, N'IRAUNY ISTURIZ', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3866, 13459650, N'LINDY MARTINEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3867, 13465909, N'NINOSKA AZUAJE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3868, 13467329, N'CARMEN DURAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3869, 13479637, N'RUBEN RODRIGUEZ', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3870, 13483513, N'JAKSON FLORES', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3871, 13493667, N'INGRID NAVAS', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3872, 13494208, N'IVAN GUERRA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3873, 13494219, N'ARLEN ROJAS', 57, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3874, 13522566, N'YHEIZZI CARMONA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3875, 13522928, N'YRAIMA RAMIREZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3876, 13528723, N'YENITZA MARIN', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3877, 13531859, N'MANUEL SALCEDO', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3878, 13557185, N'FRANCISCO RAMIREZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3879, 13568742, N'EDUARDO TORRES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3880, 13583603, N'WILMER IBARRA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3881, 13599697, N'ARELYS JAUREGUI', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3882, 13602517, N'ROSA LISCANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3883, 13615159, N'ISILOR OROZCO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3884, 13615498, N'GUSTAVO GONZALEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3885, 13621791, N'MARIA REQUENA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3886, 13628220, N'NILSON RINCON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3887, 13629247, N'KRISTELTHEYKEL SANDOVAL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3888, 13632618, N'YENNY GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3889, 13639698, N'DEGSI ABANO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3890, 13646040, N'JENNY OLMEDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3891, 13659921, N'HEBERTO SANDREA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3892, 13660038, N'ROMULO CUENCAS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3893, 13661646, N'EDWIN GUERRERO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3894, 13686411, N'JANE ESTRELLA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3895, 13691728, N'KATIUSKA RODRIGUEZ', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3896, 13703589, N'ALEXIS PEÑA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3897, 13709303, N'VICTOR SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3898, 13721091, N'JACKSON LOPEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3899, 13726389, N'YULIMAR PEÑA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3900, 13731863, N'ARGENIS LOZADA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3901, 13734893, N'ANDRES PEREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3902, 13735387, N'NOMARYS PARAQUEIMO', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3903, 13743275, N'MIGUEL RODRIGUEZ', 50, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3904, 13749638, N'JUAN MEJIAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3905, 13783103, N'MIGUEL BARRIOS', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3906, 13792906, N'CESAR SANTIAGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3907, 13803851, N'JECENIA TREJO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3908, 13804340, N'JOSE HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3909, 13823951, N'MARIA GOMEZ', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3910, 13843921, N'WILMER ORELLANA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3911, 13844182, N'ARY LUGO', 50, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3912, 13851110, N'YONAL TORRES', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3913, 13852138, N'YOLISET MARIN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3914, 13853671, N'VICTOR PINO', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3915, 13863015, N'NELSON SOTO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3916, 13865290, N'EDGAR ROJAS', 43, N'0', N'Activo')
GO
print 'Processed 700 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3917, 13865797, N'JUNIOR BARRETO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3918, 13884518, N'RONNY MARCANO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3919, 13898415, N'JESUS RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3920, 13901131, N'JULIO GARCIA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3921, 13903896, N'JOHN MARIN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3922, 13910415, N'JORGE CRESPO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3923, 13930743, N'JOSE HERRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3924, 13930994, N'MIGUEL NUÑEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3925, 13934229, N'JOSEFERMIN RIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3926, 13945781, N'LEONEL BARRETO', 69, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3927, 13955811, N'YURELVIS OLIVEROS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3928, 13967256, N'VICTOR FLORES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3929, 13968143, N'ANLIYET MORENO', 50, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3930, 13968298, N'TERESA POSLIGUA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3931, 13968918, N'YESENIA ROMERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3932, 13971108, N'ELVIS PAEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3933, 13979691, N'JENNIFER OSORIO', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3934, 13979692, N'CARLOS RIOS', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3935, 14003704, N'WILLMAR SANCHEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3936, 14012051, N'ANY LOPEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3937, 14014772, N'JOHANA GARCIA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3938, 14015030, N'YOSMAR GUERRERO', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3939, 14049769, N'RINA MONTES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3940, 14055222, N'MARIA OBANDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3941, 14056354, N'BEDA ORTEGA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3942, 14100596, N'MAYRA VELASCO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3943, 14102323, N'JULIO MORFFE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3944, 14104340, N'KERVIN ESCALONA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3945, 14127092, N'JESUS PEÑA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3946, 14140139, N'MARYURIE HERNANDEZ', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3947, 14140175, N'JOSE CONTRERAS', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3948, 14148516, N'IRALY PIRELA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3949, 14154283, N'VICTOR MORALES', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3950, 14154835, N'MAGDELIZ CHACOA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3951, 14161484, N'NORBIS TORRES', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3952, 14168138, N'MAIGUALIDA KELLY', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3953, 14190988, N'HEDERHT CORDOVA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3954, 14195383, N'BONIFACIO RIVERA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3955, 14197304, N'WILMER RONDON', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3956, 14208909, N'YOMAR ROA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3957, 14216096, N'JIMMY OLIVARES', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3958, 14225602, N'MANUEL DIAZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3959, 14231547, N'ARGELIS GONZALEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3960, 14238186, N'DENISS HERRERA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3961, 14242455, N'ALEXANDER SANCHEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3962, 14252103, N'RAMON HENRIQUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3963, 14269001, N'YULIS GODOY', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3964, 14274751, N'KENYA PEREZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3965, 14280668, N'ENDER BARROSO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3966, 14295803, N'ANDREW RUIZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3967, 14296782, N'LINOMAR MENDOZA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3968, 14299274, N'CARMEN HALL', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3969, 14322469, N'NELIDA SUBDIAGA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3970, 14323537, N'ALFREDO MARTINEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3971, 14323853, N'YENIFER TERAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3972, 14355433, N'ENRIQUE DELGADO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3973, 14355465, N'HABIUT ALVAREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3974, 14372188, N'JOSE PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3975, 14379651, N'OSLEIDY LUGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3976, 14389527, N'GEBER HEREDIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3977, 14390949, N'ERNESTO IZAGUIRRE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3978, 14394395, N'GIULIANGELA REQUENA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3979, 14400123, N'MAYRA SOSA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3980, 14400933, N'FRANKLIN ROMERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3981, 14406489, N'OSCAR BENITEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3982, 14446183, N'JUANCARLO PARADAS', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3983, 14447615, N'NORALBA SALAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3984, 14458209, N'FRANKLIN ESCOBAR', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3985, 14460413, N'JERLINA BRICEÑO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3986, 14463448, N'MARTHA QUINTANA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3987, 14469331, N'ADRIANA PEREDA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3988, 14478682, N'JESUS LUGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3989, 14479381, N'CLAUDIA MEDINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3990, 14492096, N'NELSON MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3991, 14492097, N'RODOLFO MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3992, 14494750, N'NELSON SANCHEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3993, 14495912, N'ANA PULIDO', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3994, 14499221, N'ROSMALY RIVAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3995, 14506613, N'VICTOR SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3996, 14513079, N'ROSA PARTIDAS', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3997, 14527479, N'ADRIANA VERGARA', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3998, 14541945, N'YASMILI GIL', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (3999, 14547927, N'IRENE HERRERA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4000, 14548157, N'NELSON MARQUEZ', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4001, 14553777, N'ANA SILVEIRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4002, 14556348, N'MARIELENA TERAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4003, 14569758, N'NOELIA RIVAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4004, 14573512, N'HAROLD MONTILLA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4005, 14581610, N'LUIS FUENMAYOR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4006, 14583212, N'JORGE PARICA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4007, 14624163, N'MARIUGENIA PALACIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4008, 14666840, N'ISRAEL MEJIAS', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4009, 14684199, N'ERIKA BARRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4010, 14686290, N'MARIA SALAZAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4011, 14689954, N'JEAN ZANELLA', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4012, 14700430, N'CARMEN ROJAS', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4013, 14717172, N'ROSMELYS SALAZAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4015, 14757755, N'JULIO LUGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4016, 14772924, N'DANIEL CHAVES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4017, 14775203, N'JOANA GALVIS', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4018, 14785987, N'IVONNE SEQUEDA', 51, N'0', N'Activo')
GO
print 'Processed 800 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4019, 14786056, N'RICARDO GUERRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4020, 14788255, N'LESBIA JIMENEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4021, 14788309, N'NORELYS PALACIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4022, 14788626, N'IRAIDA PALACIOS', 50, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4023, 14789871, N'YUSMAR TRONCOSO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4024, 14792951, N'ALBERTO ALCALA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4025, 14806553, N'PEDRO CARRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4026, 14825711, N'CARLOS CAMACARO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4027, 14830534, N'ELENA RONDON', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4028, 14838301, N'INGRY GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4029, 14846136, N'ALVARO URRIBARRI', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4030, 14850201, N'MARCOS NAVAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4031, 14861093, N'JULIO SALAZAR', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4032, 14868243, N'ANY CORDOVA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4033, 14889617, N'JAVIER TOVAR', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4034, 14898479, N'JERWEIN MACHADO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4035, 14901460, N'RAMON SANCHEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4036, 14907749, N'JORGE PAREDES', 15, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4037, 14910685, N'CAROL ROMERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4038, 14935205, N'AGUSTÍN GONCALVEZ', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4039, 14940193, N'NAHOVIS VILLASMIL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4040, 14952956, N'JONATHAN DELGADO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4041, 14953218, N'LISBETH RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4042, 14953503, N'BEATRIZ AMAYA', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4043, 14954092, N'DIOMEDES BARRIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4044, 14955090, N'JONATHAN ZURITA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4045, 14961829, N'PATRICIA SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4046, 14963421, N'YULNARA DUGARTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4047, 14966985, N'EDITH CENTENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4048, 14978264, N'RAFAEL RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4049, 14982826, N'HEVER URRUTIA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4050, 14991303, N'ANA SANCHEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4051, 15008648, N'MARIA QUEBRADA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4052, 15016784, N'RAFAEL BOLIVAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4053, 15027590, N'WENDY DULCEY', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4054, 15040188, N'RENNY TERAN', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4055, 15048982, N'TATIANA ASTRADA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4056, 15056738, N'NICOLAS ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4057, 15079918, N'ERIKA GOMEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4058, 15080555, N'MARIA PARRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4059, 15083498, N'ANAYLI CUAREZ', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4060, 15091161, N'JUAN HERNANDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4061, 15091547, N'YALICSA GUEVARA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4062, 15098203, N'JEAN RODRIGUEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4063, 15105712, N'LINDA LARRARTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4064, 15106649, N'RAUL QUERALES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4065, 15107126, N'FRANKLIN PERALTA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4066, 15108954, N'GUSTAVO PEREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4067, 15111541, N'ANGELTERESA MERCIET', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4068, 15119506, N'YESENIA AHUMADA', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4069, 15132316, N'KELLY TORRES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4070, 15132489, N'GIOVANNI MARTINEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4071, 15138959, N'JULIAN RIVAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4072, 15139647, N'NORBELYS VILLANUEVA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4073, 15152097, N'CRISTY MENDEZ', 67, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4074, 15156199, N'RICHARD MORALES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4075, 15169881, N'WENDERLAN CHAVEZ', 7, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4076, 15172872, N'LEIBY FUENTES', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4077, 15173390, N'YENNY HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4078, 15187289, N'ENDER SIMANCAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4079, 15213391, N'JORGE QUINTERO', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4080, 15225343, N'WILLIANS RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4081, 15240804, N'UDON BITTER', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4082, 15244782, N'MARELBYS GRANADO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4083, 15281657, N'LUIS QUINTERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4084, 15314178, N'MARLYN LOPEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4085, 15325313, N'DENMYS PEREZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4086, 15337394, N'SHEILA COLINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4087, 15340918, N'DAMIAN LEON', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4088, 15347702, N'MARIANELA BETANCOURT', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4089, 15363332, N'GREEIILLYS VILLEGAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4090, 15374093, N'CLAUDIA GONZALEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4091, 15379595, N'YAIRE MONROY', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4092, 15385202, N'LUISMAR GUANIPA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4093, 15387538, N'VICTOR MEDINA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4094, 15423218, N'GERMAN RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4095, 15438960, N'YARLEY ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4096, 15456706, N'JESUS HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4097, 15462060, N'EDGAR CARRIZO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4098, 15467889, N'FABIOLA RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4099, 15473644, N'CARLOS MENDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4100, 15481530, N'LEIBYS MORENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4101, 15514957, N'ROBERT GUAINA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4102, 15527223, N'YOHELEN RENGIFO', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4103, 15536150, N'SURAMIL RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4104, 15540580, N'MARIAN GARCIA', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4105, 15541262, N'ANDERSON VIANA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4106, 15544789, N'JULIO PULIDO', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4107, 15549829, N'KISBERLY MATOS', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4108, 15558140, N'LEIDY SANDOVAL', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4109, 15571895, N'YODENNYS BLANCO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4110, 15577506, N'RICARDO HERNANDEZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4111, 15579413, N'MARIA PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4112, 15582074, N'EDISON BERLETT', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4113, 15582791, N'RHONNY GONZALEZ', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4114, 15587204, N'WLADIMIR DUARTE', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4115, 15589339, N'LISBETH BASTIDAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4116, 15595218, N'NELLY CUEVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4117, 15620819, N'JUAN PAREDES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4118, 15622913, N'NESTOR MARIN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4119, 15630105, N'YENNIFER ORTIZ', 51, N'0', N'Activo')
GO
print 'Processed 900 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4120, 15630662, N'MIGLENYS RUIZ', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4121, 15635239, N'PEDRO MEDINA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4122, 15636874, N'FELIX MENDEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4123, 15640826, N'JHON ROSALES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4124, 15645252, N'MARIUT SANTAELLA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4125, 15669567, N'ELIZABETH GALLARDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4126, 15689643, N'MARIA CAICEDO', 17, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4127, 15690416, N'YOHANNA TORRELLES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4128, 15701896, N'JHONY PELLEGRIN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4129, 15703726, N'VICTOR FALCON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4130, 15706548, N'RAUL CROES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4131, 15706946, N'ROSELYN GARCIA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4132, 15728860, N'FRANCISCO PRIETO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4133, 15738506, N'JUAN YEPEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4134, 15741438, N'NEYVA GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4135, 15752479, N'RAITZA MORENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4136, 15758590, N'ANA GOMEZ', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4137, 15759670, N'BELGICA MORALES', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4138, 15763738, N'PATRICIA BARBOZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4139, 15769239, N'EDGAR LOZADA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4140, 15779204, N'SENY MONSANTO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4141, 15799462, N'JUDITH ZABALETA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4142, 15806608, N'WILMELY CHIQUITO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4143, 15807078, N'MAYNELIS VILCHEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4144, 15810940, N'CARLOS SUAREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4145, 15812234, N'WILLIAMS VASQUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4146, 15816184, N'FRANCISCO GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4147, 15830850, N'CARLOS PEREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4148, 15830969, N'JOSE RODRIGUEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4149, 15836259, N'PATRICIA FREITES', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4150, 15842566, N'LINDY AVENDAÑO', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4151, 15858079, N'RHONY ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4152, 15866756, N'ROMY DIAZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4153, 15907282, N'JOSE MARTINEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4154, 15912526, N'EDWIN SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4155, 15920668, N'MARIA PACHECO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4156, 15923153, N'YAIQUIVEL RAMIREZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4157, 15930346, N'FRANKLIN MORANTES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4158, 15936778, N'ISRAEL BOLIVAR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4159, 15952803, N'JOHANA ARTIGAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4160, 15960659, N'EVELIN TOVAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4161, 15962178, N'LILIANA GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4162, 15962463, N'JOSE VIVAS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4163, 15967053, N'KELLY DIAZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4164, 15975711, N'JORGE PADILLA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4165, 15976928, N'MARINO CASTILLO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4166, 16018488, N'YOHANDRY GARCIA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4167, 16021190, N'KEYNNER RODRIGUEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4168, 16027302, N'ANGEL REMY', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4169, 16031409, N'DAMELIS BETANCOURT', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4170, 16040565, N'HUMBERTO QUIROZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4171, 16042117, N'LIXSARI ARRAIZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4172, 16067807, N'LEONARDO BUCAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4173, 16100301, N'NEREYDA VIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4174, 16101977, N'NELSON GARRIDO', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4175, 16110300, N'LUIS ACOSTA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4176, 16114936, N'ELCY PEÑA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4177, 16115644, N'ADELA GOMEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4178, 16144194, N'YUNYS ORTEGA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4179, 16147587, N'EDIMAR RODRIGUEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4180, 16169314, N'JOYCELIS PACHANO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4181, 16193447, N'FRANCELIS VELASQUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4182, 16200476, N'JOMAY UZCATEGUI', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4183, 16204012, N'CHRISTIAN VELASQUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4184, 16228619, N'MARIA GALAVIS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4185, 16234204, N'YULEIDY SANTANA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4186, 16258557, N'JOSE CHACON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4187, 16261318, N'CARLOS MONASTERIO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4188, 16264268, N'YURINEL APONTE', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4189, 16265892, N'CARLOS TERAN', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4190, 16265895, N'JOSE TERAN', 27, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4191, 16284196, N'JOSE HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4192, 16286469, N'YULY MARIN', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4193, 16294019, N'DAXELIS MERCADO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4194, 16317518, N'NANCY CONTRERAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4195, 16334581, N'OLIVER MORA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4196, 16335410, N'ROTHMELYS PEREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4197, 16344314, N'LEIDY NAVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4198, 16356848, N'ALDO WINDER', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4199, 16366951, N'RONNY CHIRINOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4200, 16371923, N'JAIRELIS CARVAJAL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4201, 16372353, N'YESSIKA LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4202, 16377689, N'ALIX SALCEDO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4203, 16401017, N'NAIBE RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4204, 16401639, N'MIGUEL DE FREITAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4205, 16412448, N'LEIDA FLORES', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4206, 16412681, N'YESENIA ARGUINZONEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4207, 16413208, N'YRAIMA GUERRERO', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4208, 16414622, N'YAMILETH ACOSTA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4209, 16429101, N'CRISTINA RUIZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4210, 16433232, N'MAYLUI BECERRA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4211, 16433308, N'CESAR CORDIDO', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4212, 16436330, N'YVIS VELAZQUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4213, 16438209, N'MILDRE MATA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4214, 16465529, N'LUCIA PACE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4215, 16472670, N'JUAN ARMADA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4216, 16473643, N'JOHUMER GRAGIRENA', 31, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4217, 16507354, N'MAIRA LANDAETA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4218, 16509384, N'TONY MONTIEL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4219, 16509500, N'YULENNY BORGES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4220, 16515142, N'MARIA PAREDES', 51, N'0', N'Activo')
GO
print 'Processed 1000 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4221, 16525820, N'JOSE MARQUEZ', 15, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4222, 16536090, N'NAIRELIS GUARENA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4223, 16540710, N'YERLY BALLEN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4224, 16546172, N'LEIDYS LEON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4225, 16547933, N'LUIS GRANCHELLI', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4226, 16549462, N'IRENE RAMONES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4227, 16552669, N'MANUEL BRITO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4228, 16562067, N'YUSBELID MIJARES', 20, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4229, 16568831, N'RONALD PIMENTEL', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4230, 16578611, N'JOSE RANGEL', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4231, 16581515, N'MIGDALYS GONZALEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4232, 16582380, N'ALFONSO AGUDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4233, 16590132, N'LILIAM LOPEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4234, 16612996, N'MAURICIO MONTENEGRO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4235, 16619327, N'ANGEL PEÑA', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4236, 16621714, N'JOSANT SERRANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4237, 16625600, N'VITDELYS RAMOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4238, 16630956, N'MARILI BASTARDO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4239, 16632863, N'ANABEL COLINA', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4240, 16633997, N'DAVID NAVA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4241, 16637812, N'YOLEIDA SARMIENTO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4242, 16641927, N'OMAIRY SANDOVAL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4243, 16642036, N'NILFER LEON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4244, 16653307, N'KATIUSCA NIEVES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4245, 16658070, N'JUNIOR CONTRERAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4246, 16659336, N'WANYER RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4247, 16660585, N'JOSE ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4248, 16661139, N'ANA MARTINEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4249, 16662966, N'DAVID PEREZ', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4250, 16663788, N'FLORES AIRUSKA', 69, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4251, 16666048, N'HEIDER RAMIREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4252, 16668293, N'HONEY PACHECO', 21, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4253, 16669047, N'DALIESKA ROO', 20, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4254, 16669596, N'EDDRA HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4255, 16671446, N'BETZABE QUINTERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4256, 16671538, N'IRBYM MEDINA', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4257, 16682084, N'EULY OTAIZA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4258, 16683160, N'JEFERSSON RODRIGUEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4259, 16707039, N'JORGE MALDONADO', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4260, 16709427, N'RAUL ALBORNOZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4261, 16717364, N'YOLIMAR SERRANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4262, 16718444, N'JEXSON SALAZAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4263, 16745491, N'ISABEL RAMOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4264, 16745504, N'COROMOTO GOMEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4265, 16751729, N'XIOMARA ESCALONA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4266, 16809677, N'YONDRY MALAVE', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4267, 16826907, N'AMAGDALIS MARÍN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4268, 16842204, N'MARISELA SUNIAGA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4269, 16849445, N'YUDETXY PEREIRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4270, 16849956, N'ANNY ALDAZORO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4271, 16853141, N'YULIANY PEPPER', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4272, 16856794, N'GRECIA ZAMBRANO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4273, 16875012, N'VICMER BLANCO', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4274, 16897204, N'JENNIFER SALAZAR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4275, 16901202, N'ADRIAN ESCOBAR', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4276, 16903505, N'AMARILYS TORRES', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4277, 16913864, N'SAUL HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4278, 16933708, N'VERONICA SAAVEDRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4279, 16936848, N'CARLOS VALERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4280, 16938111, N'YERKIS HENRIQUEZ', 31, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4281, 16951953, N'JOSE MENDOZA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4282, 16954004, N'JHONY PALMERA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4283, 16960302, N'YUDERKYS LUGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4284, 16964027, N'ANGEL CARRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4285, 16966762, N'LEIDY MORALES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4286, 16971890, N'TOMAS MONTANA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4287, 16973065, N'EDIXON MENDOZA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4288, 16973290, N'JOSEANGEL MEDINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4289, 16975762, N'JOSE HIDALGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4290, 16980236, N'LUIS GUERRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4291, 16981997, N'LEIDY RAMIREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4292, 16990639, N'YVIS POSADA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4293, 16991480, N'ROBERT ARAUJO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4294, 17002007, N'GERSON ROMERO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4295, 17002883, N'YUNNIOR DURAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4296, 17017951, N'JOSE YAJURE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4297, 17019560, N'YULEIMA MORILLO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4298, 17022767, N'ELIZABETH FERNANDEZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4299, 17028987, N'ROSA ARAQUE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4300, 17057911, N'YORYI VELAZCO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4301, 17059029, N'NATHALY MESTAS', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4302, 17059924, N'EVELIN GRANADOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4303, 17062097, N'EKEISMA LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4304, 17068490, N'ADIANOY DASILVA', 15, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4305, 17070205, N'MARIA RINCON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4306, 17073996, N'YOHAN MARQUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4307, 17080107, N'LABEGUN ERAZO', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4308, 17080234, N'LUIS MORR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4309, 17085012, N'LAURA ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4310, 17109246, N'DANIELA CONTRERAS', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4311, 17109586, N'BRENDA PORRAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4312, 17118253, N'SANDRA RUIZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4313, 17129152, N'MARY SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4314, 17130419, N'JOHAN ZERPA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4315, 17153276, N'THAIS JIMENEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4316, 17176784, N'ANGEL ACOSTA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4317, 17207766, N'OLIVER USECHE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4318, 17213316, N'EMILYS BOADA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4319, 17213564, N'HILDALY MARCANO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4320, 17215596, N'ALEJANDRO MEJIAS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4321, 17223125, N'RAWLISON MARCANO', 55, N'0', N'Activo')
GO
print 'Processed 1100 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4322, 17235990, N'YANITZA VILLAROEL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4323, 17239174, N'CIRMARY PEÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4324, 17252888, N'YARIANGEL ZAPATA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4325, 17260924, N'LISNEY CASTRO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4326, 17272459, N'CINTHIA MARTINEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4327, 17289049, N'ANGELA PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4328, 17311414, N'JOSE CABEZAS', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4329, 17311833, N'MAYERLING MONASTERIOS', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4330, 17313151, N'YENNY MOGOLLON', 29, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4331, 17316563, N'YERILUZ SEQUERA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4332, 17322791, N'ANY PIMENTEL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4333, 17325383, N'LUSMARY SOLANO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4334, 17345781, N'MARIA BRICEÑO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4335, 17346856, N'ALBERTO SANTIAGO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4336, 17347608, N'MILAGROS AZUAJE', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4337, 17353963, N'EILY MENDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4338, 17362729, N'LORENA PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4339, 17364007, N'JORGE FEIJOO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4340, 17369117, N'JENNY LEON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4341, 17371776, N'JUAN DELGADO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4342, 17377370, N'DAYANA MUÑOZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4343, 17377846, N'KARINA MORENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4344, 17377934, N'YESSICA GUERRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4345, 17385202, N'MAIKEL CASTILLO', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4346, 17387216, N'MARFREDD AGUDELO', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4347, 17388402, N'YULIANI ALBUQUEQUE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4348, 17390259, N'YTSERWI GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4349, 17400782, N'JOSE SAN GIL', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4350, 17402589, N'ROSANGELA SALAVARRIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4351, 17411093, N'JARARDY MARQUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4352, 17414805, N'LAY VILLASMIL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4353, 17419899, N'NATHALY PENOTH', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4354, 17424512, N'FRANKLIN GALINDEZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4355, 17425952, N'NEDYURI APONTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4356, 17426091, N'ANDREINA ASAPCHE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4357, 17427063, N'YEIRY SEGOVIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4358, 17427993, N'ELEINMAR TERAN', 5, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4359, 17435174, N'EDGAR REYNA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4360, 17440542, N'THAILYN TORRES', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4361, 17454534, N'NELSON RODRIGUEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4362, 17458386, N'DELIA FLORES', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4363, 17469484, N'DAYANY MOGOLLON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4364, 17471066, N'FABIOLA FLAMES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4365, 17471288, N'YAZMINA ARAUJO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4366, 17471511, N'ANGELA PAZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4367, 17471668, N'DORA GOLDCHEIDT', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4368, 17472615, N'EDUARDO RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4369, 17474795, N'MARIA CONTRERAS', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4370, 17475396, N'JOSE TORREALBA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4371, 17476979, N'JEMI VALIDO', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4372, 17478319, N'MARIA RAMIREZ', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4373, 17500464, N'BARBARA CARRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4374, 17508664, N'MIRIAM SUBERO', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4375, 17515062, N'PAOLA VIZCAYA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4376, 17518583, N'JUNIOR JOSE MEDINA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4377, 17521313, N'YURIS SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4378, 17531372, N'HEYSI MANRIQUE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4379, 17536674, N'GLEIDY IBARRA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4380, 17537879, N'EDUARDO QUIARO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4381, 17545496, N'ELEXANDER GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4382, 17563542, N'ANDRY MAZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4383, 17575825, N'WUILLIAMS RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4384, 17576474, N'AYAHARYS MENDOZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4385, 17583135, N'VANESSA MORENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4386, 17599646, N'NEYLIN SANCHEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4387, 17602797, N'CESAR AREVALO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4388, 17610663, N'FREDDY VARGAS', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4389, 17622144, N'PEDRO MORAO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4390, 17622251, N'GABRIELA SALAZAR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4391, 17650674, N'JORGE GOMEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4392, 17652276, N'YORMIRA DIAZ', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4393, 17659566, N'KAROLAY MENDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4394, 17662771, N'LISBETH HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4395, 17662926, N'SPENCER RANGEL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4396, 17684849, N'EDDY GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4397, 17685225, N'SANDRA ROJAS', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4398, 17688876, N'YURIS CALLES', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4399, 17691946, N'LISBETH RONDON', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4400, 17696058, N'YULIMAR TERAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4401, 17717365, N'AURYMAR CORES', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4402, 17733103, N'ADRIAN RIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4403, 17752961, N'DORIS DUNO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4404, 17753319, N'ALVARO ROA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4405, 17759386, N'MARIAM VERA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4406, 17763099, N'ALEXANDER SARMIENTO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4407, 17770477, N'RUTH SILVA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4408, 17793726, N'MILAXI ROMERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4409, 17794117, N'GEMMA BERNAL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4410, 17794430, N'YENNI BALAGUERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4411, 17795189, N'WILLIAN SILVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4412, 17812915, N'JACKELIN PARRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4413, 17817111, N'JOVANNA LECHTIG', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4414, 17830613, N'JOHAMNA CARDOZO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4415, 17838734, N'ADRIAN DINDYAL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4416, 17843400, N'ELVIS DELGADO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4417, 17852363, N'JESUS LEAL', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4418, 17856671, N'JENSEL RAMIREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4419, 17857157, N'DARKYS GALEANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4420, 17863221, N'JOSE OCAMPO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4421, 17881570, N'PEDRO VIRGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4422, 17896512, N'EDINSON SANCHEZ', 51, N'0', N'Activo')
GO
print 'Processed 1200 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4423, 17906746, N'LUIS LEON', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4424, 17914896, N'DUBRASKA HERNANDEZ', 20, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4425, 17918507, N'NEIRICE AÑEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4426, 17920866, N'BELGICA HERNANDEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4427, 17921543, N'NATALI VELASQUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4428, 17928414, N'YELIMAR BANDEIRA', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4429, 17931964, N'HERNAN HOYOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4430, 17932628, N'YHOANDESON GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4431, 17937314, N'ELADIO TORRES', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4432, 17942841, N'LEYLA LOZADA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4433, 17944188, N'TANIA CHIRINOS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4434, 17945442, N'MIRELLA RAMIREZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4435, 17956795, N'CARLOS REYES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4436, 17962048, N'WILLIAM LOVERA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4437, 17976181, N'YORMARIS MONSALVE', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4438, 17976869, N'WILMER ROMERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4439, 17992172, N'ALFREDO CRESPO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4440, 18002854, N'JOSE MENDOZA', 34, N'403', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4441, 18031837, N'RAMSES HERNANDEZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4442, 18040135, N'YECY GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4443, 18052357, N'MIDANYELA TORTOLANI', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4444, 18063927, N'NEOMAR PARRA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4445, 18064735, N'ALEXANDRE RONDON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4446, 18077699, N'YESENIA SUAREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4447, 18089741, N'ANDERSON GOMEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4448, 18093960, N'JOSE NARANJO', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4449, 18102894, N'RONALD CORTEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4450, 18107853, N'MAHOLYS APONTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4451, 18109048, N'OSKARINA PEREZ', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4452, 18110574, N'ARELYS CORREA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4453, 18111137, N'JHOANA BERROTERAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4454, 18111236, N'YESSI TORO', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4455, 18124926, N'RONALD HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4456, 18125227, N'OSCAR MORALES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4457, 18125351, N'EDUARDO RIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4458, 18125559, N'SANDRA LOBO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4459, 18128757, N'EDUARDO CALDERON', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4460, 18129560, N'MARIA CISNEROS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4461, 18140541, N'LEIWIS PAJEDES', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4462, 18143281, N'JESUS HOYOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4463, 18155916, N'GUSTAVO GARCIA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4464, 18159425, N'CARMEN CHIRE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4465, 18187871, N'JORYELI HERRERA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4466, 18190715, N'ADRIANA RODRIGUEZ', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4467, 18213628, N'ANGEL HIGUEREY', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4468, 18214587, N'MARIA VIÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4469, 18234947, N'INGRID PEREIRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4470, 18261141, N'ANNAKARINA PRIMERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4471, 18264474, N'LUZ PAREDES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4472, 18269921, N'YAISY LOPEZ', 29, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4473, 18270360, N'YASNEL RAMOS', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4474, 18287784, N'CARLOS RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4475, 18292655, N'YOHANA GUTIERREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4476, 18293723, N'FREILUY LOPEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4477, 18295183, N'CARLOS GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4478, 18297422, N'CARLOS ESCOBAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4479, 18310930, N'IBETKZA RIVERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4480, 18312697, N'MARIA PINEDA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4481, 18325400, N'VANESSA HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4482, 18330393, N'WISBELY LINARES', 20, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4483, 18330619, N'MARGORY BRICEÑO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4484, 18330753, N'CESAR PORTILLO', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4485, 18335235, N'OMAR MARQUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4486, 18342468, N'ANGEL BERMUDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4487, 18349030, N'BIBIANA FERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4488, 18366400, N'MARIA BRITO', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4489, 18366776, N'RONNY ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4490, 18377352, N'ANGELA MATERANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4491, 18380292, N'GABRIEL CONTRERAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4492, 18386828, N'ROSA PRESILLA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4493, 18388668, N'JULIAN CALDERIN', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4494, 18388930, N'KARLA TORREALBA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4495, 18392110, N'DEISY MEDINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4496, 18393527, N'CARLYN GUERRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4497, 18407001, N'JHONATAN MEDINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4498, 18418660, N'JUSTO ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4499, 18442515, N'NATHALY GUILARTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4500, 18447461, N'DAIRENIN BOSCAN', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4501, 18457399, N'MIRELIS BARRETO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4502, 18459045, N'KELVIN ALVAREZ', 49, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4503, 18461874, N'DANNY GONZÁLEZ', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4504, 18489454, N'ANDREA GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4505, 18492515, N'CARMEN OLIVEROS', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4506, 18502840, N'DEYSI RIVAS', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4507, 18503404, N'FLOREGLIS FALCON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4508, 18510053, N'IRANIA QUIJADA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4509, 18511911, N'MARIA MENDOZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4510, 18513224, N'JORGE CUAREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4511, 18515180, N'YOLIBER CORDOVA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4512, 18529935, N'ANYINEL ASCANIO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4513, 18530503, N'LILIBETH SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4514, 18531560, N'MARIEVIS TORRES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4515, 18542165, N'ANA CAMEJO', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4516, 18553814, N'YENEVIT MENDOZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4517, 18563550, N'RAFAEL ESPINOZA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4518, 18572018, N'DAVID MELENDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4519, 18579248, N'LEIDY GUILLEN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4520, 18598470, N'KAIRELYS CEDEÑO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4521, 18598962, N'DANIELA TOVAR', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4522, 18601384, N'ELCIDA GONZALEZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4523, 18603149, N'ELVIS MOTA', 43, N'0', N'Activo')
GO
print 'Processed 1300 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4524, 18620245, N'NATHALI VIELMA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4525, 18620906, N'JESUS RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4526, 18636046, N'NIL DIOYOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4527, 18638429, N'ENDER RIERA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4528, 18640350, N'LEONARDO OVIEDO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4529, 18647860, N'CARLOS COLINA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4530, 18661098, N'ARELIS RIVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4531, 18668124, N'EDIMAR OCHOA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4532, 18681820, N'JUSTO PEROZO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4533, 18715806, N'MARIA ESCALANTE', 66, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4534, 18728377, N'DANIEL QUINTERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4535, 18728691, N'ROSELY ZAMORA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4536, 18749828, N'LISETTE RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4537, 18750473, N'MICHAEL TORRES', 35, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4538, 18751106, N'HENRY CARMONA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4539, 18771598, N'JOSE GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4540, 18772794, N'JAVIER MEZA', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4541, 18775590, N'LUIS VILLASANA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4542, 18779901, N'GUSMAR CEPEDA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4543, 18791242, N'NELSON CUEVAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4544, 18797659, N'LILIAN DUGARTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4545, 18836229, N'YULETCY ARAUJO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4546, 18836854, N'LUIS HERNANDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4547, 18839023, N'YURISOL MARANTE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4548, 18844905, N'LUIS TORRES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4549, 18845103, N'ROSCERY VANEGAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4550, 18845124, N'WILCAR RAMIREZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4551, 18852907, N'IVANNA BLANCO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4552, 18872933, N'ADRIAN GOMEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4553, 18879812, N'INGRID RUIZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4554, 18887490, N'KARINA AGUILAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4555, 18940201, N'FATIMA YASSINE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4556, 18940738, N'MÓNICO PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4557, 18962510, N'MARILIA LOZANO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4558, 18966334, N'MILEIDY VIELMA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4559, 18966531, N'JOSE RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4560, 18973763, N'ELIANA GADEA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4561, 18977966, N'CARLIANA SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4562, 18984549, N'RODOLFO BRICEÑO', 33, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4563, 18989892, N'JOSE ROJAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4564, 18990373, N'DANIELA OCAMPO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4565, 18994147, N'YOHANNA PALACIO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4566, 18994751, N'HENRY MIRANDA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4567, 18996455, N'MICHELLE RAMOS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4568, 19023922, N'JOAN DIAZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4569, 19027202, N'YONNY SILVA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4570, 19027244, N'ANA GARCIA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4571, 19028127, N'MERLYN TOVAR', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4572, 19043933, N'YESSICA RUIZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4573, 19046514, N'MARIA CARRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4574, 19053336, N'YURAIMA LINAREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4575, 19053962, N'MARIELBA PEÑA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4576, 19056205, N'PASTOR MOLINA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4577, 19060426, N'JOHANY GONZALEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4578, 19070799, N'LEISA GALVIS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4579, 19071591, N'CESAR TAQUIVA', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4580, 19089962, N'ELISA BENAVIDES', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4581, 19138994, N'KARIZMA ESPINOZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4582, 19144034, N'MARIA PEREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4583, 19162325, N'ANYELA RONDON', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4584, 19187223, N'EDUARDO FERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4585, 19194893, N'LEIDY FERNANDEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4586, 19195720, N'GERVIC MILLAN', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4587, 19200616, N'DEBERIN TEJADA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4588, 19211499, N'JULIO ASCANIO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4589, 19226454, N'FELIX DE FRANCESCO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4590, 19228956, N'JESSIKA LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4591, 19234853, N'CLAUDIA SANCHEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4592, 19236779, N'DIEGO MENDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4593, 19240125, N'DARWIN JIMENEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4594, 19243999, N'NEIDA RAMIREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4595, 19251091, N'NEYLA MEDINA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4596, 19264541, N'ALISBEL LINARES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4597, 19268064, N'JHON AZUAJE', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4598, 19272228, N'ESCLEVER LAYA', 25, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4599, 19286986, N'SERGIO PEÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4600, 19287766, N'EVELYN LINARES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4601, 19288492, N'DEIBY CARDONA', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4602, 19289836, N'IRMA ORTIZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4603, 19296974, N'MARIANNY FERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4604, 19302311, N'JHONMY QUINTANA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4605, 19309137, N'HEBER NAVARRO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4606, 19309690, N'LEONARDO HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4607, 19314840, N'GABRIEL JIMENEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4608, 19315023, N'YODALYS MACUARAN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4609, 19329534, N'ANGEL RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4610, 19330980, N'DORIANNY VILLARROEL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4611, 19334138, N'BEXIS JIMENEZ', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4612, 19347322, N'MARIA MANRIQUE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4613, 19352239, N'VLADIMIR VIERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4614, 19366930, N'JIMMY ALMENAR', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4615, 19367154, N'DEIBY RAMIREZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4616, 19368641, N'BRAYANNY BECERRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4617, 19377082, N'GRECIA RODRIGUEZ', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4618, 19386689, N'DUBRASKA MARRERO', 34, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4619, 19388649, N'INGRID ESPINOZA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4620, 19400026, N'GABRIEL SILVA', 49, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4621, 19419240, N'ALICIA SANDOVAL', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4622, 19452351, N'NAEN CASTELLANO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4623, 19483377, N'LEONARDO ORTIZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4624, 19510629, N'LUIS TERAN', 2, N'0', N'Activo')
GO
print 'Processed 1400 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4625, 19524247, N'EKALOV GONZALEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4626, 19555132, N'YENIRE ARIAS', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4627, 19579466, N'JOSE GUIZA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4628, 19579641, N'KELVIS MONCADA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4629, 19581348, N'VICTOR MARTINEZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4630, 19583969, N'MARIA VERA', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4631, 19586069, N'NAKARI ALEMAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4632, 19589678, N'MARLIN COLINA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4633, 19594213, N'ODER MOYA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4634, 19598787, N'JESSICA OROZCO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4635, 19628572, N'SUSANA DA COVA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4636, 19635165, N'ARGENIS RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4637, 19638145, N'YOSKAREN MIJARES', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4638, 19652547, N'RAIZA ORTEGA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4639, 19664275, N'JESUS GARCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4640, 19664528, N'ALMARLIS JAIMEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4641, 19668846, N'KENDRY VELIZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4642, 19676142, N'NATHALIA ALVIAREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4643, 19678009, N'DARWINS TOVAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4644, 19684502, N'MILAGROS INFANTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4645, 19726437, N'ROGER RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4646, 19740621, N'WINELLA QUINTANA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4647, 19741076, N'LIZETH RINCON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4648, 19752829, N'SARA VIELMA', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4649, 19763086, N'JHOAN MELENDEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4650, 19768185, N'MARYI RICO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4651, 19768916, N'ANGEL NARIÑO', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4652, 19796640, N'VIRDALYS DIAZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4653, 19799472, N'EFRAIMAR PEREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4654, 19807237, N'JOHANNA RAMIREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4655, 19830865, N'ROBERT NEGRIN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4656, 19851056, N'MILIXY MOSQUEDA', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4657, 19851385, N'EDWIN ZAPATA', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4658, 19851718, N'NAILET OLIVIER', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4659, 19868743, N'VANESSA GONZALEZ', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4660, 19878361, N'FERNANDO TRESPALACIOS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4661, 19890468, N'JAIR MARTINEZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4662, 19894902, N'DAMARYS GAVIDIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4663, 19904339, N'LUISANA RODRIGUEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4664, 19931553, N'YHONATHAN MANZO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4665, 19946340, N'ALESANDRA LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4666, 19956345, N'THAIS MONTILLA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4667, 19957229, N'FRANCELYS MORILLO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4668, 19982458, N'JOSE MONTILLA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4669, 19987850, N'BARBARA SENCIAL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4670, 19997425, N'ELIZABETH RANGEL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4671, 20025932, N'CRISBEL PEREZ', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4672, 20033644, N'FANNY GOMEZ', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4673, 20051108, N'MAIKEL MARQUEZ', 29, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4674, 20054788, N'MARIAN MARCANO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4675, 20067000, N'YENIREE LEON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4676, 20071376, N'GAUDY LINARES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4677, 20086290, N'JOSE CASTILLO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4678, 20087855, N'NAIROBI ESCALANTE', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4679, 20095103, N'YOLIMAR CARRERA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4680, 20096810, N'YUNEIRY ASTUDILLO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4681, 20104214, N'FRANCISCO CHEREMO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4682, 20109169, N'KEVERLYN LOBATON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4683, 20118789, N'MARÍA CANELON', 3, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4684, 20129171, N'LESLIE VIÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4685, 20132581, N'JUBILEIDY NAVAS', 4, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4686, 20146963, N'JESUS HERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4687, 20153933, N'JHONATTHAN MORENO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4688, 20161776, N'RAFAEL IBAÑEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4689, 20197497, N'JESUS PEÑA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4690, 20209231, N'GÉNESIS HERNÁNDEZ', 12, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4691, 20236052, N'LEONELA COLMENAREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4692, 20265038, N'JULIO ACOSTA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4693, 20289630, N'ANDREA BRITO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4694, 20291574, N'LUIS BLANCO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4695, 20291630, N'ISBEL CACERES', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4696, 20302617, N'ERIKA SALAZAR', 23, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4697, 20303778, N'ALORQUI BUITRAGO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4698, 20327973, N'CHRISTIAN PAZ', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4699, 20340887, N'LORENA DE LUCIA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4700, 20377890, N'HENRY ZAMBRANO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4701, 20379076, N'YERUZA GOVEA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4702, 20384120, N'JOSE ESTRADA', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4703, 20396248, N'MARIANA CARRERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4704, 20412850, N'YULAY MOSQUEDA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4705, 20412878, N'DAYERLYN MOSQUEDA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4706, 20423801, N'LUISANA RONDON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4707, 20426124, N'YASCID COLMENARES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4708, 20451525, N'EMILI ARAUJO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4709, 20452738, N'LORENY BENYAMEN', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4710, 20452975, N'FRANKLIN STEVENSON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4711, 20504598, N'NICOLE QUICENO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4712, 20538055, N'GENESIS RODRIGUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4713, 20560816, N'JEAN CABRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4714, 20574188, N'FRANCISCO BLOHM', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4715, 20583283, N'EDICSO MACHADO', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4716, 20585976, N'CHRISLLUBEILY PEÑARANDA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4717, 20589159, N'JOSE HURTADO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4718, 20601870, N'KARLA FALCON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4719, 20604229, N'PEDRO MORA', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4720, 20604244, N'YENIFER QUINTERO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4721, 20614384, N'IASNAIA VILLAR', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4722, 20638986, N'JONAIKER ORTEGA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4723, 20643115, N'LUISMAR GARCIA', 71, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4724, 20676693, N'JEFREY ARTEAGA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4725, 20678932, N'JESUS NAVA', 55, N'0', N'Activo')
GO
print 'Processed 1500 total records'
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4726, 20685990, N'DIDIER MIQUELENA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4727, 20693322, N'YUSELY JIMENEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4728, 20701137, N'MARILYN PAEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4729, 20730600, N'JOSE DE FREITAS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4730, 20762052, N'CHRISTIAN ARMAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4731, 20765002, N'JOSEANNY ARANGUREN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4732, 20792763, N'EDGAR FRANCO', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4733, 20793163, N'JOSELYN ARMAS', 28, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4734, 20799805, N'PIERINA SANGRONI', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4735, 20800907, N'MIGUEL ALTUVE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4736, 20829722, N'ALBEIRO GUTIERREZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4737, 20836567, N'JEFERSON POLANCO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4738, 20840664, N'LUIS CALZADILLA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4739, 20849914, N'JUSSER VALERO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4740, 20870733, N'DAMYELI GARCIA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4741, 20904194, N'GABRIEL APONTE', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4742, 20911760, N'HUGO DIAZ', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4743, 20997051, N'KATHERIN MARTINEZ', 56, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4744, 20999737, N'YOSCARLI LOPEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4745, 21025658, N'ALFONSO LOPEZ', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4746, 21054012, N'JOEL LOPEZ', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4747, 21093661, N'JOSSELYN MARCOFF', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4748, 21097429, N'SIULMAR BORGES', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4749, 21161419, N'FLORILDA OLIVERA', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4750, 21184480, N'GIANNA MEZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4751, 21218977, N'JORGE MARQUEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4752, 21242883, N'ANTHONY ROMAN', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4753, 21283614, N'ANDERSON LISCANO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4754, 21344830, N'HENRY DELGADO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4755, 21378252, N'HORELYS TORRES', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4756, 21442981, N'JEFFERSON SIMANCAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4757, 21536419, N'KAREN ALVAREZ', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4758, 21536918, N'DANIELA LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4759, 21571472, N'YEIRIS RIOBO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4760, 21578049, N'ELVIN ARREAZA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4761, 22032247, N'JHORSSEN S LOPEZ', 24, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4762, 22038275, N'RONALD GOMEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4763, 22229427, N'CARLOS LOPEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4764, 22284140, N'MARTIN BLANQUICET', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4765, 22380885, N'ELISA CAMPO', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4766, 22440757, N'OLIVER ESPINOZA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4767, 22452302, N'ALEX FERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4768, 22523260, N'LADARYS OCHOA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4769, 22564057, N'MARTIN BLANCO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4770, 22576363, N'OULABI BASSAM', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4771, 22588682, N'JEYNER PARRA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4772, 22609086, N'ELOY MEDINA', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4773, 22628902, N'ROBERT MARTINEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4774, 22647111, N'ELIAS CAMPO', 9, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4775, 22678518, N'AFREDO ARAQUE', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4776, 22692422, N'YANIRETH FUENTES', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4777, 22692514, N'ROSMARI RODRIGUEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4778, 22694449, N'EDUARDO GUTIERREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4779, 22760589, N'JUAN ROJAS', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4780, 22770318, N'ROBERT PINEDA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4781, 22866110, N'JENNIFER VALDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4782, 22903461, N'ALI GARCIA', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4783, 23098244, N'DIANA OSTOS', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4784, 23241487, N'RANDY BUITRAGO', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4785, 23298646, N'VIELIS PACHECO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4786, 23430424, N'ANDRES PEREZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4787, 23482571, N'CARLOS SALINAS', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4788, 23501900, N'JOSUE GIL', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4789, 23609825, N'REYNALDO DUARTE', 18, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4790, 23615672, N'ADONIS GONZALEZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4792, 23695647, N'RAFAEL SOSA', 22, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4793, 23710335, N'SILVIA CUEVA', 52, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4794, 24057216, N'ASDRUBAL FERNANDEZ', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4796, 24394494, N'YUDEISY GUTIERREZ', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4797, 24624259, N'ALIRIO LOPEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4798, 24799059, N'RODRIGO LUTTGES', 55, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4800, 25243823, N'GUSTAVO CAICEDO', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4801, 25284666, N'CLAUDIA ROJAS', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4802, 25565003, N'MARIA HERRERA', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4803, 25565130, N'HILLARY RENDON', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4804, 26150483, N'KERLLYN LOPEZ', 43, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4805, 26268383, N'ASCHLIE MARCANO', 48, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4806, 26440468, N'CRISTHIAN LUGO', 51, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4807, 26861394, N'WIRDER CABA', 72, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4808, 29983855, N'JORGE ALVAREZ', 2, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4809, 81994023, N'MARILOLY COLONDRES', 54, N'0', N'Activo')
INSERT [dbo].[Personal] ([PersonalID], [Cedula], [NombrePersonal], [DivisionID], [NumeroExtension], [EstatusPersonal]) VALUES (4810, 84437613, N'LUVIS VASQUEZ', 55, N'0', N'Activo')
SET IDENTITY_INSERT [dbo].[Personal] OFF
/****** Object:  Table [dbo].[SolicitudServicio]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SolicitudServicio](
	[SolicitudServicioID] [int] IDENTITY(1,1) NOT NULL,
	[PersonalID] [int] NOT NULL,
	[DescripcionSolicitudServicio] [varchar](2000) NOT NULL,
	[FechaSolicitudServicio] [smalldatetime] NOT NULL,
	[AreaServicioDetalleID] [int] NOT NULL,
	[EstatusSolicitudServicioID] [int] NOT NULL,
	[FechaFinalizacionSolicitudServicio] [smalldatetime] NULL,
	[SeguridadUsuarioDatosID] [int] NOT NULL,
 CONSTRAINT [PK_SolicitudServicio] PRIMARY KEY CLUSTERED 
(
	[SolicitudServicioID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SolicitudServicio] ON
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (93, 3926, N'configurar scanner a varios usuarios', CAST(0xA75F0280 AS SmallDateTime), 1, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (94, 4424, N'Revisar conexion de la red', CAST(0xA75F0345 AS SmallDateTime), 26, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (95, 3356, N'Conexion a la red y cambio de clave', CAST(0xA75F03A6 AS SmallDateTime), 26, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (98, 3580, N'instalacion de disco y memoria a servidor', CAST(0xA75F03A9 AS SmallDateTime), 13, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (99, 3817, N'Respaldo y formateo de equipo', CAST(0xA75F03AA AS SmallDateTime), 8, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (100, 3580, N'Configuracion de perfil', CAST(0xA7600241 AS SmallDateTime), 6, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (101, 3580, N'Formateo y configuracion de equipo', CAST(0xA7600378 AS SmallDateTime), 6, 1, NULL, 23)
INSERT [dbo].[SolicitudServicio] ([SolicitudServicioID], [PersonalID], [DescripcionSolicitudServicio], [FechaSolicitudServicio], [AreaServicioDetalleID], [EstatusSolicitudServicioID], [FechaFinalizacionSolicitudServicio], [SeguridadUsuarioDatosID]) VALUES (102, 3774, N'Configurar impresora ', CAST(0xA761022E AS SmallDateTime), 1, 1, NULL, 23)
SET IDENTITY_INSERT [dbo].[SolicitudServicio] OFF
/****** Object:  Table [dbo].[SolicitudServicioDetalle]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SolicitudServicioDetalle](
	[SolicitudServicioDetalleID] [int] IDENTITY(1,1) NOT NULL,
	[SolicitudServicioID] [int] NOT NULL,
	[SeguridadUsuarioDatosID] [int] NOT NULL,
	[FechaAsignacionTecnico] [smalldatetime] NOT NULL,
	[ObservacionTecnico] [varchar](190) NOT NULL,
	[MinutosServicioTecnico] [int] NOT NULL,
	[EstatusSolicitudServicioID] [int] NOT NULL,
	[FechaFinalizacionTecnico] [smalldatetime] NULL,
 CONSTRAINT [PK_SolicitudServicioDetalle] PRIMARY KEY CLUSTERED 
(
	[SolicitudServicioDetalleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SolicitudServicioDetalle] ON
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (90, 93, 7, CAST(0xA75F0281 AS SmallDateTime), N'N/D', 0, 2, NULL)
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (91, 94, 13, CAST(0xA75F0345 AS SmallDateTime), N'N/D', 0, 2, NULL)
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (92, 95, 22, CAST(0xA75F03A7 AS SmallDateTime), N'N/D', 0, 3, CAST(0xA7610251 AS SmallDateTime))
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (93, 98, 24, CAST(0xA7600241 AS SmallDateTime), N'N/D', 0, 2, NULL)
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (94, 99, 24, CAST(0xA7600242 AS SmallDateTime), N'N/D', 0, 2, NULL)
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (95, 100, 18, CAST(0xA7600242 AS SmallDateTime), N'N/D', 0, 2, NULL)
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (96, 101, 14, CAST(0xA7600378 AS SmallDateTime), N'N/D', 0, 2, NULL)
INSERT [dbo].[SolicitudServicioDetalle] ([SolicitudServicioDetalleID], [SolicitudServicioID], [SeguridadUsuarioDatosID], [FechaAsignacionTecnico], [ObservacionTecnico], [MinutosServicioTecnico], [EstatusSolicitudServicioID], [FechaFinalizacionTecnico]) VALUES (97, 102, 19, CAST(0xA761022F AS SmallDateTime), N'N/D', 0, 2, NULL)
SET IDENTITY_INSERT [dbo].[SolicitudServicioDetalle] OFF
/****** Object:  Table [dbo].[SeguridadObjetoAcceso]    Script Date: 04/26/2017 10:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguridadObjetoAcceso](
	[SeguridadObjetoAccesoID] [int] IDENTITY(1,1) NOT NULL,
	[SeguridadGrupoID] [int] NOT NULL,
	[SeguridadObjetoID] [int] NOT NULL,
 CONSTRAINT [PK_SeguridadObjetoAcceso] PRIMARY KEY CLUSTERED 
(
	[SeguridadObjetoAccesoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] ON
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (5, 1, 5)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (6, 2, 1)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (8, 3, 2)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (9, 5, 3)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (11, 6, 4)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (12, 9, 5)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (14, 5, 4)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (33, 1, 9)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (34, 1, 2)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (35, 1, 1)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (36, 1, 4)
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] OFF
/****** Object:  StoredProcedure [dbo].[usp_ConsultaServicios_ObtenerEstatusTodos]    Script Date: 04/26/2017 10:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ConsultaServicios_ObtenerEstatusTodos]

AS	
BEGIN
SELECT    *
FROM         dbo.EstatusSolicitudServicio

ORDER BY EstatusSolicitudServicioID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignarEstatus_ObtenerEstatus]    Script Date: 04/26/2017 10:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignarEstatus_ObtenerEstatus]

AS	
BEGIN
SELECT     TOP (100) PERCENT EstatusSolicitudServicioID, NombreEstatusSolicitudServicio
FROM         dbo.EstatusSolicitudServicio
WHERE     (EstatusSolicitudServicioID <> 1 AND EstatusSolicitudServicioID <> 2)
ORDER BY EstatusSolicitudServicioID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignarTecnico_ObtenerAsignacionesTecnicos]    Script Date: 04/26/2017 10:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignarTecnico_ObtenerAsignacionesTecnicos]
(
	@SolicitudServicioID int
)
AS	
BEGIN
SELECT     TOP (100) PERCENT dbo.SolicitudServicioDetalle.FechaAsignacionTecnico, dbo.Personal.NombrePersonal, dbo.SolicitudServicio.DescripcionSolicitudServicio, 
                      dbo.Gerencia.NombreGerencia, dbo.SolicitudServicio.FechaSolicitudServicio, dbo.Personal.NumeroExtension, 
                      dbo.SeguridadUsuarioDatos.NombreCompleto AS AtencionTelefonica, dbo.SolicitudServicio.SolicitudServicioID, 
                      dbo.SolicitudServicioDetalle.SolicitudServicioDetalleID, dbo.Division.DivisionID, dbo.Division.GerenciaID, dbo.Personal.PersonalID, 
                      dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio, SeguridadUsuarioDatos_1.NombreCompleto AS Tecnico, 
                      dbo.SolicitudServicioDetalle.ObservacionTecnico, dbo.SolicitudServicioDetalle.SeguridadUsuarioDatosID, 
                      SeguridadUsuarioDatos_1.SeguridadUsuarioDatosID AS CodTecnico, dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID

FROM         dbo.SeguridadUsuarioDatos INNER JOIN
                      dbo.SolicitudServicio INNER JOIN
                      dbo.SolicitudServicioDetalle ON dbo.SolicitudServicio.SolicitudServicioID = dbo.SolicitudServicioDetalle.SolicitudServicioID INNER JOIN
                      dbo.Gerencia INNER JOIN
                      dbo.Division ON dbo.Gerencia.GerenciaID = dbo.Division.GerenciaID INNER JOIN
                      dbo.Personal ON dbo.Division.DivisionID = dbo.Personal.DivisionID ON dbo.SolicitudServicio.PersonalID = dbo.Personal.PersonalID ON 
                      dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = dbo.SolicitudServicio.SeguridadUsuarioDatosID INNER JOIN
                      dbo.EstatusSolicitudServicio ON dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID = dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID INNER JOIN
                      dbo.SeguridadUsuarioDatos AS SeguridadUsuarioDatos_1 ON 
                      dbo.SolicitudServicioDetalle.SeguridadUsuarioDatosID = SeguridadUsuarioDatos_1.SeguridadUsuarioDatosID
WHERE     (dbo.SolicitudServicio.SolicitudServicioID = @SolicitudServicioID)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ConsultaServicio_ObtenerServicios]    Script Date: 04/26/2017 10:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ConsultaServicio_ObtenerServicios]
(
	@FechaDesde varchar(200),
	@FechaHasta varchar (200),
	@DescripcionEstatus varchar(200)
)
AS	
BEGIN

SELECT     TOP (100) PERCENT dbo.SolicitudServicio.FechaSolicitudServicio, dbo.Personal.NombrePersonal, dbo.SolicitudServicio.DescripcionSolicitudServicio, 
                      SeguridadUsuarioDatos_1.NombreCompleto AS TecnicoAsignado, dbo.SolicitudServicioDetalle.FechaAsignacionTecnico, dbo.SolicitudServicioDetalle.ObservacionTecnico, 
                      dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio AS EstatusTecnico, dbo.SolicitudServicio.SolicitudServicioID, dbo.SolicitudServicio.PersonalID, 
                      dbo.SolicitudServicio.EstatusSolicitudServicioID, dbo.Gerencia.NombreGerencia, dbo.Gerencia.GerenciaID, dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID AS EstatusDetalle, 
                      dbo.SolicitudServicioDetalle.FechaFinalizacionTecnico, CONVERT(VARCHAR(10), dbo.SolicitudServicio.FechaSolicitudServicio, 103) AS FechaDesde, 
                      ISNULL(dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio, 'EN COLA') AS DescripcionEstatus, dbo.SeguridadUsuarioDatos.NombreCompleto AS CallCenter, 
                      dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID
FROM         dbo.EstatusSolicitudServicio AS EstatusSolicitudServicio_1 INNER JOIN
                      dbo.SolicitudServicio INNER JOIN
                      dbo.Personal ON dbo.SolicitudServicio.PersonalID = dbo.Personal.PersonalID ON 
                      EstatusSolicitudServicio_1.EstatusSolicitudServicioID = dbo.SolicitudServicio.EstatusSolicitudServicioID INNER JOIN
                      dbo.Division ON dbo.Personal.DivisionID = dbo.Division.DivisionID INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SolicitudServicio.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID LEFT OUTER JOIN
                      dbo.SeguridadUsuarioDatos AS SeguridadUsuarioDatos_1 INNER JOIN
                      dbo.SolicitudServicioDetalle ON SeguridadUsuarioDatos_1.SeguridadUsuarioDatosID = dbo.SolicitudServicioDetalle.SeguridadUsuarioDatosID INNER JOIN
                      dbo.EstatusSolicitudServicio ON dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID = dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID ON 
                      dbo.SolicitudServicio.SolicitudServicioID = dbo.SolicitudServicioDetalle.SolicitudServicioID
WHERE     (CONVERT(VARCHAR(10), dbo.SolicitudServicio.FechaSolicitudServicio, 103) 
BETWEEN @FechaDesde AND @FechaHasta) 
AND 
(ISNULL(dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio, 'EN COLA') = @DescripcionEstatus)
ORDER BY dbo.SolicitudServicio.FechaSolicitudServicio


END
GO
/****** Object:  View [dbo].[AsignacionTecnico]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AsignacionTecnico]
AS
SELECT     TOP (100) PERCENT ' Fecha [' + CONVERT(varchar, dbo.SolicitudServicio.FechaSolicitudServicio) + ']  Caso [' + CONVERT(varchar, dbo.SolicitudServicio.SolicitudServicioID) 
                      + ']  Solicitante [' + dbo.Personal.NombrePersonal + '] Gerencia [' + dbo.Gerencia.NombreGerencia + '] N° ' + CONVERT(varchar, dbo.Personal.NumeroExtension) 
                      + ' Reporta [' + dbo.SolicitudServicio.DescripcionSolicitudServicio + ']' AS Caso, dbo.SolicitudServicio.FechaSolicitudServicio, dbo.SolicitudServicio.SolicitudServicioID, 
                      dbo.Personal.NombrePersonal, dbo.Gerencia.NombreGerencia, dbo.Personal.NumeroExtension, dbo.SolicitudServicio.DescripcionSolicitudServicio, 
                      dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio, dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID, dbo.SolicitudServicioDetalle.SolicitudServicioDetalleID, 
                      dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.NombreCompleto
FROM         dbo.SolicitudServicio INNER JOIN
                      dbo.SolicitudServicioDetalle ON dbo.SolicitudServicio.SolicitudServicioID = dbo.SolicitudServicioDetalle.SolicitudServicioID INNER JOIN
                      dbo.Personal ON dbo.SolicitudServicio.PersonalID = dbo.Personal.PersonalID INNER JOIN
                      dbo.Division ON dbo.Personal.DivisionID = dbo.Division.DivisionID INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.EstatusSolicitudServicio ON dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID = dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SolicitudServicioDetalle.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID
WHERE     (dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID <> 5) AND (dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID <> 4) AND (dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = 1)
ORDER BY dbo.SolicitudServicio.FechaSolicitudServicio
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[19] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SolicitudServicio"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SolicitudServicioDetalle"
            Begin Extent = 
               Top = 6
               Left = 324
               Bottom = 126
               Right = 536
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personal"
            Begin Extent = 
               Top = 6
               Left = 574
               Bottom = 126
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Division"
            Begin Extent = 
               Top = 6
               Left = 785
               Bottom = 111
               Right = 947
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Gerencia"
            Begin Extent = 
               Top = 114
               Left = 785
               Bottom = 204
               Right = 953
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EstatusSolicitudServicio"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 216
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SeguridadUsuarioDatos"
            Begin Extent = 
               Top = 126
               Left = 314
               Bottom = 246
               Rig' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AsignacionTecnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ht = 526
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 6210
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5490
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AsignacionTecnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AsignacionTecnico'
GO
/****** Object:  StoredProcedure [dbo].[usp_AtencionCliente_ObtenerServicios]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AtencionCliente_ObtenerServicios]
(
	@PersonalID int
)
AS	
BEGIN
SELECT     TOP (100) PERCENT dbo.SolicitudServicio.FechaSolicitudServicio, dbo.SolicitudServicio.DescripcionSolicitudServicio, dbo.SolicitudServicio.FechaFinalizacionSolicitudServicio, 
                      dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio, dbo.SeguridadUsuarioDatos.NombreCompleto AS AtencionTelefonica, dbo.SolicitudServicio.PersonalID, 
                      dbo.SolicitudServicio.SolicitudServicioID
FROM         dbo.AreaServicio INNER JOIN
                      dbo.AreaServicioDetalle ON dbo.AreaServicio.AreaServicioID = dbo.AreaServicioDetalle.AreaServicioID INNER JOIN
                      dbo.SolicitudServicio ON dbo.AreaServicioDetalle.AreaServicioDetalleID = dbo.SolicitudServicio.AreaServicioDetalleID INNER JOIN
                      dbo.EstatusSolicitudServicio ON dbo.SolicitudServicio.EstatusSolicitudServicioID = dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SolicitudServicio.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID
WHERE     (dbo.SolicitudServicio.PersonalID = @PersonalID)
ORDER BY dbo.SolicitudServicio.FechaSolicitudServicio DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignacionesTecnico_ObtenerAsignacionesTecnico]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignacionesTecnico_ObtenerAsignacionesTecnico]
(
	@CodigoTecnico int
)
AS	
BEGIN
SELECT     TOP (100) PERCENT ' Fecha [' + CONVERT(varchar, dbo.SolicitudServicio.FechaSolicitudServicio) + ']  Caso [' + CONVERT(varchar, dbo.SolicitudServicio.SolicitudServicioID) 
                      + ']  Solicitante [' + dbo.Personal.NombrePersonal + '] Gerencia [' + dbo.Gerencia.NombreGerencia + '] N° ' + CONVERT(varchar, dbo.Personal.NumeroExtension) 
                      + ' Reporta [' + dbo.SolicitudServicio.DescripcionSolicitudServicio + ']' AS Caso, dbo.SolicitudServicio.FechaSolicitudServicio, dbo.SolicitudServicio.SolicitudServicioID, 
                      dbo.Personal.NombrePersonal, dbo.Gerencia.NombreGerencia, dbo.Personal.NumeroExtension, dbo.SolicitudServicio.DescripcionSolicitudServicio, 
                      dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio, dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID, dbo.SolicitudServicioDetalle.SolicitudServicioDetalleID, 
                      dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.NombreCompleto
FROM         dbo.SolicitudServicio INNER JOIN
                      dbo.SolicitudServicioDetalle ON dbo.SolicitudServicio.SolicitudServicioID = dbo.SolicitudServicioDetalle.SolicitudServicioID INNER JOIN
                      dbo.Personal ON dbo.SolicitudServicio.PersonalID = dbo.Personal.PersonalID INNER JOIN
                      dbo.Division ON dbo.Personal.DivisionID = dbo.Division.DivisionID INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.EstatusSolicitudServicio ON dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID = dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SolicitudServicioDetalle.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID
WHERE     (dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID <> 5) AND (dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID <> 4)
AND (dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = @CodigoTecnico)

ORDER BY dbo.SolicitudServicio.FechaSolicitudServicio

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignacionApoyo_ObtenerServicios]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignacionApoyo_ObtenerServicios]

AS	
BEGIN
SELECT     TOP (100) PERCENT dbo.SolicitudServicio.FechaSolicitudServicio, dbo.Personal.NombrePersonal, dbo.SolicitudServicio.DescripcionSolicitudServicio, 
                      SeguridadUsuarioDatos_1.NombreCompleto AS TecnicoAsignado, dbo.SolicitudServicioDetalle.FechaAsignacionTecnico, dbo.SolicitudServicioDetalle.ObservacionTecnico, 
                      dbo.EstatusSolicitudServicio.NombreEstatusSolicitudServicio AS EstatusTecnico, dbo.SolicitudServicio.SolicitudServicioID, dbo.SolicitudServicio.PersonalID, 
                      dbo.SolicitudServicio.EstatusSolicitudServicioID, dbo.Gerencia.NombreGerencia, dbo.Gerencia.GerenciaID, dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID AS EstatusDetalle, 
                      dbo.SolicitudServicioDetalle.FechaFinalizacionTecnico, dbo.SeguridadUsuarioDatos.NombreCompleto AS CallCenter
FROM         dbo.EstatusSolicitudServicio AS EstatusSolicitudServicio_1 INNER JOIN
                      dbo.SolicitudServicio INNER JOIN
                      dbo.Personal ON dbo.SolicitudServicio.PersonalID = dbo.Personal.PersonalID ON 
                      EstatusSolicitudServicio_1.EstatusSolicitudServicioID = dbo.SolicitudServicio.EstatusSolicitudServicioID INNER JOIN
                      dbo.Division ON dbo.Personal.DivisionID = dbo.Division.DivisionID INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SolicitudServicio.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID LEFT OUTER JOIN
                      dbo.SeguridadUsuarioDatos AS SeguridadUsuarioDatos_1 INNER JOIN
                      dbo.SolicitudServicioDetalle ON SeguridadUsuarioDatos_1.SeguridadUsuarioDatosID = dbo.SolicitudServicioDetalle.SeguridadUsuarioDatosID INNER JOIN
                      dbo.EstatusSolicitudServicio ON dbo.SolicitudServicioDetalle.EstatusSolicitudServicioID = dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID ON 
                      dbo.SolicitudServicio.SolicitudServicioID = dbo.SolicitudServicioDetalle.SolicitudServicioID
WHERE     (dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID <> 5) OR
                      (dbo.EstatusSolicitudServicio.EstatusSolicitudServicioID IS NULL)
ORDER BY dbo.SolicitudServicio.FechaSolicitudServicio
END
GO
/****** Object:  View [dbo].[View_1]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT     dbo.SeguridadGrupo.NombreGrupo, dbo.SeguridadObjeto.NombreObjeto, dbo.SeguridadGrupo.SeguridadGrupoID, dbo.SeguridadObjeto.SeguridadObjetoID, 
                      dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.NombreCompleto
FROM         dbo.SeguridadGrupo INNER JOIN
                      dbo.SeguridadObjetoAcceso ON dbo.SeguridadGrupo.SeguridadGrupoID = dbo.SeguridadObjetoAcceso.SeguridadGrupoID INNER JOIN
                      dbo.SeguridadObjeto ON dbo.SeguridadObjetoAcceso.SeguridadObjetoID = dbo.SeguridadObjeto.SeguridadObjetoID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SeguridadGrupo.SeguridadGrupoID = dbo.SeguridadUsuarioDatos.SeguridadGrupoID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[10] 2[43] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SeguridadGrupo"
            Begin Extent = 
               Top = 0
               Left = 74
               Bottom = 105
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SeguridadObjeto"
            Begin Extent = 
               Top = 0
               Left = 509
               Bottom = 90
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SeguridadObjetoAcceso"
            Begin Extent = 
               Top = 9
               Left = 245
               Bottom = 114
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SeguridadUsuarioDatos"
            Begin Extent = 
               Top = 86
               Left = 10
               Bottom = 277
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 3240
         Width = 3000
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3315
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ObtenerLogin]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadUsuario_ObtenerLogin]

	@LoginUsuario varchar(100)

AS	
BEGIN
	SELECT  *
	FROM   dbo.SeguridadUsuarioDatos
	WHERE     (LoginUsuario = @LoginUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadUsuario_Insertar]
	(
		@SeguridadUsuarioDatosID int,
		@LoginUsuario varchar(200),
		@ClaveUsuario varchar(200),
		@NombreCompleto varchar(300),
		@DescripcionUsuario varchar(300),
		@SeguridadGrupoID int,
		@UsuarioTecnico int,
		@EstatusUsuario varchar(200)
	)
AS
BEGIN
	INSERT INTO SeguridadUsuarioDatos
	(
		LoginUsuario,
		ClaveUsuario,
		NombreCompleto,
		DescripcionUsuario,
		SeguridadGrupoID,
		UsuarioTecnico,
		EstatusUsuario
	)
	VALUES
	(
		@LoginUsuario,
		@ClaveUsuario,
		@NombreCompleto,
		@DescripcionUsuario,
		@SeguridadGrupoID,
		@UsuarioTecnico,
		@EstatusUsuario
		
	)
		select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ActualizarClave]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadUsuario_ActualizarClave]
(
	@SeguridadUsuarioDatosID int,
	@ClaveUsuario varchar(200)
)
AS
BEGIN
	UPDATE SeguridadUsuarioDatos set 
	ClaveUsuario=@ClaveUsuario

	where SeguridadUsuarioDatosID= @SeguridadUsuarioDatosID
	
	select @@ROWCOUNT as CantidadAfectada
end
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Actualizar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadUsuario_Actualizar]
(
	@SeguridadUsuarioDatosID int,
	@LoginUsuario varchar(200),
	@ClaveUsuario varchar(200),
	@NombreCompleto varchar(300),
	@DescripcionUsuario varchar(300),
	@SeguridadGrupoID int,
	@UsuarioTecnico int,
	@EstatusUsuario varchar(200)
)
AS
BEGIN
	UPDATE SeguridadUsuarioDatos set 
	LoginUsuario=@LoginUsuario,
	ClaveUsuario=@ClaveUsuario,
	NombreCompleto=@NombreCompleto,
	DescripcionUsuario=@DescripcionUsuario,
	SeguridadGrupoID =@SeguridadGrupoID,
	UsuarioTecnico = @UsuarioTecnico,
	EstatusUsuario = @EstatusUsuario
	
	where SeguridadUsuarioDatosID= @SeguridadUsuarioDatosID
	
	select @@ROWCOUNT as CantidadAfectada
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAdministrador]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Seguridad_ObtenerAdministrador]
(
	@SeguridadUsuarioDatosID int
)

AS	
BEGIN
SELECT     dbo.SeguridadGrupo.NombreGrupo, dbo.SeguridadGrupo.SeguridadGrupoID, dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.NombreCompleto
FROM         dbo.SeguridadGrupo INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SeguridadGrupo.SeguridadGrupoID = dbo.SeguridadUsuarioDatos.SeguridadGrupoID
WHERE     (dbo.SeguridadGrupo.SeguridadGrupoID = 10) AND (dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = @SeguridadUsuarioDatosID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAccesoObjeto]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Seguridad_ObtenerAccesoObjeto]
(
	@SeguridadUsuarioDatosID int,
	@SeguridadObjetoID int
)

AS	
BEGIN
SELECT     dbo.SeguridadGrupo.NombreGrupo, dbo.SeguridadObjeto.NombreObjeto, dbo.SeguridadGrupo.SeguridadGrupoID, dbo.SeguridadObjeto.SeguridadObjetoID, 
                      dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.NombreCompleto
FROM         dbo.SeguridadGrupo INNER JOIN
                      dbo.SeguridadObjetoAcceso ON dbo.SeguridadGrupo.SeguridadGrupoID = dbo.SeguridadObjetoAcceso.SeguridadGrupoID INNER JOIN
                      dbo.SeguridadObjeto ON dbo.SeguridadObjetoAcceso.SeguridadObjetoID = dbo.SeguridadObjeto.SeguridadObjetoID INNER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.SeguridadGrupo.SeguridadGrupoID = dbo.SeguridadUsuarioDatos.SeguridadGrupoID
WHERE     (dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = @SeguridadUsuarioDatosID) AND (dbo.SeguridadObjeto.SeguridadObjetoID = @SeguridadObjetoID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Login_ValidarLogin]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Login_ValidarLogin]
	-- Add the parameters for the stored procedure here
	@LoginUsuario varchar(500),
	@ClaveUsuario varchar(150)
	
AS

Select * from SeguridadUsuarioDatos with(nolock) where LoginUsuario = @LoginUsuario and ClaveUsuario=@ClaveUsuario
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerUsuarios]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerUsuarios]

	@Query varchar(100)

AS	
BEGIN
	SELECT     TOP (100) PERCENT SeguridadUsuarioDatosID, NombreCompleto, LoginUsuario, DescripcionUsuario, SeguridadGrupoID, ClaveUsuario, UsuarioTecnico, EstatusUsuario
	FROM         dbo.SeguridadUsuarioDatos
	WHERE     (NombreCompleto like '%'+@Query+'%')
	ORDER BY NombreCompleto
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetoGrupo]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetoGrupo]
(
	@SeguridadGrupoID int,
	@SeguridadObjetoID int
)
AS	
BEGIN
SELECT    *
FROM         SeguridadObjetoAcceso
WHERE     (SeguridadGrupoID = @SeguridadGrupoID) AND (SeguridadObjetoID = @SeguridadObjetoID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadObjetoGrupo_Insertar]
	(
		@SeguridadGrupoID int,
		@SeguridadObjetoID int
	)
AS
BEGIN
	insert into SeguridadObjetoAcceso 
	(
		SeguridadGrupoID, SeguridadObjetoID
	) 
	values
	(
		@SeguridadGrupoID,
		@SeguridadObjetoID
	)
	select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_EliminarObjetoGrupo]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadObjetoGrupo_EliminarObjetoGrupo]
	 @SeguridadObjetoAccesoID int
AS
BEGIN
	DELETE FROM SeguridadObjetoAcceso WHERE SeguridadObjetoAccesoID = @SeguridadObjetoAccesoID
	select @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetosGrupo]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetosGrupo]
(
	@SeguridadGrupoID int
)
AS	
BEGIN
SELECT     TOP (100) PERCENT dbo.SeguridadGrupo.NombreGrupo, dbo.SeguridadObjeto.NombreObjeto, dbo.SeguridadObjetoAcceso.SeguridadGrupoID, 
                      dbo.SeguridadObjetoAcceso.SeguridadObjetoID, dbo.SeguridadGrupo.DescripcionGrupo, dbo.SeguridadObjetoAcceso.SeguridadObjetoAccesoID
FROM         dbo.SeguridadObjetoAcceso INNER JOIN
                      dbo.SeguridadObjeto ON dbo.SeguridadObjetoAcceso.SeguridadObjetoID = dbo.SeguridadObjeto.SeguridadObjetoID INNER JOIN
                      dbo.SeguridadGrupo ON dbo.SeguridadObjetoAcceso.SeguridadGrupoID = dbo.SeguridadGrupo.SeguridadGrupoID
WHERE     (dbo.SeguridadObjetoAcceso.SeguridadGrupoID = @SeguridadGrupoID)
ORDER BY dbo.SeguridadGrupo.NombreGrupo, dbo.SeguridadObjeto.NombreObjeto

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerPersonal]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerPersonal] 
	@Query varchar(100)
AS
BEGIN
SELECT     dbo.Personal.Cedula, dbo.Gerencia.GerenciaID, dbo.Division.NombreDivision, dbo.Gerencia.NombreGerencia, dbo.Personal.PersonalID, dbo.Personal.NombrePersonal, dbo.Personal.DivisionID, 
                      dbo.Personal.NumeroExtension, dbo.Personal.EstatusPersonal
FROM         dbo.Division INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.Personal ON dbo.Division.DivisionID = dbo.Personal.DivisionID
WHERE     (dbo.Personal.Cedula  Like '%'+@Query+'%')
 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerDetallePersonal]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerDetallePersonal]

	@Query varchar(100)

AS	
BEGIN
SELECT     dbo.Personal.Cedula, dbo.Gerencia.GerenciaID, dbo.Division.NombreDivision, dbo.Gerencia.NombreGerencia, dbo.Personal.PersonalID, dbo.Personal.NombrePersonal, dbo.Personal.DivisionID, 
                      dbo.Personal.NumeroExtension, dbo.Personal.EstatusPersonal, CONVERT(varchar, dbo.Personal.Cedula) 
                      + ' - ' + dbo.Personal.NombrePersonal + ' - ' + dbo.Gerencia.NombreGerencia + ' - ' + dbo.Division.NombreDivision + ' Extensión ' + dbo.Personal.NumeroExtension AS Descripcion
FROM         dbo.Division INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.Personal ON dbo.Division.DivisionID = dbo.Personal.DivisionID
	where 
	    CONVERT(varchar, Cedula) like '%'+@Query+'%'
	    or 
	   CONVERT(varchar, NombrePersonal) like '%'+@Query+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Personal_ObtenerPersonal]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Personal_ObtenerPersonal]
(
	@Cedula int
)
AS	
BEGIN
SELECT     dbo.Personal.Cedula, dbo.Gerencia.GerenciaID, dbo.Division.NombreDivision, dbo.Gerencia.NombreGerencia, dbo.Personal.PersonalID, dbo.Personal.NombrePersonal, dbo.Personal.DivisionID, 
                      dbo.Personal.NumeroExtension, dbo.Personal.EstatusPersonal
FROM         dbo.Division INNER JOIN
                      dbo.Gerencia ON dbo.Division.GerenciaID = dbo.Gerencia.GerenciaID INNER JOIN
                      dbo.Personal ON dbo.Division.DivisionID = dbo.Personal.DivisionID
WHERE     (dbo.Personal.Cedula = @Cedula)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Personal_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Personal_Insertar]
	(
		@Cedula int,
		@NombrePersonal varchar(100),
		@DivisionID int,
		@NumeroExtension varchar (12),
		@EstatusPersonal varchar (12)
 		
	)
AS
BEGIN
	insert into Personal (Cedula, NombrePersonal, DivisionID,NumeroExtension, EstatusPersonal) values(@Cedula,@NombrePersonal, @DivisionID, @NumeroExtension, @EstatusPersonal)
	
	select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_Personal_Actualizar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Personal_Actualizar]
(
   @Id int,
   @Cedula int,
   @NombrePersonal varchar(200),
   @DivisionID int,
   @NumeroExtension varchar(200),
   @EstatusPersonal varchar(12)
)
AS
BEGIN
	UPDATE Personal set 
	Cedula=@Cedula,
	NombrePersonal=@NombrePersonal,
	DivisionID=@DivisionID,
	NumeroExtension=@NumeroExtension,
	EstatusPersonal =@EstatusPersonal
	
	where PersonalID=@Id
	
	select @@ROWCOUNT as CantidadAfectada
end
GO
/****** Object:  StoredProcedure [dbo].[usp_AtencionCliente_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AtencionCliente_Insertar]
	(
		@PersonalID int,
		@DescripcionSolicitudServicio varchar(2000),
		@AreaServicioDetalleID int,
		@EstatusSolicitudServicioID int,
		@SeguridadUsuarioDatosID int
 		
	)
AS
BEGIN
	insert into SolicitudServicio (PersonalID, DescripcionSolicitudServicio, AreaServicioDetalleID,EstatusSolicitudServicioID, SeguridadUsuarioDatosID) 
	values(@PersonalID,@DescripcionSolicitudServicio, @AreaServicioDetalleID, @EstatusSolicitudServicioID, @SeguridadUsuarioDatosID)
	
	select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_AtencionCliente_EliminarServicio]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AtencionCliente_EliminarServicio]
	 @SolicitudServicioID int
AS
BEGIN
	DELETE FROM SolicitudServicio WHERE SolicitudServicioID = @SolicitudServicioID
	select @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignarTecnico_ObtenerAsignacionTecnico]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignarTecnico_ObtenerAsignacionTecnico]
(
	@SolicitudServicioID int,
	@SeguridadUsuarioDatosID int
)
AS	
BEGIN
SELECT     SolicitudServicioID, SeguridadUsuarioDatosID
FROM         dbo.SolicitudServicioDetalle
WHERE     (SolicitudServicioID = @SolicitudServicioID) AND (SeguridadUsuarioDatosID = @SeguridadUsuarioDatosID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignacionesTecnico_ActualizarEstatus]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignacionesTecnico_ActualizarEstatus]
(
	@SolicitudServicioDetalleID int,
	@ObservacionTecnico varchar(5000),
	@MinutosServicioTecnico int,
	@EstatusSolicitudServicioID int,
	@FechaFinalizacionTecnico varchar (100)
)

AS	
BEGIN
	UPDATE SolicitudServicioDetalle 
	SET ObservacionTecnico = @ObservacionTecnico, 
	MinutosServicioTecnico = @MinutosServicioTecnico,
	EstatusSolicitudServicioID =@EstatusSolicitudServicioID,
	FechaFinalizacionTecnico = @FechaFinalizacionTecnico
	WHERE SolicitudServicioDetalleID =@SolicitudServicioDetalleID
END
GO
/****** Object:  View [dbo].[CasosPendientes]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CasosPendientes]
AS
SELECT     SeguridadUsuarioDatosID, SolicitudServicioDetalleID, COUNT(SolicitudServicioID) AS CasosPendientes, EstatusSolicitudServicioID, SolicitudServicioID
FROM         dbo.SolicitudServicioDetalle
GROUP BY SeguridadUsuarioDatosID, SolicitudServicioDetalleID, EstatusSolicitudServicioID, SolicitudServicioID
HAVING      (EstatusSolicitudServicioID <> 5)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SolicitudServicioDetalle"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 279
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1935
         Width = 2160
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3930
         Alias = 1455
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CasosPendientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CasosPendientes'
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignarTecnico_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignarTecnico_Insertar]
	(
		@SolicitudServicioID int,
		@SeguridadUsuarioDatosID int,
		@ObservacionTecnico varchar(300),
		@MinutosServicioTecnico int,
		@EstatusSolicitudServicioID int
	)
AS
BEGIN
	insert into SolicitudServicioDetalle (SolicitudServicioID, SeguridadUsuarioDatosID, 
	ObservacionTecnico,MinutosServicioTecnico, EstatusSolicitudServicioID) 
	values(@SolicitudServicioID,@SeguridadUsuarioDatosID, @ObservacionTecnico, @MinutosServicioTecnico, @EstatusSolicitudServicioID)
	select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignarTecnico_EliminarAsignacion]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignarTecnico_EliminarAsignacion]
	 @SolicitudServicioDetalleID int
AS
BEGIN
	DELETE FROM SolicitudServicioDetalle WHERE SolicitudServicioDetalleID = @SolicitudServicioDetalleID
	select @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AsignarEstatus_ActualizarEstatus]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AsignarEstatus_ActualizarEstatus]
(
	@SolicitudServicioID int,
	@SeguridadUsuarioDatosID int,
	@EstatusSolicitudServicioID int
)

AS	
BEGIN
	UPDATE SolicitudServicioDetalle SET EstatusSolicitudServicioID =@EstatusSolicitudServicioID 
	WHERE SolicitudServicioID =@SolicitudServicioID AND SeguridadUsuarioDatosID = @SeguridadUsuarioDatosID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerObjetos]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerObjetos]

	@Query varchar(100)

AS	
BEGIN
	SELECT    *
	FROM     SeguridadObjeto
	WHERE     (NombreObjeto like '%'+@Query+'%')
	ORDER BY NombreObjeto
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadObjeto_Insertar]
	(
		@SeguridadObjetoID int,
		@NombreObjeto varchar(200)
	)
AS
BEGIN
	insert into SeguridadObjeto (NombreObjeto) 
	values(@NombreObjeto)
	select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Actualizar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadObjeto_Actualizar]
(
	@SeguridadObjetoID int,
	@NombreObjeto varchar(200)
)
AS
BEGIN
	UPDATE SeguridadObjeto set 
	NombreObjeto=@NombreObjeto
	
	where SeguridadObjetoID= @SeguridadObjetoID
	
	select @@ROWCOUNT as CantidadAfectada
end
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Insertar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadGrupo_Insertar]
	(
		@SeguridadGrupoID int,
		@NombreGrupo varchar(200),
		@DescripcionGrupo varchar(200)
	)
AS
BEGIN
	insert into SeguridadGrupo (NombreGrupo, DescripcionGrupo) 
	values(@NombreGrupo,@DescripcionGrupo)
	select @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Actualizar]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeguridadGrupo_Actualizar]
(
	@SeguridadGrupoID int,
	@NombreGrupo varchar(200),
	@DescripcionGrupo varchar(200)
)
AS
BEGIN
	UPDATE SeguridadGrupo set 
	NombreGrupo=@NombreGrupo,
	DescripcionGrupo=@DescripcionGrupo
	
	where SeguridadGrupoID= @SeguridadGrupoID
	
	select @@ROWCOUNT as CantidadAfectada
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerGrupos]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerGrupos]

	@Query varchar(100)

AS	
BEGIN
	SELECT    *
	FROM     SeguridadGrupo
	WHERE     (NombreGrupo like '%'+@Query+'%')
	ORDER BY NombreGrupo
END
GO
/****** Object:  View [dbo].[CasosPorTecnico]    Script Date: 04/26/2017 10:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CasosPorTecnico]
AS
SELECT     dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.NombreCompleto, ISNULL(dbo.CasosPendientes.CasosPendientes, 0) AS CasosAsignados, 
                      dbo.SeguridadUsuarioDatos.UsuarioTecnico, dbo.CasosPendientes.EstatusSolicitudServicioID, dbo.CasosPendientes.SolicitudServicioID, dbo.SeguridadUsuarioDatos.EstatusUsuario
FROM         dbo.CasosPendientes RIGHT OUTER JOIN
                      dbo.SeguridadUsuarioDatos ON dbo.CasosPendientes.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID
WHERE     (dbo.SeguridadUsuarioDatos.UsuarioTecnico = 1) AND (dbo.SeguridadUsuarioDatos.EstatusUsuario = 'Activo')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[13] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SeguridadUsuarioDatos"
            Begin Extent = 
               Top = 24
               Left = 29
               Bottom = 296
               Right = 394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CasosPendientes"
            Begin Extent = 
               Top = 44
               Left = 502
               Bottom = 259
               Right = 808
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1830
         Width = 1500
         Width = 1845
         Width = 3210
         Width = 2595
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2070
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2760
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CasosPorTecnico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CasosPorTecnico'
GO
/****** Object:  Default [DF_AreaServicio_EstatusAreaServicio]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[AreaServicio] ADD  CONSTRAINT [DF_AreaServicio_EstatusAreaServicio]  DEFAULT ('Activo') FOR [EstatusAreaServicio]
GO
/****** Object:  Default [DF_SeguridadUsuarioDatos_UsuarioTecnico]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SeguridadUsuarioDatos] ADD  CONSTRAINT [DF_SeguridadUsuarioDatos_UsuarioTecnico]  DEFAULT ((0)) FOR [UsuarioTecnico]
GO
/****** Object:  Default [DF_SeguridadUsuarioDatos_EstatusUsuario]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SeguridadUsuarioDatos] ADD  CONSTRAINT [DF_SeguridadUsuarioDatos_EstatusUsuario]  DEFAULT ('Activo') FOR [EstatusUsuario]
GO
/****** Object:  Default [DF_AreaServicioDetalle_EstatusAreaServicioDetalle]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[AreaServicioDetalle] ADD  CONSTRAINT [DF_AreaServicioDetalle_EstatusAreaServicioDetalle]  DEFAULT ('Activo') FOR [EstatusAreaServicioDetalle]
GO
/****** Object:  Default [DF_Personal_NumeroExtension]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_NumeroExtension]  DEFAULT ('N/D') FOR [NumeroExtension]
GO
/****** Object:  Default [DF_Personal_EstatusPersonal]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_EstatusPersonal]  DEFAULT ('Activo') FOR [EstatusPersonal]
GO
/****** Object:  Default [DF_SolicitudServicio_FechaSolicitudServicio]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicio] ADD  CONSTRAINT [DF_SolicitudServicio_FechaSolicitudServicio]  DEFAULT (getdate()) FOR [FechaSolicitudServicio]
GO
/****** Object:  Default [DF_SolicitudServicioDetalle_FechaAsignacionTecnico]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicioDetalle] ADD  CONSTRAINT [DF_SolicitudServicioDetalle_FechaAsignacionTecnico]  DEFAULT (getdate()) FOR [FechaAsignacionTecnico]
GO
/****** Object:  Default [DF_SolicitudServicioDetalle_ObservacionTecnico]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicioDetalle] ADD  CONSTRAINT [DF_SolicitudServicioDetalle_ObservacionTecnico]  DEFAULT ('N/D') FOR [ObservacionTecnico]
GO
/****** Object:  Default [DF_SolicitudServicioDetalle_MinutosServicioTecnico]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicioDetalle] ADD  CONSTRAINT [DF_SolicitudServicioDetalle_MinutosServicioTecnico]  DEFAULT ((0)) FOR [MinutosServicioTecnico]
GO
/****** Object:  ForeignKey [FK_SeguridadUsuarioDatos_SeguridadGrupo]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SeguridadUsuarioDatos]  WITH CHECK ADD  CONSTRAINT [FK_SeguridadUsuarioDatos_SeguridadGrupo] FOREIGN KEY([SeguridadGrupoID])
REFERENCES [dbo].[SeguridadGrupo] ([SeguridadGrupoID])
GO
ALTER TABLE [dbo].[SeguridadUsuarioDatos] CHECK CONSTRAINT [FK_SeguridadUsuarioDatos_SeguridadGrupo]
GO
/****** Object:  ForeignKey [FK_AreaServicioDetalle_AreaServicio]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[AreaServicioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_AreaServicioDetalle_AreaServicio] FOREIGN KEY([AreaServicioID])
REFERENCES [dbo].[AreaServicio] ([AreaServicioID])
GO
ALTER TABLE [dbo].[AreaServicioDetalle] CHECK CONSTRAINT [FK_AreaServicioDetalle_AreaServicio]
GO
/****** Object:  ForeignKey [FK_Division_Gerencia]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [FK_Division_Gerencia] FOREIGN KEY([GerenciaID])
REFERENCES [dbo].[Gerencia] ([GerenciaID])
GO
ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [FK_Division_Gerencia]
GO
/****** Object:  ForeignKey [FK_Personal_Division]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Division] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[Division] ([DivisionID])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Division]
GO
/****** Object:  ForeignKey [FK_SolicitudServicio_AreaServicioDetalle]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudServicio_AreaServicioDetalle] FOREIGN KEY([AreaServicioDetalleID])
REFERENCES [dbo].[AreaServicioDetalle] ([AreaServicioDetalleID])
GO
ALTER TABLE [dbo].[SolicitudServicio] CHECK CONSTRAINT [FK_SolicitudServicio_AreaServicioDetalle]
GO
/****** Object:  ForeignKey [FK_SolicitudServicio_Personal]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicio]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudServicio_Personal] FOREIGN KEY([PersonalID])
REFERENCES [dbo].[Personal] ([PersonalID])
GO
ALTER TABLE [dbo].[SolicitudServicio] CHECK CONSTRAINT [FK_SolicitudServicio_Personal]
GO
/****** Object:  ForeignKey [FK_SolicitudServicioDetalle_EstatusSolicitudServicio]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudServicioDetalle_EstatusSolicitudServicio] FOREIGN KEY([EstatusSolicitudServicioID])
REFERENCES [dbo].[EstatusSolicitudServicio] ([EstatusSolicitudServicioID])
GO
ALTER TABLE [dbo].[SolicitudServicioDetalle] CHECK CONSTRAINT [FK_SolicitudServicioDetalle_EstatusSolicitudServicio]
GO
/****** Object:  ForeignKey [FK_SolicitudServicioDetalle_SeguridadUsuarioDatos]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudServicioDetalle_SeguridadUsuarioDatos] FOREIGN KEY([SeguridadUsuarioDatosID])
REFERENCES [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID])
GO
ALTER TABLE [dbo].[SolicitudServicioDetalle] CHECK CONSTRAINT [FK_SolicitudServicioDetalle_SeguridadUsuarioDatos]
GO
/****** Object:  ForeignKey [FK_SolicitudServicioDetalle_SolicitudServicio]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SolicitudServicioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudServicioDetalle_SolicitudServicio] FOREIGN KEY([SolicitudServicioID])
REFERENCES [dbo].[SolicitudServicio] ([SolicitudServicioID])
GO
ALTER TABLE [dbo].[SolicitudServicioDetalle] CHECK CONSTRAINT [FK_SolicitudServicioDetalle_SolicitudServicio]
GO
/****** Object:  ForeignKey [FK_SeguridadObjetoAcceso_SeguridadGrupo]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SeguridadObjetoAcceso]  WITH CHECK ADD  CONSTRAINT [FK_SeguridadObjetoAcceso_SeguridadGrupo] FOREIGN KEY([SeguridadGrupoID])
REFERENCES [dbo].[SeguridadGrupo] ([SeguridadGrupoID])
GO
ALTER TABLE [dbo].[SeguridadObjetoAcceso] CHECK CONSTRAINT [FK_SeguridadObjetoAcceso_SeguridadGrupo]
GO
/****** Object:  ForeignKey [FK_SeguridadObjetoAcceso_SeguridadObjeto]    Script Date: 04/26/2017 10:26:13 ******/
ALTER TABLE [dbo].[SeguridadObjetoAcceso]  WITH CHECK ADD  CONSTRAINT [FK_SeguridadObjetoAcceso_SeguridadObjeto] FOREIGN KEY([SeguridadObjetoID])
REFERENCES [dbo].[SeguridadObjeto] ([SeguridadObjetoID])
GO
ALTER TABLE [dbo].[SeguridadObjetoAcceso] CHECK CONSTRAINT [FK_SeguridadObjetoAcceso_SeguridadObjeto]
GO
