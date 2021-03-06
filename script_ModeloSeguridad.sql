USE [WebVisita]
GO
/****** Object:  Table [dbo].[SeguridadUsuarioDatos]    Script Date: 04/28/2017 21:42:54 ******/
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
 CONSTRAINT [PK_SeguridadUsuarioDatos] PRIMARY KEY CLUSTERED 
(
	[SeguridadUsuarioDatosID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] ON
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (2, N'Carceb', N'1', N'CARLOS CEBALLOS', N'ADMINISTRADOR', 10, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (4, N'Admin', N'1', N'Administrador', N'Admin', 10, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (21, N'SLaika', N'1', N'SASHA LAIKA', N'RECEPCION', 1, 0, N'Activo')
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] OFF
/****** Object:  Table [dbo].[SeguridadObjetoAcceso]    Script Date: 04/28/2017 21:42:54 ******/
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
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (15, 1, 1)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (16, 1, 2)
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] OFF
/****** Object:  Table [dbo].[SeguridadObjeto]    Script Date: 04/28/2017 21:42:54 ******/
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
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (1, N'Atencion Visitantes')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (2, N'Consulta de Visitas')
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] OFF
/****** Object:  Table [dbo].[SeguridadGrupo]    Script Date: 04/28/2017 21:42:54 ******/
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
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (1, N'Atención Visitas', N'Recepcion')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (6, N'Consultas', N'Solo realizan consultas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (9, N'Opciones Especiales', N'Actualizan tablas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (10, N'ADMINISTRADOR', N'ACCESO A TODO')
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] OFF
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ObtenerLogin]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Insertar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ActualizarClave]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Actualizar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetosGrupo]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetoGrupo]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_Insertar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_EliminarObjetoGrupo]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Insertar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Actualizar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Insertar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Actualizar]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAdministrador]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAccesoObjeto]    Script Date: 04/28/2017 21:42:52 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Login_ValidarLogin]    Script Date: 04/28/2017 21:42:52 ******/
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
