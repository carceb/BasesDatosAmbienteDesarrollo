USE [master]
GO
/****** Object:  Database [Clinical]    Script Date: 5/5/2017 8:56:10 p.m. ******/
CREATE DATABASE [Clinical]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinical', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinical.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clinical_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinical_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Clinical] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinical].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinical] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinical] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinical] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinical] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinical] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinical] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinical] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Clinical] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinical] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinical] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinical] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinical] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinical] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinical] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinical] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinical] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinical] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinical] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinical] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinical] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinical] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinical] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinical] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinical] SET RECOVERY FULL 
GO
ALTER DATABASE [Clinical] SET  MULTI_USER 
GO
ALTER DATABASE [Clinical] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinical] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinical] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinical] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Clinical', N'ON'
GO
USE [Clinical]
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_InsertarCita]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CitaAgendar_InsertarCita]
	(
		@MedicoConsultorioID int,
		@FechaCita varchar(200),
		@CedulaPacienteCita int,
		@NombrePacienteCita varchar(200),
		@CelularPacienteCita varchar(200),
		@EMailPacienteCita varchar (200),
		@CitaMotivoID int
	)
AS
BEGIN
	INSERT INTO Cita
	(
		MedicoConsultorioID,
		FechaCita,
		CedulaPacienteCita,
		NombrePacienteCita,
		CelularPacienteCita,
		EMailPacienteCita,
		CitaMotivoID
	) 
	VALUES
	(
		@MedicoConsultorioID,
		@FechaCita,
		@CedulaPacienteCita,
		@NombrePacienteCita,
		@CelularPacienteCita,
		@EMailPacienteCita,
		@CitaMotivoID
	)
	SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_ObtenerSeleccionConsultorio]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaAgendar_ObtenerSeleccionConsultorio]
(
	@MedicoCalendarioSemanaID int
)
AS
BEGIN
	SELECT        MedicoCalendarioSemanaID, NombreMedico, NombreEspecialidadMedica, NombreCiudad, DiaSemana, HoraSemana, MinutosSemana, NombreTipoHoraSemana, DireccionConsultorio, MedicoConsultorioID, 
							 ConsultorioID
	FROM            dbo.DetalleCalendarioConsultorio
	WHERE        (MedicoCalendarioSemanaID = @MedicoCalendarioSemanaID)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaCola_ObtenerColaDeCitas]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaCola_ObtenerColaDeCitas]
(
	@ConsultorioID int
)
AS
BEGIN
SELECT        TOP (100) PERCENT dbo.Cita.CitaID, dbo.MedicoConsultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, 
                         dbo.Cita.FechaCita, dbo.Cita.CedulaPacienteCita, dbo.Cita.NombrePacienteCita, dbo.Cita.CelularPacienteCita, dbo.CitaMotivo.NombreCitaMotivo, dbo.Cita.EMailPacienteCita, dbo.EstatusCita.NombreEstatusCita, 
                         dbo.Cita.FechaCreacionCita, dbo.EstatusCita.EstatusCitaID, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.CitaMotivo.CitaMotivoID
FROM            dbo.Cita INNER JOIN
                         dbo.MedicoConsultorio ON dbo.Cita.MedicoConsultorioID = dbo.MedicoConsultorio.MedicoConsultorioID INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID INNER JOIN
                         dbo.EstatusCita ON dbo.Cita.EstatusCitaID = dbo.EstatusCita.EstatusCitaID INNER JOIN
                         dbo.CitaMotivo ON dbo.Cita.CitaMotivoID = dbo.CitaMotivo.CitaMotivoID
WHERE        (dbo.MedicoConsultorio.ConsultorioID = @ConsultorioID) AND (dbo.EstatusCita.EstatusCitaID <> 3)
ORDER BY dbo.Cita.FechaCreacionCita

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Login_ObtenerEmpresas]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_Login_ObtenerEmpresas]
(
	@SeguridadUsuarioDatosID int
)
AS
BEGIN

SELECT        TOP (100) PERCENT dbo.SeguridadUsuarioDatos.LoginUsuario, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.Consultorio.NombreConsultorio, 
                         dbo.Consultorio.DireccionConsultorio, dbo.MedicoConsultorio.ConsultorioID
FROM            dbo.SeguridadUsuarioDatos INNER JOIN
                         dbo.SeguridadUsuarioEmpresa ON dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioEmpresa.SeguridadUsuarioDatosID INNER JOIN
                         dbo.MedicoConsultorio ON dbo.SeguridadUsuarioEmpresa.SeguridadEmpresaID = dbo.MedicoConsultorio.MedicoConsultorioID INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID
WHERE        (dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = @SeguridadUsuarioDatosID)
ORDER BY dbo.Consultorio.NombreConsultorio
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Login_ValidarLogin]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAccesoObjeto]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAdministrador]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Actualizar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Insertar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Actualizar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Insertar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_EliminarObjetoGrupo]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_Insertar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetoGrupo]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetosGrupo]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Actualizar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ActualizarClave]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Insertar]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ObtenerLogin]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
/****** Object:  Table [dbo].[Cita]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cita](
	[CitaID] [int] IDENTITY(1,1) NOT NULL,
	[MedicoConsultorioID] [int] NOT NULL,
	[FechaCita] [smalldatetime] NOT NULL,
	[CitaMotivoID] [int] NOT NULL,
	[CedulaPacienteCita] [numeric](18, 0) NOT NULL,
	[NombrePacienteCita] [varchar](100) NOT NULL,
	[CelularPacienteCita] [varchar](100) NOT NULL,
	[EMailPacienteCita] [varchar](100) NULL,
	[EstatusCitaID] [int] NOT NULL,
	[FechaCreacionCita] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[CitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CitaMotivo]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CitaMotivo](
	[CitaMotivoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCitaMotivo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CitaMotivo] PRIMARY KEY CLUSTERED 
(
	[CitaMotivoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ciudad](
	[CiudadID] [int] NOT NULL,
	[EstadoID] [int] NOT NULL,
	[NombreCiudad] [varchar](50) NOT NULL,
	[IndicaCapital] [int] NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[CiudadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consultorio](
	[ConsultorioID] [int] NOT NULL,
	[NombreConsultorio] [varchar](200) NOT NULL,
	[DireccionConsultorio] [varchar](300) NOT NULL,
	[CiudadID] [int] NOT NULL,
	[TelefonoConsultorio] [varchar](200) NOT NULL,
	[EmailConsultorio] [varchar](100) NULL,
 CONSTRAINT [PK_Consultorio_1] PRIMARY KEY CLUSTERED 
(
	[ConsultorioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DiaSemana]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiaSemana](
	[DiaSemanaID] [int] IDENTITY(1,1) NOT NULL,
	[DiaSemana] [varchar](12) NOT NULL,
 CONSTRAINT [PK_DiaSemana] PRIMARY KEY CLUSTERED 
(
	[DiaSemanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[EnfermedadID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEnfermedad] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Enfermedad] PRIMARY KEY CLUSTERED 
(
	[EnfermedadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EspecialidadMedica]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EspecialidadMedica](
	[EspecialidadMedicaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEspecialidadMedica] [varchar](200) NOT NULL,
 CONSTRAINT [PK_EspecialidadMedica] PRIMARY KEY CLUSTERED 
(
	[EspecialidadMedicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[EstadoID] [int] NOT NULL,
	[NombreEstado] [varchar](50) NOT NULL,
	[Nombre_Iso_3166-2] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstatusCita]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstatusCita](
	[EstatusCitaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstatusCita] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstatusCita] PRIMARY KEY CLUSTERED 
(
	[EstatusCitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormaPago](
	[FormaPagoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreFormaPago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FormaPago] PRIMARY KEY CLUSTERED 
(
	[FormaPagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoraSemana]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoraSemana](
	[HoraSemanaID] [int] IDENTITY(1,1) NOT NULL,
	[HoraSemana] [int] NOT NULL,
 CONSTRAINT [PK_HoraSemana] PRIMARY KEY CLUSTERED 
(
	[HoraSemanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medico]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medico](
	[MedicoID] [int] IDENTITY(1,1) NOT NULL,
	[SexoMedico] [varchar](1) NULL,
	[CedulaMedico] [int] NOT NULL,
	[NombreMedico] [varchar](64) NOT NULL,
	[RIFMedico] [varchar](50) NULL,
	[MSAS] [varchar](50) NULL,
	[ColegioMedico] [varchar](50) NULL,
	[EspecialidadMedicaID] [int] NOT NULL,
	[DescripcionEspecialidad] [varchar](2000) NOT NULL,
	[CelularMedico] [varchar](64) NOT NULL,
	[EmailMedico] [varchar](116) NOT NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[MedicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicoCalendarioSemana]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoCalendarioSemana](
	[MedicoCalendarioSemanaID] [int] IDENTITY(1,1) NOT NULL,
	[MedicoConsultorioID] [int] NULL,
	[DiaSemanaID] [int] NOT NULL,
	[HoraSemanaID] [int] NOT NULL,
	[MinutosSemanaID] [int] NOT NULL,
	[TipoHoraSemanaID] [int] NOT NULL,
	[IndicaHoraInicial] [bit] NULL,
 CONSTRAINT [PK_CalendarioSemana] PRIMARY KEY CLUSTERED 
(
	[MedicoCalendarioSemanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicoConsultorio]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoConsultorio](
	[MedicoConsultorioID] [int] IDENTITY(1,1) NOT NULL,
	[ConsultorioID] [int] NOT NULL,
	[MedicoID] [int] NOT NULL,
	[NumeroMaximoCitas] [int] NOT NULL,
	[FormaPagoID] [int] NOT NULL,
 CONSTRAINT [PK_Consultorio] PRIMARY KEY CLUSTERED 
(
	[MedicoConsultorioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MinutosSemana]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinutosSemana](
	[MinutosSemanaID] [int] IDENTITY(1,1) NOT NULL,
	[MinutosSemana] [int] NOT NULL,
 CONSTRAINT [PK_MinutosSemana] PRIMARY KEY CLUSTERED 
(
	[MinutosSemanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipio](
	[MunicipioID] [int] NOT NULL,
	[EstadoID] [int] NOT NULL,
	[NombreMunicipio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[MunicipioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[PacienteID] [int] IDENTITY(1,1) NOT NULL,
	[CedulaPaciente] [int] NOT NULL,
	[NombrePaciente] [varchar](64) NOT NULL,
	[CelularPaciente] [varchar](64) NOT NULL,
	[DireccionPaciente] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parroquia]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parroquia](
	[ParroquiaID] [int] NOT NULL,
	[MunicipioID] [int] NOT NULL,
	[NombreParroquia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Parroquia] PRIMARY KEY CLUSTERED 
(
	[ParroquiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeguridadGrupo]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeguridadObjeto]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeguridadObjetoAcceso]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeguridadUsuarioDatos]    Script Date: 5/5/2017 8:56:11 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeguridadUsuarioEmpresa]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguridadUsuarioEmpresa](
	[SeguridadUsuarioEmpresaID] [int] IDENTITY(1,1) NOT NULL,
	[SeguridadUsuarioDatosID] [int] NOT NULL,
	[SeguridadEmpresaID] [int] NOT NULL,
 CONSTRAINT [PK_SeguridadUsuarioEmpresa] PRIMARY KEY CLUSTERED 
(
	[SeguridadUsuarioEmpresaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoHoraSemana]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoHoraSemana](
	[TipoHoraSemanaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoHoraSemana] [varchar](12) NOT NULL,
 CONSTRAINT [PK_TipoHoraSemana] PRIMARY KEY CLUSTERED 
(
	[TipoHoraSemanaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[DetalleCalendarioConsultorio]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetalleCalendarioConsultorio]
AS
SELECT        TOP (100) PERCENT dbo.MedicoCalendarioSemana.MedicoCalendarioSemanaID, dbo.Ciudad.NombreCiudad, dbo.DiaSemana.DiaSemanaID, dbo.TipoHoraSemana.TipoHoraSemanaID, 
                         dbo.DiaSemana.DiaSemana, dbo.HoraSemana.HoraSemana, dbo.MinutosSemana.MinutosSemana, dbo.TipoHoraSemana.NombreTipoHoraSemana, dbo.Medico.NombreMedico, 
                         dbo.EspecialidadMedica.NombreEspecialidadMedica, dbo.Medico.DescripcionEspecialidad, dbo.Estado.NombreEstado, dbo.FormaPago.NombreFormaPago, dbo.MedicoConsultorio.MedicoConsultorioID, 
                         dbo.FormaPago.FormaPagoID, dbo.Estado.EstadoID, dbo.Ciudad.CiudadID, dbo.MedicoConsultorio.NumeroMaximoCitas, dbo.Medico.MedicoID, dbo.MedicoCalendarioSemana.IndicaHoraInicial, 
                         dbo.Consultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Consultorio.DireccionConsultorio, dbo.Consultorio.TelefonoConsultorio, dbo.Consultorio.EmailConsultorio
FROM            dbo.Consultorio INNER JOIN
                         dbo.DiaSemana INNER JOIN
                         dbo.MedicoCalendarioSemana ON dbo.DiaSemana.DiaSemanaID = dbo.MedicoCalendarioSemana.DiaSemanaID INNER JOIN
                         dbo.TipoHoraSemana ON dbo.MedicoCalendarioSemana.TipoHoraSemanaID = dbo.TipoHoraSemana.TipoHoraSemanaID INNER JOIN
                         dbo.MinutosSemana ON dbo.MedicoCalendarioSemana.MinutosSemanaID = dbo.MinutosSemana.MinutosSemanaID INNER JOIN
                         dbo.HoraSemana ON dbo.MedicoCalendarioSemana.HoraSemanaID = dbo.HoraSemana.HoraSemanaID INNER JOIN
                         dbo.Medico INNER JOIN
                         dbo.MedicoConsultorio ON dbo.Medico.MedicoID = dbo.MedicoConsultorio.MedicoID INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID ON 
                         dbo.MedicoCalendarioSemana.MedicoConsultorioID = dbo.MedicoConsultorio.MedicoConsultorioID INNER JOIN
                         dbo.FormaPago ON dbo.MedicoConsultorio.FormaPagoID = dbo.FormaPago.FormaPagoID ON dbo.Consultorio.ConsultorioID = dbo.MedicoConsultorio.ConsultorioID INNER JOIN
                         dbo.Ciudad INNER JOIN
                         dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID ON dbo.Consultorio.CiudadID = dbo.Ciudad.CiudadID
WHERE        (dbo.MedicoCalendarioSemana.IndicaHoraInicial = 1)
ORDER BY dbo.DiaSemana.DiaSemanaID, dbo.TipoHoraSemana.TipoHoraSemanaID, dbo.Ciudad.NombreCiudad, dbo.HoraSemana.HoraSemana

GO
/****** Object:  View [dbo].[DetalleMedicos]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetalleMedicos]
AS
SELECT        TOP (100) PERCENT dbo.Estado.NombreEstado, dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, dbo.Medico.DescripcionEspecialidad, dbo.Estado.EstadoID, 
                         dbo.Medico.MedicoID
FROM            dbo.Consultorio INNER JOIN
                         dbo.DiaSemana INNER JOIN
                         dbo.MedicoCalendarioSemana ON dbo.DiaSemana.DiaSemanaID = dbo.MedicoCalendarioSemana.DiaSemanaID INNER JOIN
                         dbo.TipoHoraSemana ON dbo.MedicoCalendarioSemana.TipoHoraSemanaID = dbo.TipoHoraSemana.TipoHoraSemanaID INNER JOIN
                         dbo.MinutosSemana ON dbo.MedicoCalendarioSemana.MinutosSemanaID = dbo.MinutosSemana.MinutosSemanaID INNER JOIN
                         dbo.HoraSemana ON dbo.MedicoCalendarioSemana.HoraSemanaID = dbo.HoraSemana.HoraSemanaID INNER JOIN
                         dbo.Medico INNER JOIN
                         dbo.MedicoConsultorio ON dbo.Medico.MedicoID = dbo.MedicoConsultorio.MedicoID INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID ON 
                         dbo.MedicoCalendarioSemana.MedicoConsultorioID = dbo.MedicoConsultorio.MedicoConsultorioID INNER JOIN
                         dbo.FormaPago ON dbo.MedicoConsultorio.FormaPagoID = dbo.FormaPago.FormaPagoID ON dbo.Consultorio.ConsultorioID = dbo.MedicoConsultorio.ConsultorioID INNER JOIN
                         dbo.Ciudad INNER JOIN
                         dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID ON dbo.Consultorio.CiudadID = dbo.Ciudad.CiudadID
GROUP BY dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, dbo.Medico.DescripcionEspecialidad, dbo.Estado.EstadoID, dbo.Medico.MedicoID, dbo.Estado.NombreEstado
ORDER BY dbo.Estado.NombreEstado, dbo.Medico.NombreMedico

GO
/****** Object:  View [dbo].[DetalleUsuarioConsultorio]    Script Date: 5/5/2017 8:56:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetalleUsuarioConsultorio]
AS
SELECT        TOP (100) PERCENT dbo.Consultorio.NombreConsultorio + '  (Dr. ' + dbo.Medico.NombreMedico + ')' AS Consultorio_Medico, dbo.Medico.NombreMedico, dbo.SeguridadUsuarioDatos.NombreCompleto, 
                         dbo.SeguridadUsuarioDatos.LoginUsuario, dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.ClaveUsuario, dbo.Consultorio.DireccionConsultorio, 
                         dbo.Consultorio.TelefonoConsultorio, dbo.Consultorio.EmailConsultorio, dbo.MedicoConsultorio.NumeroMaximoCitas, dbo.Medico.DescripcionEspecialidad, dbo.MedicoConsultorio.MedicoConsultorioID, 
                         dbo.MedicoConsultorio.MedicoID, dbo.Consultorio.ConsultorioID
FROM            dbo.SeguridadUsuarioDatos INNER JOIN
                         dbo.SeguridadUsuarioEmpresa ON dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioEmpresa.SeguridadUsuarioDatosID RIGHT OUTER JOIN
                         dbo.MedicoConsultorio INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID ON dbo.SeguridadUsuarioEmpresa.SeguridadUsuarioEmpresaID = dbo.MedicoConsultorio.ConsultorioID
ORDER BY dbo.Consultorio.ConsultorioID

GO
SET IDENTITY_INSERT [dbo].[Cita] ON 

INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (12, 6, CAST(0xA76F0000 AS SmallDateTime), 1, CAST(10530364 AS Numeric(18, 0)), N'CARLOS CEBALLOS', N'34324', N'', 1, CAST(0xA76A043A AS SmallDateTime))
INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (13, 1, CAST(0xA76E0000 AS SmallDateTime), 1, CAST(1212 AS Numeric(18, 0)), N'PEPE', N'2232', N'', 2, CAST(0xA76A0458 AS SmallDateTime))
INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (14, 8, CAST(0xA76D0000 AS SmallDateTime), 1, CAST(1212 AS Numeric(18, 0)), N'LUIS LUNA', N'2', N'', 1, CAST(0xA76A045A AS SmallDateTime))
INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (16, 5, CAST(0xA76F0000 AS SmallDateTime), 3, CAST(9999 AS Numeric(18, 0)), N'CARLUCHO', N'2', N'', 1, CAST(0xA76A0481 AS SmallDateTime))
INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (17, 8, CAST(0xA76D0000 AS SmallDateTime), 2, CAST(15192929 AS Numeric(18, 0)), N'YOSMAR GUERRERO', N'003449349', N'', 1, CAST(0xA76A04BD AS SmallDateTime))
INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (18, 1, CAST(0xA76E0000 AS SmallDateTime), 3, CAST(123444 AS Numeric(18, 0)), N'RUBEN ALFONSO DE LA CRUZ', N'2321321', N'', 1, CAST(0xA76A04BF AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Cita] OFF
SET IDENTITY_INSERT [dbo].[CitaMotivo] ON 

INSERT [dbo].[CitaMotivo] ([CitaMotivoID], [NombreCitaMotivo]) VALUES (1, N'CONSULTA (NUEVO PADECIMIENTO)')
INSERT [dbo].[CitaMotivo] ([CitaMotivoID], [NombreCitaMotivo]) VALUES (2, N'CHEQUEO (PADECIMIENTO EN TRATAMIENTO)')
INSERT [dbo].[CitaMotivo] ([CitaMotivoID], [NombreCitaMotivo]) VALUES (3, N'PRIMERA VEZ (NUNCA ATENDIDO)')
SET IDENTITY_INSERT [dbo].[CitaMotivo] OFF
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (1, 1, N'Maroa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (2, 1, N'Puerto Ayacucho', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (3, 1, N'San Fernando de Atabapo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (4, 2, N'Anaco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (5, 2, N'Aragua de Barcelona', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (6, 2, N'Barcelona', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (7, 2, N'Boca de Uchire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (8, 2, N'Cantaura', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (9, 2, N'Clarines', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (10, 2, N'El Chaparro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (11, 2, N'El Pao Anzoátegui', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (12, 2, N'El Tigre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (13, 2, N'El Tigrito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (14, 2, N'Guanape', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (15, 2, N'Guanta', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (16, 2, N'Lechería', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (17, 2, N'Onoto', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (18, 2, N'Pariaguán', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (19, 2, N'Píritu', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (20, 2, N'Puerto La Cruz', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (21, 2, N'Puerto Píritu', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (22, 2, N'Sabana de Uchire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (23, 2, N'San Mateo Anzoátegui', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (24, 2, N'San Pablo Anzoátegui', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (25, 2, N'San Tomé', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (26, 2, N'Santa Ana de Anzoátegui', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (27, 2, N'Santa Fe Anzoátegui', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (28, 2, N'Santa Rosa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (29, 2, N'Soledad', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (30, 2, N'Urica', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (31, 2, N'Valle de Guanape', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (43, 3, N'Achaguas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (44, 3, N'Biruaca', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (45, 3, N'Bruzual', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (46, 3, N'El Amparo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (47, 3, N'El Nula', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (48, 3, N'Elorza', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (49, 3, N'Guasdualito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (50, 3, N'Mantecal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (51, 3, N'Puerto Páez', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (52, 3, N'San Fernando de Apure', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (53, 3, N'San Juan de Payara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (54, 4, N'Barbacoas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (55, 4, N'Cagua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (56, 4, N'Camatagua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (58, 4, N'Choroní', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (59, 4, N'Colonia Tovar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (60, 4, N'El Consejo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (61, 4, N'La Victoria', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (62, 4, N'Las Tejerías', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (63, 4, N'Magdaleno', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (64, 4, N'Maracay', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (65, 4, N'Ocumare de La Costa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (66, 4, N'Palo Negro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (67, 4, N'San Casimiro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (68, 4, N'San Mateo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (69, 4, N'San Sebastián', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (70, 4, N'Santa Cruz de Aragua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (71, 4, N'Tocorón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (72, 4, N'Turmero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (73, 4, N'Villa de Cura', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (74, 4, N'Zuata', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (75, 5, N'Barinas', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (76, 5, N'Barinitas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (77, 5, N'Barrancas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (78, 5, N'Calderas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (79, 5, N'Capitanejo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (80, 5, N'Ciudad Bolivia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (81, 5, N'El Cantón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (82, 5, N'Las Veguitas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (83, 5, N'Libertad de Barinas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (84, 5, N'Sabaneta', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (85, 5, N'Santa Bárbara de Barinas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (86, 5, N'Socopó', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (87, 6, N'Caicara del Orinoco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (88, 6, N'Canaima', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (89, 6, N'Ciudad Bolívar', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (90, 6, N'Ciudad Piar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (91, 6, N'El Callao', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (92, 6, N'El Dorado', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (93, 6, N'El Manteco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (94, 6, N'El Palmar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (95, 6, N'El Pao', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (96, 6, N'Guasipati', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (97, 6, N'Guri', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (98, 6, N'La Paragua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (99, 6, N'Matanzas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (100, 6, N'Puerto Ordaz', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (101, 6, N'San Félix', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (102, 6, N'Santa Elena de Uairén', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (103, 6, N'Tumeremo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (104, 6, N'Unare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (105, 6, N'Upata', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (106, 7, N'Bejuma', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (107, 7, N'Belén', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (108, 7, N'Campo de Carabobo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (109, 7, N'Canoabo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (110, 7, N'Central Tacarigua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (111, 7, N'Chirgua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (112, 7, N'Ciudad Alianza', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (113, 7, N'El Palito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (114, 7, N'Guacara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (115, 7, N'Guigue', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (116, 7, N'Las Trincheras', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (117, 7, N'Los Guayos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (118, 7, N'Mariara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (119, 7, N'Miranda', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (120, 7, N'Montalbán', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (121, 7, N'Morón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (122, 7, N'Naguanagua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (123, 7, N'Puerto Cabello', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (124, 7, N'San Joaquín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (125, 7, N'Tocuyito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (126, 7, N'Urama', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (127, 7, N'Valencia', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (128, 7, N'Vigirimita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (129, 8, N'Aguirre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (130, 8, N'Apartaderos Cojedes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (131, 8, N'Arismendi', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (132, 8, N'Camuriquito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (133, 8, N'El Baúl', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (134, 8, N'El Limón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (135, 8, N'El Pao Cojedes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (136, 8, N'El Socorro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (137, 8, N'La Aguadita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (138, 8, N'Las Vegas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (139, 8, N'Libertad de Cojedes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (140, 8, N'Mapuey', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (141, 8, N'Piñedo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (142, 8, N'Samancito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (143, 8, N'San Carlos', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (144, 8, N'Sucre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (145, 8, N'Tinaco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (146, 8, N'Tinaquillo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (147, 8, N'Vallecito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (148, 9, N'Tucupita', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (149, 24, N'Caracas', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (150, 24, N'El Junquito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (151, 10, N'Adícora', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (152, 10, N'Boca de Aroa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (153, 10, N'Cabure', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (154, 10, N'Capadare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (155, 10, N'Capatárida', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (156, 10, N'Chichiriviche', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (157, 10, N'Churuguara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (158, 10, N'Coro', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (159, 10, N'Cumarebo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (160, 10, N'Dabajuro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (161, 10, N'Judibana', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (162, 10, N'La Cruz de Taratara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (163, 10, N'La Vela de Coro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (164, 10, N'Los Taques', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (165, 10, N'Maparari', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (166, 10, N'Mene de Mauroa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (167, 10, N'Mirimire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (168, 10, N'Pedregal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (169, 10, N'Píritu Falcón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (170, 10, N'Pueblo Nuevo Falcón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (171, 10, N'Puerto Cumarebo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (172, 10, N'Punta Cardón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (173, 10, N'Punto Fijo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (174, 10, N'San Juan de Los Cayos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (175, 10, N'San Luis', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (176, 10, N'Santa Ana Falcón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (177, 10, N'Santa Cruz De Bucaral', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (178, 10, N'Tocopero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (179, 10, N'Tocuyo de La Costa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (180, 10, N'Tucacas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (181, 10, N'Yaracal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (182, 11, N'Altagracia de Orituco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (183, 11, N'Cabruta', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (184, 11, N'Calabozo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (185, 11, N'Camaguán', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (196, 11, N'Chaguaramas Guárico', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (197, 11, N'El Socorro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (198, 11, N'El Sombrero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (199, 11, N'Las Mercedes de Los Llanos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (200, 11, N'Lezama', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (201, 11, N'Onoto', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (202, 11, N'Ortíz', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (203, 11, N'San José de Guaribe', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (204, 11, N'San Juan de Los Morros', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (205, 11, N'San Rafael de Laya', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (206, 11, N'Santa María de Ipire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (207, 11, N'Tucupido', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (208, 11, N'Valle de La Pascua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (209, 11, N'Zaraza', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (210, 12, N'Aguada Grande', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (211, 12, N'Atarigua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (212, 12, N'Barquisimeto', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (213, 12, N'Bobare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (214, 12, N'Cabudare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (215, 12, N'Carora', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (216, 12, N'Cubiro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (217, 12, N'Cují', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (218, 12, N'Duaca', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (219, 12, N'El Manzano', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (220, 12, N'El Tocuyo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (221, 12, N'Guaríco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (222, 12, N'Humocaro Alto', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (223, 12, N'Humocaro Bajo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (224, 12, N'La Miel', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (225, 12, N'Moroturo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (226, 12, N'Quíbor', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (227, 12, N'Río Claro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (228, 12, N'Sanare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (229, 12, N'Santa Inés', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (230, 12, N'Sarare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (231, 12, N'Siquisique', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (232, 12, N'Tintorero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (233, 13, N'Apartaderos Mérida', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (234, 13, N'Arapuey', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (235, 13, N'Bailadores', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (236, 13, N'Caja Seca', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (237, 13, N'Canaguá', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (238, 13, N'Chachopo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (239, 13, N'Chiguara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (240, 13, N'Ejido', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (241, 13, N'El Vigía', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (242, 13, N'La Azulita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (243, 13, N'La Playa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (244, 13, N'Lagunillas Mérida', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (245, 13, N'Mérida', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (246, 13, N'Mesa de Bolívar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (247, 13, N'Mucuchíes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (248, 13, N'Mucujepe', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (249, 13, N'Mucuruba', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (250, 13, N'Nueva Bolivia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (251, 13, N'Palmarito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (252, 13, N'Pueblo Llano', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (253, 13, N'Santa Cruz de Mora', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (254, 13, N'Santa Elena de Arenales', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (255, 13, N'Santo Domingo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (256, 13, N'Tabáy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (257, 13, N'Timotes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (258, 13, N'Torondoy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (259, 13, N'Tovar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (260, 13, N'Tucani', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (261, 13, N'Zea', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (262, 14, N'Araguita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (263, 14, N'Carrizal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (264, 14, N'Caucagua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (265, 14, N'Chaguaramas Miranda', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (266, 14, N'Charallave', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (267, 14, N'Chirimena', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (268, 14, N'Chuspa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (269, 14, N'Cúa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (270, 14, N'Cupira', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (271, 14, N'Curiepe', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (272, 14, N'El Guapo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (273, 14, N'El Jarillo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (274, 14, N'Filas de Mariche', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (275, 14, N'Guarenas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (276, 14, N'Guatire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (277, 14, N'Higuerote', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (278, 14, N'Los Anaucos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (279, 14, N'Los Teques', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (280, 14, N'Ocumare del Tuy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (281, 14, N'Panaquire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (282, 14, N'Paracotos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (283, 14, N'Río Chico', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (284, 14, N'San Antonio de Los Altos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (285, 14, N'San Diego de Los Altos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (286, 14, N'San Fernando del Guapo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (287, 14, N'San Francisco de Yare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (288, 14, N'San José de Los Altos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (289, 14, N'San José de Río Chico', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (290, 14, N'San Pedro de Los Altos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (291, 14, N'Santa Lucía', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (292, 14, N'Santa Teresa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (293, 14, N'Tacarigua de La Laguna', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (294, 14, N'Tacarigua de Mamporal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (295, 14, N'Tácata', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (296, 14, N'Turumo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (297, 15, N'Aguasay', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (298, 15, N'Aragua de Maturín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (299, 15, N'Barrancas del Orinoco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (300, 15, N'Caicara de Maturín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (301, 15, N'Caripe', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (302, 15, N'Caripito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (303, 15, N'Chaguaramal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (305, 15, N'Chaguaramas Monagas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (307, 15, N'El Furrial', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (308, 15, N'El Tejero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (309, 15, N'Jusepín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (310, 15, N'La Toscana', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (311, 15, N'Maturín', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (312, 15, N'Miraflores', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (313, 15, N'Punta de Mata', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (314, 15, N'Quiriquire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (315, 15, N'San Antonio de Maturín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (316, 15, N'San Vicente Monagas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (317, 15, N'Santa Bárbara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (318, 15, N'Temblador', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (319, 15, N'Teresen', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (320, 15, N'Uracoa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (321, 16, N'Altagracia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (322, 16, N'Boca de Pozo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (323, 16, N'Boca de Río', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (324, 16, N'El Espinal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (325, 16, N'El Valle del Espíritu Santo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (326, 16, N'El Yaque', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (327, 16, N'Juangriego', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (328, 16, N'La Asunción', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (329, 16, N'La Guardia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (330, 16, N'Pampatar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (331, 16, N'Porlamar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (332, 16, N'Puerto Fermín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (333, 16, N'Punta de Piedras', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (334, 16, N'San Francisco de Macanao', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (335, 16, N'San Juan Bautista', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (336, 16, N'San Pedro de Coche', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (337, 16, N'Santa Ana de Nueva Esparta', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (338, 16, N'Villa Rosa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (339, 17, N'Acarigua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (340, 17, N'Agua Blanca', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (341, 17, N'Araure', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (342, 17, N'Biscucuy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (343, 17, N'Boconoito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (344, 17, N'Campo Elías', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (345, 17, N'Chabasquén', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (346, 17, N'Guanare', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (347, 17, N'Guanarito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (348, 17, N'La Aparición', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (349, 17, N'La Misión', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (350, 17, N'Mesa de Cavacas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (351, 17, N'Ospino', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (352, 17, N'Papelón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (353, 17, N'Payara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (354, 17, N'Pimpinela', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (355, 17, N'Píritu de Portuguesa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (356, 17, N'San Rafael de Onoto', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (357, 17, N'Santa Rosalía', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (358, 17, N'Turén', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (359, 18, N'Altos de Sucre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (360, 18, N'Araya', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (361, 18, N'Cariaco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (362, 18, N'Carúpano', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (363, 18, N'Casanay', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (364, 18, N'Cumaná', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (365, 18, N'Cumanacoa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (366, 18, N'El Morro Puerto Santo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (367, 18, N'El Pilar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (368, 18, N'El Poblado', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (369, 18, N'Guaca', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (370, 18, N'Guiria', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (371, 18, N'Irapa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (372, 18, N'Manicuare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (373, 18, N'Mariguitar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (374, 18, N'Río Caribe', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (375, 18, N'San Antonio del Golfo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (376, 18, N'San José de Aerocuar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (377, 18, N'San Vicente de Sucre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (378, 18, N'Santa Fe de Sucre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (379, 18, N'Tunapuy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (380, 18, N'Yaguaraparo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (381, 18, N'Yoco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (382, 19, N'Abejales', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (383, 19, N'Borota', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (384, 19, N'Bramon', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (385, 19, N'Capacho', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (386, 19, N'Colón', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (387, 19, N'Coloncito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (388, 19, N'Cordero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (389, 19, N'El Cobre', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (390, 19, N'El Pinal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (391, 19, N'Independencia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (392, 19, N'La Fría', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (393, 19, N'La Grita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (394, 19, N'La Pedrera', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (395, 19, N'La Tendida', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (396, 19, N'Las Delicias', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (397, 19, N'Las Hernández', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (398, 19, N'Lobatera', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (399, 19, N'Michelena', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (400, 19, N'Palmira', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (401, 19, N'Pregonero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (402, 19, N'Queniquea', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (403, 19, N'Rubio', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (404, 19, N'San Antonio del Tachira', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (405, 19, N'San Cristobal', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (406, 19, N'San José de Bolívar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (407, 19, N'San Josecito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (408, 19, N'San Pedro del Río', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (409, 19, N'Santa Ana Táchira', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (410, 19, N'Seboruco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (411, 19, N'Táriba', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (412, 19, N'Umuquena', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (413, 19, N'Ureña', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (414, 20, N'Batatal', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (415, 20, N'Betijoque', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (416, 20, N'Boconó', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (417, 20, N'Carache', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (418, 20, N'Chejende', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (419, 20, N'Cuicas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (420, 20, N'El Dividive', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (421, 20, N'El Jaguito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (422, 20, N'Escuque', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (423, 20, N'Isnotú', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (424, 20, N'Jajó', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (425, 20, N'La Ceiba', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (426, 20, N'La Concepción de Trujllo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (427, 20, N'La Mesa de Esnujaque', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (428, 20, N'La Puerta', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (429, 20, N'La Quebrada', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (430, 20, N'Mendoza Fría', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (431, 20, N'Meseta de Chimpire', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (432, 20, N'Monay', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (433, 20, N'Motatán', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (434, 20, N'Pampán', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (435, 20, N'Pampanito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (436, 20, N'Sabana de Mendoza', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (437, 20, N'San Lázaro', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (438, 20, N'Santa Ana de Trujillo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (439, 20, N'Tostós', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (440, 20, N'Trujillo', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (441, 20, N'Valera', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (442, 21, N'Carayaca', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (443, 21, N'Litoral', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (444, 25, N'Archipiélago Los Roques', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (445, 22, N'Aroa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (446, 22, N'Boraure', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (447, 22, N'Campo Elías de Yaracuy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (448, 22, N'Chivacoa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (449, 22, N'Cocorote', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (450, 22, N'Farriar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (451, 22, N'Guama', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (452, 22, N'Marín', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (453, 22, N'Nirgua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (454, 22, N'Sabana de Parra', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (455, 22, N'Salom', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (456, 22, N'San Felipe', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (457, 22, N'San Pablo de Yaracuy', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (458, 22, N'Urachiche', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (459, 22, N'Yaritagua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (460, 22, N'Yumare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (461, 23, N'Bachaquero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (462, 23, N'Bobures', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (463, 23, N'Cabimas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (464, 23, N'Campo Concepción', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (465, 23, N'Campo Mara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (466, 23, N'Campo Rojo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (467, 23, N'Carrasquero', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (468, 23, N'Casigua', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (469, 23, N'Chiquinquirá', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (470, 23, N'Ciudad Ojeda', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (471, 23, N'El Batey', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (472, 23, N'El Carmelo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (473, 23, N'El Chivo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (474, 23, N'El Guayabo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (475, 23, N'El Mene', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (476, 23, N'El Venado', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (477, 23, N'Encontrados', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (478, 23, N'Gibraltar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (479, 23, N'Isla de Toas', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (480, 23, N'La Concepción del Zulia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (481, 23, N'La Paz', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (482, 23, N'La Sierrita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (483, 23, N'Lagunillas del Zulia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (484, 23, N'Las Piedras de Perijá', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (485, 23, N'Los Cortijos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (486, 23, N'Machiques', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (487, 23, N'Maracaibo', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (488, 23, N'Mene Grande', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (489, 23, N'Palmarejo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (490, 23, N'Paraguaipoa', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (491, 23, N'Potrerito', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (492, 23, N'Pueblo Nuevo del Zulia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (493, 23, N'Puertos de Altagracia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (494, 23, N'Punta Gorda', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (495, 23, N'Sabaneta de Palma', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (496, 23, N'San Francisco', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (497, 23, N'San José de Perijá', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (498, 23, N'San Rafael del Moján', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (499, 23, N'San Timoteo', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (500, 23, N'Santa Bárbara Del Zulia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (501, 23, N'Santa Cruz de Mara', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (502, 23, N'Santa Cruz del Zulia', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (503, 23, N'Santa Rita', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (504, 23, N'Sinamaica', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (505, 23, N'Tamare', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (506, 23, N'Tía Juana', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (507, 23, N'Villa del Rosario', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (508, 21, N'La Guaira', 1)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (509, 21, N'Catia La Mar', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (510, 21, N'Macuto', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (511, 21, N'Naiguatá', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (512, 25, N'Archipiélago Los Monjes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (513, 25, N'Isla La Tortuga y Cayos adyacentes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (514, 25, N'Isla La Sola', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (515, 25, N'Islas Los Testigos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (516, 25, N'Islas Los Frailes', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (517, 25, N'Isla La Orchila', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (518, 25, N'Archipiélago Las Aves', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (519, 25, N'Isla de Aves', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (520, 25, N'Isla La Blanquilla', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (521, 25, N'Isla de Patos', 0)
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (522, 25, N'Islas Los Hermanos', 0)
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (1, N'CONSULTORIO 5', N'CALLE PAEZ EDIFICIO LA PAZ', 279, N'0212618.16.63', N'')
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (2, N'LAS AMERICAS', N'CARRETERA PANAMERICANA KM 15 GALERIAS LAS AMERICAS NIVEL MEZZANINA', 285, N'2333', N'N/D')
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (3, N'CONSULTORIO PH-9', N'Edif. Anexo Hospital Clínicas Caracas, Nivel Ph, Consultorio Ph-9, San Bernardino, Caracas.. ', 149, N'(0212)575.0513 (0212)319.7503 (0426)104.6573 (0424)751.5902', N'N/D')
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (4, N'CC CABIMAS', N' Centro Clínico Cabimas. Sector Delicias Nuevas. Calle Carabobo. Edif. Centro Clínico Cabimas.', 463, N'0264 2413684 041462048', N'N/D')
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (5, N'LOS COLORADOS', N'Calle 112, Nº. 103-a-120 (al Lado De Corpoelec), Los Colorados, Valencia', 127, N'04144288', N'N/D')
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (6, N'N/D', N'N/D', 64, N'453532354', N'N/D')
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (7, N'CENTRO MEDICO EL PASO', N'AVENIDA BICENTENARIA CALLE 23 EDIFICIO 45 PISO 5 LOS TEQUES MIRANDA', 279, N'0412-5444.5577', N'N/D')
SET IDENTITY_INSERT [dbo].[DiaSemana] ON 

INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (1, N'LUNES')
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (2, N'MARTES')
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (3, N'MIERCOLES')
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (4, N'JUEVES')
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (5, N'VIERNES')
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (6, N'SABADO')
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (7, N'DOMINGO')
SET IDENTITY_INSERT [dbo].[DiaSemana] OFF
SET IDENTITY_INSERT [dbo].[Enfermedad] ON 

INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (1, N'Abrasión corneal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (2, N'Accidentes de tráfico')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (3, N'Accidentes eléctricos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (4, N'Accidentes en el agua')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (5, N'Accidentes químicos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (6, N'Acné')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (7, N'Aftas bucales')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (8, N'Albinismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (9, N'Alcoholismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (10, N'Alergia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (11, N'Alergia al níquel')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (12, N'Alergia al sol')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (13, N'Alud')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (14, N'Alzhéimer')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (15, N'Amenorrea')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (16, N'Ampollas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (17, N'Anemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (18, N'Aneurisma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (19, N'Angina de pecho')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (20, N'Anisakiasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (21, N'Anorexia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (22, N'Ansiedad')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (23, N'Apendicitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (24, N'Apnea del sueño')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (25, N'Arritmia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (26, N'Arteriosclerosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (27, N'Artritis reumatoide')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (28, N'Artrosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (29, N'Ascitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (30, N'Asma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (31, N'Astigmatismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (32, N'Ataxia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (33, N'Atragantamiento')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (34, N'Atrofia vaginal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (35, N'Autismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (36, N'Balanitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (37, N'Bartolinitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (38, N'Bocio')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (39, N'Botulismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (40, N'Bronquiectasias')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (41, N'Bronquiolitis obliterante')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (42, N'Bronquitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (43, N'Brucelosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (44, N'Bruxismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (45, N'Bulimia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (46, N'Campylobacter')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (47, N'Cáncer')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (48, N'Cáncer de cabeza y cuello')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (49, N'Cáncer de colon')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (50, N'Cáncer de cuello de útero')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (51, N'Cáncer de esófago')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (52, N'Cáncer de estómago')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (53, N'Cáncer de hígado')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (54, N'Cáncer de laringe')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (55, N'Cáncer de mama')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (56, N'Cáncer de ovario')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (57, N'Cáncer de páncreas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (58, N'Cáncer de pene')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (59, N'Cáncer de piel')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (60, N'Cáncer de próstata')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (61, N'Cáncer de pulmón')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (62, N'Cáncer de riñón')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (63, N'Cáncer de testículo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (64, N'Cáncer de tiroides')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (65, N'Cáncer de vejiga')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (66, N'Cáncer oral')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (67, N'Cáncer óseo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (68, N'Candidiasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (69, N'Carbunco')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (70, N'Cataratas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (71, N'Catarro')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (72, N'Celiaquía')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (73, N'Chikungunya')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (74, N'Ciática')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (75, N'Cirrosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (76, N'Cistitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (77, N'Clamidia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (78, N'Cólera')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (79, N'Colesteatoma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (80, N'Cólico nefrítico')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (81, N'Colitis ulcerosa')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (82, N'Colon irritable')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (83, N'Congelamiento')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (84, N'Congestión nasal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (85, N'Conjuntivitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (86, N'Contusiones')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (87, N'Corte de digestión')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (88, N'Crisis de pánico')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (89, N'Cuerpos extraños')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (90, N'Daltonismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (91, N'Déficit de la hormona del crecimiento')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (92, N'Degeneración macular')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (93, N'Demencia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (94, N'Demencia con cuerpos de Lewy')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (95, N'Demencia vascular')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (96, N'Dengue')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (97, N'Depresión')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (98, N'Dermatitis atópica')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (99, N'Derrame ocular')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (100, N'Deterioro cognitivo leve')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (101, N'Diabetes')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (102, N'Diabetes gestacional')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (103, N'Diabetes insípida')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (104, N'Difteria')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (105, N'Disfunción eréctil')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (106, N'Dislexia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (107, N'Dismenorrea')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (108, N'Dispepsia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (109, N'Distonía')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (110, N'Distrofia muscular de Duchenne')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (111, N'Diverticulosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (112, N'Ébola')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (113, N'Edema pulmonar')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (114, N'Elefantiasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (115, N'Encefalitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (116, N'Endocarditis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (117, N'Endometriosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (118, N'Enfermedad de Addison')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (119, N'Enfermedad de Behçet')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (120, N'Enfermedad de Chagas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (121, N'Enfermedad de Crohn')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (122, N'Enfermedad de Huntington')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (123, N'Enfermedad de Kawasaki')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (124, N'Enfermedad de La Peyronie')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (125, N'Enfermedad de Lyme')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (126, N'Enfermedad de Paget')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (127, N'Enfermedad de Wilson')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (128, N'Enfermedad inflamatoria pélvica')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (129, N'Enfermedades de Transmisión Sexual')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (130, N'Enfermedades raras')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (131, N'Epilepsia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (132, N'EPOC')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (133, N'Escleritis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (134, N'Esclerodermia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (135, N'Esclerosis lateral amiotrófica')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (136, N'Esclerosis múltiple')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (137, N'Escoliosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (138, N'Esófago de Barrett')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (139, N'Espondilitis anquilosante')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (140, N'Esquizofrenia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (141, N'Esteatosis hepática')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (142, N'Estrabismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (143, N'Estreñimiento')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (144, N'Eyaculación precoz')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (145, N'Faringitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (146, N'Fascitis plantar')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (147, N'Fenilcetonuria')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (148, N'Fibrilación auricular')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (149, N'Fibromialgia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (150, N'Fibrosis quística')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (151, N'Fiebre amarilla')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (152, N'Fiebre de Lassa')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (153, N'Fiebre hemorrágica de Crimea-Congo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (154, N'Fístula anal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (155, N'Fractura de dedo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (156, N'Fractura nasal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (157, N'Galactorrea')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (158, N'Galactosemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (159, N'Gastritis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (160, N'Gastroenteritis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (161, N'Glaucoma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (162, N'Golpe de calor')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (163, N'Gonorrea')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (164, N'Gota')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (165, N'Gripe')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (166, N'Hemocromatosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (167, N'Hemofilia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (168, N'Hemorragia nasal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (169, N'Hemorroides')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (170, N'Hepatitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (171, N'Herida por arma de fuego')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (172, N'Heridas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (173, N'Hernia de hiato')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (174, N'Hernia discal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (175, N'Hernia inguinal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (176, N'Herpes')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (177, N'Herpes zóster')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (178, N'Hiperactividad (TDAH) ')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (179, N'Hipercolesterolemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (180, N'Hipermetropía')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (181, N'Hiperplasia benigna de próstata')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (182, N'Hipertensión arterial')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (183, N'Hipertiroidismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (184, N'Hipoacusia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (185, N'Hipocalcemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (186, N'Hipoglucemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (187, N'Hipogonadismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (188, N'Hipotensión arterial')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (189, N'Hipotermia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (190, N'Hipotiroidismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (191, N'Ictus')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (192, N'Impétigo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (193, N'Incendios')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (194, N'Incontinencia urinaria')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (195, N'Infarto de miocardio')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (196, N'Infecciones urinarias')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (197, N'Insomnio')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (198, N'Insomnio familiar fatal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (199, N'Insuficiencia cardiaca')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (200, N'Insuficiencia mitral')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (201, N'Insuficiencia renal crónica')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (202, N'Intoxicación etílica')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (203, N'Intoxicación por monóxido de carbono')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (204, N'Intoxicaciones')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (205, N'Juanetes')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (206, N'Ladillas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (207, N'Laringitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (208, N'Legionella')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (209, N'Leishmaniasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (210, N'Lepra')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (211, N'Leptospirosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (212, N'Lesiones maxilares')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (213, N'Leucemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (214, N'Lipodistrofia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (215, N'Lipotimia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (216, N'Listeriosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (217, N'Litiasis biliar')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (218, N'Lumbalgia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (219, N'Lupus')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (220, N'Luxaciones')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (221, N'Mal agudo de montaña')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (222, N'Malaria')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (223, N'Melanoma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (224, N'Melasma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (225, N'Melioidosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (226, N'Meningitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (227, N'Menopausia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (228, N'MERS')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (229, N'Mesotelioma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (230, N'Miastenia gravis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (231, N'Microcefalia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (232, N'Migraña')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (233, N'Miomatosis uterina')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (234, N'Miopía')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (235, N'Molusco contagioso')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (236, N'Mononucleosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (237, N'Mordeduras de animales')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (238, N'Narcolepsia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (239, N'Neumonía')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (240, N'Neumotórax')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (241, N'Neuralgia del trigémino')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (242, N'Neurofibromatosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (243, N'Nistagmo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (244, N'Obesidad')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (245, N'Obesidad infantil')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (246, N'Ojo seco')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (247, N'Oncocercosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (248, N'Onicomicosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (249, N'Orquitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (250, N'Osteomalacia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (251, N'Osteomielitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (252, N'Osteonecrosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (253, N'Osteoporosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (254, N'Otitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (255, N'Palpitaciones cardíacas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (256, N'Pancreatitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (257, N'Paperas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (258, N'Parálisis cerebral')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (259, N'Párkinson')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (260, N'Patologías benignas de mama')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (261, N'Pericarditis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (262, N'Peritonitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (263, N'Peste')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (264, N'Pian')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (265, N'Picaduras de insectos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (266, N'Pie de atleta')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (267, N'Pielonefritis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (268, N'Policitemia vera')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (269, N'Poliomielitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (270, N'Pólipos uterinos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (271, N'Prediabetes')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (272, N'Presbiacusia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (273, N'Presbicia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (274, N'Priapismo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (275, N'Prostatitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (276, N'Psoriasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (277, N'PTI (trombocitopenia inmune primaria)')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (278, N'Quemaduras')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (279, N'Rabia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (280, N'Raspaduras y laceraciones')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (281, N'Reacciones alérgicas a medicamentos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (282, N'Reanimación cardiopulmonar')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (283, N'Reflujo gastroesofágico')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (284, N'Rescate en montaña')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (285, N'Resistencia a la insulina')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (286, N'Retinosis pigmentaria')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (287, N'Rinitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (288, N'Rosácea')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (289, N'Rubéola')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (290, N'Salmonelosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (291, N'Sarampión')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (292, N'Sarcoidosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (293, N'Sarna')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (294, N'Sepsis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (295, N'Shigelosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (296, N'Shock')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (297, N'SIDA')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (298, N'Sífilis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (299, N'Síndrome de Angelman')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (300, N'Síndrome de Cushing')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (301, N'Síndrome de Down')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (302, N'Síndrome de fatiga crónica')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (303, N'Síndrome de Guillain-Barré ')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (304, N'Síndrome de Klinefelter')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (305, N'Síndrome de Lynch ')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (306, N'Síndrome de Marfan')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (307, N'Síndrome de Noonan')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (308, N'Síndrome de Ovario Poliquístico (SOP)')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (309, N'Síndrome de Patau')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (310, N'Síndrome de piernas inquietas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (311, N'Síndrome de Rett')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (312, N'Síndrome de Reye')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (313, N'Síndrome de Sjögren')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (314, N'Síndrome de Tourette')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (315, N'Síndrome de Turner')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (316, N'Síndrome de Williams')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (317, N'Síndrome de X Frágil')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (318, N'Síndrome del túnel carpiano')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (319, N'Síndrome metabólico')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (320, N'Sinusitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (321, N'Siringomielia ')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (322, N'Sobredosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (323, N'Talasemia')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (324, N'Telangiectasias')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (325, N'Tendinitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (326, N'Teniasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (327, N'Terremotos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (328, N'Tétanos')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (329, N'Tinnitus')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (330, N'Tos ferina')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (331, N'Toxicodermias')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (332, N'Toxoplasmosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (333, N'Tracoma')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (334, N'Trastorno bipolar')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (335, N'Trastorno obsesivo compulsivo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (336, N'Traumatismo craneal')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (337, N'Tricomoniasis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (338, N'Tromboembolismo pulmonar')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (339, N'Trombosis venosa')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (340, N'Tuberculosis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (341, N'Tumores cerebrales')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (342, N'Úlcera')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (343, N'Uretritis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (344, N'Urticaria')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (345, N'Uveítis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (346, N'Vaginitis')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (347, N'Varicela')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (348, N'Varices')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (349, N'Varicocele')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (350, N'Vértigo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (351, N'Virus del Nilo Occidental')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (352, N'Virus Mayaro')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (353, N'Virus Zika')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (354, N'Vitíligo')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (355, N'VPH')
SET IDENTITY_INSERT [dbo].[Enfermedad] OFF
SET IDENTITY_INSERT [dbo].[EspecialidadMedica] ON 

INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (1, N'Alergólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (2, N'Cardiólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (3, N'Cirujano bariátrico')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (4, N'Cirujano cardiovascular')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (5, N'Cirujano de tórax ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (6, N'Cirujano general')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (7, N'Cirujano maxilofacial ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (8, N'Cirujano oncólogo ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (9, N'Cirujano ortopédico')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (10, N'Cirujano plástico ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (11, N'Cirujano Traumatólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (12, N'Cirujanos pediatra ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (13, N'Dermatólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (14, N'Endocrinólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (15, N'Endocrinólogo pediatra ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (16, N'Foniatra')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (17, N'Gastroenterólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (18, N'Gastroenterólogo pediátrico')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (19, N'Geriatra ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (20, N'Ginecólogo infantojuvenil')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (21, N'Ginecólogo y Obstetra')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (22, N'Hematólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (23, N'Infectólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (24, N'Infectólogo pediatra ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (25, N'Inmunólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (26, N'Médico familiar')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (27, N'Médico general')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (28, N'Médico internista')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (29, N'Nefrólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (30, N'Nefrólogo pediátrico ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (31, N'Neonatólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (32, N'Neumonólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (33, N'Neumonólogo pediátrico')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (34, N'Neurocirujano ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (35, N'Neurólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (36, N'Neuropediatra')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (37, N'Nutriólogo pediatra ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (38, N'Oftalmólogo ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (39, N'Oncólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (40, N'Oncólogo infantil')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (41, N'Ondontologo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (42, N'Otorrinolaringólogo ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (43, N'Pediatra')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (44, N'Psiquiatra')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (45, N'Reumatólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (46, N'Sexólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (47, N'Urólogo')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (48, N'Urolólogo pediátrico ')
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (49, N'Médico Traumatólogo')
SET IDENTITY_INSERT [dbo].[EspecialidadMedica] OFF
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (1, N'Amazonas', N'VE-X')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (2, N'Anzoátegui', N'VE-B')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (3, N'Apure', N'VE-C')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (4, N'Aragua', N'VE-D')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (5, N'Barinas', N'VE-E')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (6, N'Bolívar', N'VE-F')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (7, N'Carabobo', N'VE-G')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (8, N'Cojedes', N'VE-H')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (9, N'Delta Amacuro', N'VE-Y')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (10, N'Falcón', N'VE-I')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (11, N'Guárico', N'VE-J')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (12, N'Lara', N'VE-K')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (13, N'Mérida', N'VE-L')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (14, N'Miranda', N'VE-M')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (15, N'Monagas', N'VE-N')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (16, N'Nueva Esparta', N'VE-O')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (17, N'Portuguesa', N'VE-P')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (18, N'Sucre', N'VE-R')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (19, N'Táchira', N'VE-S')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (20, N'Trujillo', N'VE-T')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (21, N'Vargas', N'VE-W')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (22, N'Yaracuy', N'VE-U')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (23, N'Zulia', N'VE-V')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (24, N'Distrito Capital', N'VE-A')
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (25, N'Dependencias Federales', N'VE-Z')
SET IDENTITY_INSERT [dbo].[EstatusCita] ON 

INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (1, N'NO CONFIRMADA')
INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (2, N'CONFIRMADA')
INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (3, N'ATENDIDA')
SET IDENTITY_INSERT [dbo].[EstatusCita] OFF
SET IDENTITY_INSERT [dbo].[FormaPago] ON 

INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (1, N'EFECTIVO')
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (2, N'DEBITO')
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (3, N'CREDITO')
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (4, N'EFECTIVO / DEBITO')
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (5, N'EFECTIVO / DEBITO / CREDITO')
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (6, N'DEBITO / CREDITO')
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (7, N'TRANSFERENCIA ELECTRONICA')
SET IDENTITY_INSERT [dbo].[FormaPago] OFF
SET IDENTITY_INSERT [dbo].[HoraSemana] ON 

INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (1, 1)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (2, 2)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (3, 3)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (4, 4)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (5, 5)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (6, 6)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (7, 7)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (8, 8)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (9, 9)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (10, 10)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (11, 11)
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (12, 12)
SET IDENTITY_INSERT [dbo].[HoraSemana] OFF
SET IDENTITY_INSERT [dbo].[Medico] ON 

INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (1, N'F', 5978663, N'Ingrid Yepez', N'V05978663-2', N'49976', N'13985', 14, N'ESPECIALISTA EN TRATAMIENTO DE DIABETES', N'04261112211', N'YEPEZ')
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (3, N'M', 1, N'Jhenson Sifuentes', N'01', N'0', N'0', 49, N'Médico especialista en traumatología, Cirugía de la columna vertebral, especialista en manejo y tratamiento de la escoliosis', N'0', N'0')
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (4, N'M', 2, N'Carlos Arévalo', N'02', N'0', N'0', 11, N'cirugía ortopédica y traumatológica.ortopedia y Traumatología. ortopedia infantil. reemplazos articulares. artroscopia de rodilla. tratamiento de fracturas, enferemdades degenerativas y corrección de deformidades', N'0', N'0')
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (6, N'M', 3, N'Manuel Pérez', N'03', N'0', N'0', 49, N'Médico traumatólogo ortopedista, patologías de columna , prótesis de cadera y rodilla, fracturas en general - consulta traumatológica , patologías de columna , prótesis , fracturas en general', N'0', N'0')
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (8, N'F', 4, N'Doris Turmero', N'04', N'0', N'0', 21, N'Ecografista Integral. obstetricia.ginecología. planificación Familiar. control Pre Y Post Natal. despistaje De Cáncer. citología.', N'0', N'@doristurmero')
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (9, N'F', 5, N'Maria Chacón', N'04', N'0', N'0', 14, N'CONTROL DE OBESIDAD Y TIROIDES', N'0', N'0')
SET IDENTITY_INSERT [dbo].[Medico] OFF
SET IDENTITY_INSERT [dbo].[MedicoCalendarioSemana] ON 

INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (1, 1, 2, 2, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2, 2, 4, 2, 1, 2, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (3, 1, 2, 9, 2, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (4, 1, 2, 11, 1, 1, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (5, 1, 2, 6, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (6, 3, 1, 8, 2, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (7, 3, 1, 5, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (8, 3, 2, 8, 2, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (9, 3, 2, 5, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (10, 3, 3, 8, 2, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (11, 3, 3, 5, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (12, 3, 4, 8, 2, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (13, 3, 4, 5, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (15, 3, 5, 8, 2, 2, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (16, 3, 5, 5, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (17, 2, 4, 5, 2, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (19, 4, 3, 7, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (20, 4, 3, 6, 2, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (21, 5, 1, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (22, 5, 1, 3, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (23, 5, 2, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (24, 5, 2, 3, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (25, 5, 3, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (26, 5, 3, 3, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (27, 5, 4, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (28, 5, 4, 3, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (29, 5, 5, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (30, 5, 5, 3, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (31, 6, 1, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (32, 6, 1, 2, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (33, 6, 3, 8, 2, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (34, 6, 3, 4, 1, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (35, 6, 5, 1, 1, 2, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (36, 6, 5, 5, 2, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (37, 7, 1, 10, 1, 1, 1)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (38, 7, 1, 5, 2, 2, 0)
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (39, 8, 1, 10, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[MedicoCalendarioSemana] OFF
SET IDENTITY_INSERT [dbo].[MedicoConsultorio] ON 

INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (1, 1, 1, 10, 1)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (2, 2, 1, 10, 4)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (3, 3, 3, 10, 4)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (4, 4, 4, 10, 5)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (5, 5, 6, 10, 4)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (6, 6, 8, 10, 1)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (7, 7, 9, 10, 1)
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID]) VALUES (8, 1, 9, 10, 1)
SET IDENTITY_INSERT [dbo].[MedicoConsultorio] OFF
SET IDENTITY_INSERT [dbo].[MinutosSemana] ON 

INSERT [dbo].[MinutosSemana] ([MinutosSemanaID], [MinutosSemana]) VALUES (1, 0)
INSERT [dbo].[MinutosSemana] ([MinutosSemanaID], [MinutosSemana]) VALUES (2, 30)
SET IDENTITY_INSERT [dbo].[MinutosSemana] OFF
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (1, 1, N'Alto Orinoco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (2, 1, N'Atabapo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (3, 1, N'Atures')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (4, 1, N'Autana')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (5, 1, N'Manapiare')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (6, 1, N'Maroa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (7, 1, N'Río Negro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (8, 2, N'Anaco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (9, 2, N'Aragua')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (10, 2, N'Manuel Ezequiel Bruzual')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (11, 2, N'Diego Bautista Urbaneja')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (12, 2, N'Fernando Peñalver')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (13, 2, N'Francisco Del Carmen Carvajal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (14, 2, N'General Sir Arthur McGregor')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (15, 2, N'Guanta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (16, 2, N'Independencia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (17, 2, N'José Gregorio Monagas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (18, 2, N'Juan Antonio Sotillo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (19, 2, N'Juan Manuel Cajigal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (20, 2, N'Libertad')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (21, 2, N'Francisco de Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (22, 2, N'Pedro María Freites')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (23, 2, N'Píritu')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (24, 2, N'San José de Guanipa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (25, 2, N'San Juan de Capistrano')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (26, 2, N'Santa Ana')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (27, 2, N'Simón Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (28, 2, N'Simón Rodríguez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (29, 3, N'Achaguas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (30, 3, N'Biruaca')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (31, 3, N'Muñóz')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (32, 3, N'Páez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (33, 3, N'Pedro Camejo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (34, 3, N'Rómulo Gallegos')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (35, 3, N'San Fernando')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (36, 4, N'Atanasio Girardot')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (37, 4, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (38, 4, N'Camatagua')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (39, 4, N'Francisco Linares Alcántara')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (40, 4, N'José Ángel Lamas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (41, 4, N'José Félix Ribas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (42, 4, N'José Rafael Revenga')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (43, 4, N'Libertador')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (44, 4, N'Mario Briceño Iragorry')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (45, 4, N'Ocumare de la Costa de Oro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (46, 4, N'San Casimiro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (47, 4, N'San Sebastián')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (48, 4, N'Santiago Mariño')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (49, 4, N'Santos Michelena')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (50, 4, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (51, 4, N'Tovar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (52, 4, N'Urdaneta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (53, 4, N'Zamora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (54, 5, N'Alberto Arvelo Torrealba')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (55, 5, N'Andrés Eloy Blanco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (56, 5, N'Antonio José de Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (57, 5, N'Arismendi')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (58, 5, N'Barinas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (59, 5, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (60, 5, N'Cruz Paredes')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (61, 5, N'Ezequiel Zamora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (62, 5, N'Obispos')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (63, 5, N'Pedraza')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (64, 5, N'Rojas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (65, 5, N'Sosa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (66, 6, N'Caroní')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (67, 6, N'Cedeño')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (68, 6, N'El Callao')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (69, 6, N'Gran Sabana')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (70, 6, N'Heres')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (71, 6, N'Piar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (72, 6, N'Angostura (Raúl Leoni)')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (73, 6, N'Roscio')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (74, 6, N'Sifontes')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (75, 6, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (76, 6, N'Padre Pedro Chien')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (77, 7, N'Bejuma')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (78, 7, N'Carlos Arvelo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (79, 7, N'Diego Ibarra')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (80, 7, N'Guacara')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (81, 7, N'Juan José Mora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (82, 7, N'Libertador')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (83, 7, N'Los Guayos')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (84, 7, N'Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (85, 7, N'Montalbán')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (86, 7, N'Naguanagua')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (87, 7, N'Puerto Cabello')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (88, 7, N'San Diego')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (89, 7, N'San Joaquín')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (90, 7, N'Valencia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (91, 8, N'Anzoátegui')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (92, 8, N'Tinaquillo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (93, 8, N'Girardot')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (94, 8, N'Lima Blanco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (95, 8, N'Pao de San Juan Bautista')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (96, 8, N'Ricaurte')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (97, 8, N'Rómulo Gallegos')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (98, 8, N'San Carlos')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (99, 8, N'Tinaco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (100, 9, N'Antonio Díaz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (101, 9, N'Casacoima')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (102, 9, N'Pedernales')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (103, 9, N'Tucupita')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (104, 10, N'Acosta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (105, 10, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (106, 10, N'Buchivacoa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (107, 10, N'Cacique Manaure')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (108, 10, N'Carirubana')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (109, 10, N'Colina')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (110, 10, N'Dabajuro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (111, 10, N'Democracia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (112, 10, N'Falcón')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (113, 10, N'Federación')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (114, 10, N'Jacura')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (115, 10, N'José Laurencio Silva')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (116, 10, N'Los Taques')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (117, 10, N'Mauroa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (118, 10, N'Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (119, 10, N'Monseñor Iturriza')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (120, 10, N'Palmasola')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (121, 10, N'Petit')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (122, 10, N'Píritu')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (123, 10, N'San Francisco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (124, 10, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (125, 10, N'Tocópero')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (126, 10, N'Unión')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (127, 10, N'Urumaco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (128, 10, N'Zamora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (129, 11, N'Camaguán')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (130, 11, N'Chaguaramas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (131, 11, N'El Socorro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (132, 11, N'José Félix Ribas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (133, 11, N'José Tadeo Monagas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (134, 11, N'Juan Germán Roscio')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (135, 11, N'Julián Mellado')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (136, 11, N'Las Mercedes')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (137, 11, N'Leonardo Infante')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (138, 11, N'Pedro Zaraza')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (139, 11, N'Ortíz')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (140, 11, N'San Gerónimo de Guayabal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (141, 11, N'San José de Guaribe')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (142, 11, N'Santa María de Ipire')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (143, 11, N'Sebastián Francisco de Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (144, 12, N'Andrés Eloy Blanco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (145, 12, N'Crespo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (146, 12, N'Iribarren')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (147, 12, N'Jiménez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (148, 12, N'Morán')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (149, 12, N'Palavecino')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (150, 12, N'Simón Planas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (151, 12, N'Torres')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (152, 12, N'Urdaneta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (179, 13, N'Alberto Adriani')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (180, 13, N'Andrés Bello')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (181, 13, N'Antonio Pinto Salinas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (182, 13, N'Aricagua')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (183, 13, N'Arzobispo Chacón')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (184, 13, N'Campo Elías')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (185, 13, N'Caracciolo Parra Olmedo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (186, 13, N'Cardenal Quintero')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (187, 13, N'Guaraque')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (188, 13, N'Julio César Salas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (189, 13, N'Justo Briceño')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (190, 13, N'Libertador')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (191, 13, N'Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (192, 13, N'Obispo Ramos de Lora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (193, 13, N'Padre Noguera')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (194, 13, N'Pueblo Llano')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (195, 13, N'Rangel')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (196, 13, N'Rivas Dávila')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (197, 13, N'Santos Marquina')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (198, 13, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (199, 13, N'Tovar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (200, 13, N'Tulio Febres Cordero')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (201, 13, N'Zea')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (223, 14, N'Acevedo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (224, 14, N'Andrés Bello')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (225, 14, N'Baruta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (226, 14, N'Brión')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (227, 14, N'Buroz')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (228, 14, N'Carrizal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (229, 14, N'Chacao')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (230, 14, N'Cristóbal Rojas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (231, 14, N'El Hatillo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (232, 14, N'Guaicaipuro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (233, 14, N'Independencia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (234, 14, N'Lander')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (235, 14, N'Los Salias')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (236, 14, N'Páez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (237, 14, N'Paz Castillo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (238, 14, N'Pedro Gual')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (239, 14, N'Plaza')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (240, 14, N'Simón Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (241, 14, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (242, 14, N'Urdaneta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (243, 14, N'Zamora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (258, 15, N'Acosta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (259, 15, N'Aguasay')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (260, 15, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (261, 15, N'Caripe')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (262, 15, N'Cedeño')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (263, 15, N'Ezequiel Zamora')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (264, 15, N'Libertador')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (265, 15, N'Maturín')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (266, 15, N'Piar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (267, 15, N'Punceres')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (268, 15, N'Santa Bárbara')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (269, 15, N'Sotillo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (270, 15, N'Uracoa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (271, 16, N'Antolín del Campo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (272, 16, N'Arismendi')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (273, 16, N'García')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (274, 16, N'Gómez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (275, 16, N'Maneiro')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (276, 16, N'Marcano')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (277, 16, N'Mariño')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (278, 16, N'Península de Macanao')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (279, 16, N'Tubores')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (280, 16, N'Villalba')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (281, 16, N'Díaz')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (282, 17, N'Agua Blanca')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (283, 17, N'Araure')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (284, 17, N'Esteller')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (285, 17, N'Guanare')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (286, 17, N'Guanarito')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (287, 17, N'Monseñor José Vicente de Unda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (288, 17, N'Ospino')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (289, 17, N'Páez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (290, 17, N'Papelón')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (291, 17, N'San Genaro de Boconoíto')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (292, 17, N'San Rafael de Onoto')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (293, 17, N'Santa Rosalía')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (294, 17, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (295, 17, N'Turén')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (296, 18, N'Andrés Eloy Blanco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (297, 18, N'Andrés Mata')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (298, 18, N'Arismendi')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (299, 18, N'Benítez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (300, 18, N'Bermúdez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (301, 18, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (302, 18, N'Cajigal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (303, 18, N'Cruz Salmerón Acosta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (304, 18, N'Libertador')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (305, 18, N'Mariño')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (306, 18, N'Mejía')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (307, 18, N'Montes')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (308, 18, N'Ribero')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (309, 18, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (310, 18, N'Valdéz')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (341, 19, N'Andrés Bello')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (342, 19, N'Antonio Rómulo Costa')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (343, 19, N'Ayacucho')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (344, 19, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (345, 19, N'Cárdenas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (346, 19, N'Córdoba')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (347, 19, N'Fernández Feo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (348, 19, N'Francisco de Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (349, 19, N'García de Hevia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (350, 19, N'Guásimos')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (351, 19, N'Independencia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (352, 19, N'Jáuregui')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (353, 19, N'José María Vargas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (354, 19, N'Junín')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (355, 19, N'Libertad')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (356, 19, N'Libertador')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (357, 19, N'Lobatera')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (358, 19, N'Michelena')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (359, 19, N'Panamericano')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (360, 19, N'Pedro María Ureña')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (361, 19, N'Rafael Urdaneta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (362, 19, N'Samuel Darío Maldonado')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (363, 19, N'San Cristóbal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (364, 19, N'Seboruco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (365, 19, N'Simón Rodríguez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (366, 19, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (367, 19, N'Torbes')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (368, 19, N'Uribante')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (369, 19, N'San Judas Tadeo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (370, 20, N'Andrés Bello')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (371, 20, N'Boconó')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (372, 20, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (373, 20, N'Candelaria')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (374, 20, N'Carache')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (375, 20, N'Escuque')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (376, 20, N'José Felipe Márquez Cañizalez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (377, 20, N'Juan Vicente Campos Elías')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (378, 20, N'La Ceiba')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (379, 20, N'Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (380, 20, N'Monte Carmelo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (381, 20, N'Motatán')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (382, 20, N'Pampán')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (383, 20, N'Pampanito')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (384, 20, N'Rafael Rangel')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (385, 20, N'San Rafael de Carvajal')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (386, 20, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (387, 20, N'Trujillo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (388, 20, N'Urdaneta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (389, 20, N'Valera')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (390, 21, N'Vargas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (391, 22, N'Arístides Bastidas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (392, 22, N'Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (407, 22, N'Bruzual')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (408, 22, N'Cocorote')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (409, 22, N'Independencia')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (410, 22, N'José Antonio Páez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (411, 22, N'La Trinidad')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (412, 22, N'Manuel Monge')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (413, 22, N'Nirgua')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (414, 22, N'Peña')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (415, 22, N'San Felipe')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (416, 22, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (417, 22, N'Urachiche')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (418, 22, N'José Joaquín Veroes')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (441, 23, N'Almirante Padilla')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (442, 23, N'Baralt')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (443, 23, N'Cabimas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (444, 23, N'Catatumbo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (445, 23, N'Colón')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (446, 23, N'Francisco Javier Pulgar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (447, 23, N'Páez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (448, 23, N'Jesús Enrique Losada')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (449, 23, N'Jesús María Semprún')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (450, 23, N'La Cañada de Urdaneta')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (451, 23, N'Lagunillas')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (452, 23, N'Machiques de Perijá')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (453, 23, N'Mara')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (454, 23, N'Maracaibo')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (455, 23, N'Miranda')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (456, 23, N'Rosario de Perijá')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (457, 23, N'San Francisco')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (458, 23, N'Santa Rita')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (459, 23, N'Simón Bolívar')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (460, 23, N'Sucre')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (461, 23, N'Valmore Rodríguez')
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (462, 24, N'Libertador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1, 1, N'Alto Orinoco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (2, 1, N'Huachamacare Acanaña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (3, 1, N'Marawaka Toky Shamanaña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (4, 1, N'Mavaka Mavaka')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (5, 1, N'Sierra Parima Parimabé')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (6, 2, N'Ucata Laja Lisa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (7, 2, N'Yapacana Macuruco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (8, 2, N'Caname Guarinuma')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (9, 3, N'Fernando Girón Tovar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (10, 3, N'Luis Alberto Gómez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (11, 3, N'Pahueña Limón de Parhueña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (12, 3, N'Platanillal Platanillal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (13, 4, N'Samariapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (14, 4, N'Sipapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (15, 4, N'Munduapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (16, 4, N'Guayapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (17, 5, N'Alto Ventuari')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (18, 5, N'Medio Ventuari')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (19, 5, N'Bajo Ventuari')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (20, 6, N'Victorino')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (21, 6, N'Comunidad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (22, 7, N'Casiquiare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (23, 7, N'Cocuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (24, 7, N'San Carlos de Río Negro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (25, 7, N'Solano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (26, 8, N'Anaco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (27, 8, N'San Joaquín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (28, 9, N'Cachipo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (29, 9, N'Aragua de Barcelona')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (30, 11, N'Lechería')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (31, 11, N'El Morro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (32, 12, N'Puerto Píritu')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (33, 12, N'San Miguel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (34, 12, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (35, 13, N'Valle de Guanape')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (36, 13, N'Santa Bárbara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (37, 14, N'El Chaparro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (38, 14, N'Tomás Alfaro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (39, 14, N'Calatrava')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (40, 15, N'Guanta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (41, 15, N'Chorrerón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (42, 16, N'Mamo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (43, 16, N'Soledad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (44, 17, N'Mapire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (45, 17, N'Piar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (46, 17, N'Santa Clara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (47, 17, N'San Diego de Cabrutica')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (48, 17, N'Uverito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (49, 17, N'Zuata')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (50, 18, N'Puerto La Cruz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (51, 18, N'Pozuelos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (52, 19, N'Onoto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (53, 19, N'San Pablo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (54, 20, N'San Mateo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (55, 20, N'El Carito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (56, 20, N'Santa Inés')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (57, 20, N'La Romereña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (58, 21, N'Atapirire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (59, 21, N'Boca del Pao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (60, 21, N'El Pao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (61, 21, N'Pariaguán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (62, 22, N'Cantaura')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (63, 22, N'Libertador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (64, 22, N'Santa Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (65, 22, N'Urica')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (66, 23, N'Píritu')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (67, 23, N'San Francisco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (68, 24, N'San José de Guanipa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (69, 25, N'Boca de Uchire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (70, 25, N'Boca de Chávez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (71, 26, N'Pueblo Nuevo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (72, 26, N'Santa Ana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (73, 27, N'Bergantín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (74, 27, N'Caigua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (75, 27, N'El Carmen')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (76, 27, N'El Pilar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (77, 27, N'Naricual')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (78, 27, N'San Crsitóbal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (79, 28, N'Edmundo Barrios')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (80, 28, N'Miguel Otero Silva')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (81, 29, N'Achaguas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (82, 29, N'Apurito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (83, 29, N'El Yagual')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (84, 29, N'Guachara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (85, 29, N'Mucuritas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (86, 29, N'Queseras del medio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (87, 30, N'Biruaca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (88, 31, N'Bruzual')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (89, 31, N'Mantecal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (90, 31, N'Quintero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (91, 31, N'Rincón Hondo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (92, 31, N'San Vicente')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (93, 32, N'Guasdualito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (94, 32, N'Aramendi')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (95, 32, N'El Amparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (96, 32, N'San Camilo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (97, 32, N'Urdaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (98, 33, N'San Juan de Payara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (99, 33, N'Codazzi')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (100, 33, N'Cunaviche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (101, 34, N'Elorza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (102, 34, N'La Trinidad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (103, 35, N'San Fernando')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (104, 35, N'El Recreo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (105, 35, N'Peñalver')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (106, 35, N'San Rafael de Atamaica')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (107, 36, N'Pedro José Ovalles')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (108, 36, N'Joaquín Crespo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (109, 36, N'José Casanova Godoy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (110, 36, N'Madre María de San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (111, 36, N'Andrés Eloy Blanco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (112, 36, N'Los Tacarigua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (113, 36, N'Las Delicias')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (114, 36, N'Choroní')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (115, 37, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (116, 38, N'Camatagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (117, 38, N'Carmen de Cura')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (118, 39, N'Santa Rita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (119, 39, N'Francisco de Miranda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (120, 39, N'Moseñor Feliciano González')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (121, 40, N'Santa Cruz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (122, 41, N'José Félix Ribas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (123, 41, N'Castor Nieves Ríos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (124, 41, N'Las Guacamayas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (125, 41, N'Pao de Zárate')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (126, 41, N'Zuata')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (127, 42, N'José Rafael Revenga')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (128, 43, N'Palo Negro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (129, 43, N'San Martín de Porres')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (130, 44, N'El Limón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (131, 44, N'Caña de Azúcar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (132, 45, N'Ocumare de la Costa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (133, 46, N'San Casimiro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (134, 46, N'Güiripa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (135, 46, N'Ollas de Caramacate')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (136, 46, N'Valle Morín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (137, 47, N'San Sebastían')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (138, 48, N'Turmero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (139, 48, N'Arevalo Aponte')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (140, 48, N'Chuao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (141, 48, N'Samán de Güere')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (142, 48, N'Alfredo Pacheco Miranda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (143, 49, N'Santos Michelena')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (144, 49, N'Tiara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (145, 50, N'Cagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (146, 50, N'Bella Vista')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (147, 51, N'Tovar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (148, 52, N'Urdaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (149, 52, N'Las Peñitas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (150, 52, N'San Francisco de Cara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (151, 52, N'Taguay')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (152, 53, N'Zamora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (153, 53, N'Magdaleno')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (154, 53, N'San Francisco de Asís')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (155, 53, N'Valles de Tucutunemo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (156, 53, N'Augusto Mijares')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (157, 54, N'Sabaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (158, 54, N'Juan Antonio Rodríguez Domínguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (159, 55, N'El Cantón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (160, 55, N'Santa Cruz de Guacas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (161, 55, N'Puerto Vivas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (162, 56, N'Ticoporo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (163, 56, N'Nicolás Pulido')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (164, 56, N'Andrés Bello')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (165, 57, N'Arismendi')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (166, 57, N'Guadarrama')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (167, 57, N'La Unión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (168, 57, N'San Antonio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (169, 58, N'Barinas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (170, 58, N'Alberto Arvelo Larriva')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (171, 58, N'San Silvestre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (172, 58, N'Santa Inés')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (173, 58, N'Santa Lucía')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (174, 58, N'Torumos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (175, 58, N'El Carmen')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (176, 58, N'Rómulo Betancourt')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (177, 58, N'Corazón de Jesús')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (178, 58, N'Ramón Ignacio Méndez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (179, 58, N'Alto Barinas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (180, 58, N'Manuel Palacio Fajardo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (181, 58, N'Juan Antonio Rodríguez Domínguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (182, 58, N'Dominga Ortiz de Páez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (183, 59, N'Barinitas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (184, 59, N'Altamira de Cáceres')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (185, 59, N'Calderas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (186, 60, N'Barrancas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (187, 60, N'El Socorro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (188, 60, N'Mazparrito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (189, 61, N'Santa Bárbara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (190, 61, N'Pedro Briceño Méndez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (191, 61, N'Ramón Ignacio Méndez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (192, 61, N'José Ignacio del Pumar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (193, 62, N'Obispos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (194, 62, N'Guasimitos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (195, 62, N'El Real')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (196, 62, N'La Luz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (197, 63, N'Ciudad Bolívia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (198, 63, N'José Ignacio Briceño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (199, 63, N'José Félix Ribas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (200, 63, N'Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (201, 64, N'Libertad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (202, 64, N'Dolores')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (203, 64, N'Santa Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (204, 64, N'Palacio Fajardo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (205, 65, N'Ciudad de Nutrias')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (206, 65, N'El Regalo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (207, 65, N'Puerto Nutrias')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (208, 65, N'Santa Catalina')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (209, 66, N'Cachamay')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (210, 66, N'Chirica')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (211, 66, N'Dalla Costa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (212, 66, N'Once de Abril')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (213, 66, N'Simón Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (214, 66, N'Unare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (215, 66, N'Universidad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (216, 66, N'Vista al Sol')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (217, 66, N'Pozo Verde')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (218, 66, N'Yocoima')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (219, 66, N'5 de Julio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (220, 67, N'Cedeño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (221, 67, N'Altagracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (222, 67, N'Ascensión Farreras')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (223, 67, N'Guaniamo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (224, 67, N'La Urbana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (225, 67, N'Pijiguaos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (226, 68, N'El Callao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (227, 69, N'Gran Sabana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (228, 69, N'Ikabarú')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (229, 70, N'Catedral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (230, 70, N'Zea')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (231, 70, N'Orinoco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (232, 70, N'José Antonio Páez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (233, 70, N'Marhuanta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (234, 70, N'Agua Salada')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (235, 70, N'Vista Hermosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (236, 70, N'La Sabanita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (237, 70, N'Panapana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (238, 71, N'Andrés Eloy Blanco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (239, 71, N'Pedro Cova')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (240, 72, N'Raúl Leoni')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (241, 72, N'Barceloneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (242, 72, N'Santa Bárbara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (243, 72, N'San Francisco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (244, 73, N'Roscio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (245, 73, N'Salóm')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (246, 74, N'Sifontes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (247, 74, N'Dalla Costa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (248, 74, N'San Isidro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (249, 75, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (250, 75, N'Aripao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (251, 75, N'Guarataro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (252, 75, N'Las Majadas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (253, 75, N'Moitaco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (254, 76, N'Padre Pedro Chien')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (255, 76, N'Río Grande')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (256, 77, N'Bejuma')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (257, 77, N'Canoabo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (258, 77, N'Simón Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (259, 78, N'Güigüe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (260, 78, N'Carabobo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (261, 78, N'Tacarigua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (262, 79, N'Mariara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (263, 79, N'Aguas Calientes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (264, 80, N'Ciudad Alianza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (265, 80, N'Guacara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (266, 80, N'Yagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (267, 81, N'Morón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (268, 81, N'Yagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (269, 82, N'Tocuyito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (270, 82, N'Independencia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (271, 83, N'Los Guayos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (272, 84, N'Miranda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (273, 85, N'Montalbán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (274, 86, N'Naguanagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (275, 87, N'Bartolomé Salóm')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (276, 87, N'Democracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (277, 87, N'Fraternidad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (278, 87, N'Goaigoaza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (279, 87, N'Juan José Flores')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (280, 87, N'Unión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (281, 87, N'Borburata')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (282, 87, N'Patanemo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (283, 88, N'San Diego')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (284, 89, N'San Joaquín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (285, 90, N'Candelaria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (286, 90, N'Catedral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (287, 90, N'El Socorro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (288, 90, N'Miguel Peña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (289, 90, N'Rafael Urdaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (290, 90, N'San Blas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (291, 90, N'San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (292, 90, N'Santa Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (293, 90, N'Negro Primero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (294, 91, N'Cojedes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (295, 91, N'Juan de Mata Suárez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (296, 92, N'Tinaquillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (297, 93, N'El Baúl')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (298, 93, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (299, 94, N'La Aguadita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (300, 94, N'Macapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (301, 95, N'El Pao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (302, 96, N'El Amparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (303, 96, N'Libertad de Cojedes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (304, 97, N'Rómulo Gallegos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (305, 98, N'San Carlos de Austria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (306, 98, N'Juan Ángel Bravo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (307, 98, N'Manuel Manrique')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (308, 99, N'General en Jefe José Laurencio Silva')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (309, 100, N'Curiapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (310, 100, N'Almirante Luis Brión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (311, 100, N'Francisco Aniceto Lugo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (312, 100, N'Manuel Renaud')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (313, 100, N'Padre Barral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (314, 100, N'Santos de Abelgas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (315, 101, N'Imataca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (316, 101, N'Cinco de Julio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (317, 101, N'Juan Bautista Arismendi')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (318, 101, N'Manuel Piar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (319, 101, N'Rómulo Gallegos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (320, 102, N'Pedernales')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (321, 102, N'Luis Beltrán Prieto Figueroa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (322, 103, N'San José (Delta Amacuro)')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (323, 103, N'José Vidal Marcano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (324, 103, N'Juan Millán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (325, 103, N'Leonardo Ruíz Pineda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (326, 103, N'Mariscal Antonio José de Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (327, 103, N'Monseñor Argimiro García')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (328, 103, N'San Rafael (Delta Amacuro)')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (329, 103, N'Virgen del Valle')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (330, 10, N'Clarines')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (331, 10, N'Guanape')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (332, 10, N'Sabana de Uchire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (333, 104, N'Capadare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (334, 104, N'La Pastora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (335, 104, N'Libertador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (336, 104, N'San Juan de los Cayos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (337, 105, N'Aracua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (338, 105, N'La Peña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (339, 105, N'San Luis')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (340, 106, N'Bariro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (341, 106, N'Borojó')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (342, 106, N'Capatárida')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (343, 106, N'Guajiro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (344, 106, N'Seque')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (345, 106, N'Zazárida')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (346, 106, N'Valle de Eroa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (347, 107, N'Cacique Manaure')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (348, 108, N'Norte')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (349, 108, N'Carirubana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (350, 108, N'Santa Ana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (351, 108, N'Urbana Punta Cardón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (352, 109, N'La Vela de Coro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (353, 109, N'Acurigua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (354, 109, N'Guaibacoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (355, 109, N'Las Calderas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (356, 109, N'Macoruca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (357, 110, N'Dabajuro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (358, 111, N'Agua Clara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (359, 111, N'Avaria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (360, 111, N'Pedregal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (361, 111, N'Piedra Grande')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (362, 111, N'Purureche')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (363, 112, N'Adaure')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (364, 112, N'Adícora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (365, 112, N'Baraived')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (366, 112, N'Buena Vista')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (367, 112, N'Jadacaquiva')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (368, 112, N'El Vínculo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (369, 112, N'El Hato')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (370, 112, N'Moruy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (371, 112, N'Pueblo Nuevo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (372, 113, N'Agua Larga')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (373, 113, N'El Paují')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (374, 113, N'Independencia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (375, 113, N'Mapararí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (376, 114, N'Agua Linda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (377, 114, N'Araurima')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (378, 114, N'Jacura')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (379, 115, N'Tucacas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (380, 115, N'Boca de Aroa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (381, 116, N'Los Taques')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (382, 116, N'Judibana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (383, 117, N'Mene de Mauroa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (384, 117, N'San Félix')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (385, 117, N'Casigua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (386, 118, N'Guzmán Guillermo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (387, 118, N'Mitare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (388, 118, N'Río Seco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (389, 118, N'Sabaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (390, 118, N'San Antonio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (391, 118, N'San Gabriel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (392, 118, N'Santa Ana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (393, 119, N'Boca del Tocuyo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (394, 119, N'Chichiriviche')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (395, 119, N'Tocuyo de la Costa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (396, 120, N'Palmasola')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (397, 121, N'Cabure')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (398, 121, N'Colina')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (399, 121, N'Curimagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (400, 122, N'San José de la Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (401, 122, N'Píritu')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (402, 123, N'San Francisco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (403, 124, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (404, 124, N'Pecaya')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (405, 125, N'Tocópero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (406, 126, N'El Charal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (407, 126, N'Las Vegas del Tuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (408, 126, N'Santa Cruz de Bucaral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (409, 127, N'Bruzual')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (410, 127, N'Urumaco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (411, 128, N'Puerto Cumarebo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (412, 128, N'La Ciénaga')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (413, 128, N'La Soledad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (414, 128, N'Pueblo Cumarebo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (415, 128, N'Zazárida')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (416, 113, N'Churuguara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (417, 129, N'Camaguán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (418, 129, N'Puerto Miranda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (419, 129, N'Uverito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (420, 130, N'Chaguaramas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (421, 131, N'El Socorro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (422, 132, N'Tucupido')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (423, 132, N'San Rafael de Laya')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (424, 133, N'Altagracia de Orituco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (425, 133, N'San Rafael de Orituco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (426, 133, N'San Francisco Javier de Lezama')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (427, 133, N'Paso Real de Macaira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (428, 133, N'Carlos Soublette')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (429, 133, N'San Francisco de Macaira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (430, 133, N'Libertad de Orituco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (431, 134, N'Cantaclaro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (432, 134, N'San Juan de los Morros')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (433, 134, N'Parapara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (434, 135, N'El Sombrero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (435, 135, N'Sosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (436, 136, N'Las Mercedes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (437, 136, N'Cabruta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (438, 136, N'Santa Rita de Manapire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (439, 137, N'Valle de la Pascua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (440, 137, N'Espino')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (441, 138, N'San José de Unare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (442, 138, N'Zaraza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (443, 139, N'San José de Tiznados')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (444, 139, N'San Francisco de Tiznados')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (445, 139, N'San Lorenzo de Tiznados')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (446, 139, N'Ortiz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (447, 140, N'Guayabal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (448, 140, N'Cazorla')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (449, 141, N'San José de Guaribe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (450, 141, N'Uveral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (451, 142, N'Santa María de Ipire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (452, 142, N'Altamira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (453, 143, N'El Calvario')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (454, 143, N'El Rastro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (455, 143, N'Guardatinajas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (456, 143, N'Capital Urbana Calabozo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (457, 144, N'Quebrada Honda de Guache')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (458, 144, N'Pío Tamayo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (459, 144, N'Yacambú')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (460, 145, N'Fréitez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (461, 145, N'José María Blanco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (462, 146, N'Catedral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (463, 146, N'Concepción')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (464, 146, N'El Cují')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (465, 146, N'Juan de Villegas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (466, 146, N'Santa Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (467, 146, N'Tamaca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (468, 146, N'Unión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (469, 146, N'Aguedo Felipe Alvarado')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (470, 146, N'Buena Vista')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (471, 146, N'Juárez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (472, 147, N'Juan Bautista Rodríguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (473, 147, N'Cuara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (474, 147, N'Diego de Lozada')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (475, 147, N'Paraíso de San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (476, 147, N'San Miguel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (477, 147, N'Tintorero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (478, 147, N'José Bernardo Dorante')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (479, 147, N'Coronel Mariano Peraza ')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (480, 148, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (481, 148, N'Anzoátegui')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (482, 148, N'Guarico')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (483, 148, N'Hilario Luna y Luna')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (484, 148, N'Humocaro Alto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (485, 148, N'Humocaro Bajo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (486, 148, N'La Candelaria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (487, 148, N'Morán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (488, 149, N'Cabudare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (489, 149, N'José Gregorio Bastidas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (490, 149, N'Agua Viva')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (491, 150, N'Sarare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (492, 150, N'Buría')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (493, 150, N'Gustavo Vegas León')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (494, 151, N'Trinidad Samuel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (495, 151, N'Antonio Díaz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (496, 151, N'Camacaro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (497, 151, N'Castañeda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (498, 151, N'Cecilio Zubillaga')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (499, 151, N'Chiquinquirá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (500, 151, N'El Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (501, 151, N'Espinoza de los Monteros')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (502, 151, N'Lara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (503, 151, N'Las Mercedes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (504, 151, N'Manuel Morillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (505, 151, N'Montaña Verde')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (506, 151, N'Montes de Oca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (507, 151, N'Torres')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (508, 151, N'Heriberto Arroyo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (509, 151, N'Reyes Vargas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (510, 151, N'Altagracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (511, 152, N'Siquisique')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (512, 152, N'Moroturo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (513, 152, N'San Miguel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (514, 152, N'Xaguas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (515, 179, N'Presidente Betancourt')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (516, 179, N'Presidente Páez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (517, 179, N'Presidente Rómulo Gallegos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (518, 179, N'Gabriel Picón González')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (519, 179, N'Héctor Amable Mora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (520, 179, N'José Nucete Sardi')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (521, 179, N'Pulido Méndez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (522, 180, N'La Azulita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (523, 181, N'Santa Cruz de Mora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (524, 181, N'Mesa Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (525, 181, N'Mesa de Las Palmas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (526, 182, N'Aricagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (527, 182, N'San Antonio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (528, 183, N'Canagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (529, 183, N'Capurí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (530, 183, N'Chacantá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (531, 183, N'El Molino')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (532, 183, N'Guaimaral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (533, 183, N'Mucutuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (534, 183, N'Mucuchachí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (535, 184, N'Fernández Peña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (536, 184, N'Matriz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (537, 184, N'Montalbán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (538, 184, N'Acequias')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (539, 184, N'Jají')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (540, 184, N'La Mesa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (541, 184, N'San José del Sur')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (542, 185, N'Tucaní')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (543, 185, N'Florencio Ramírez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (544, 186, N'Santo Domingo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (545, 186, N'Las Piedras')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (546, 187, N'Guaraque')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (547, 187, N'Mesa de Quintero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (548, 187, N'Río Negro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (549, 188, N'Arapuey')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (550, 188, N'Palmira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (551, 189, N'San Cristóbal de Torondoy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (552, 189, N'Torondoy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (553, 190, N'Antonio Spinetti Dini')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (554, 190, N'Arias')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (555, 190, N'Caracciolo Parra Pérez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (556, 190, N'Domingo Peña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (557, 190, N'El Llano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (558, 190, N'Gonzalo Picón Febres')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (559, 190, N'Jacinto Plaza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (560, 190, N'Juan Rodríguez Suárez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (561, 190, N'Lasso de la Vega')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (562, 190, N'Mariano Picón Salas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (563, 190, N'Milla')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (564, 190, N'Osuna Rodríguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (565, 190, N'Sagrario')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (566, 190, N'El Morro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (567, 190, N'Los Nevados')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (568, 191, N'Andrés Eloy Blanco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (569, 191, N'La Venta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (570, 191, N'Piñango')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (571, 191, N'Timotes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (572, 192, N'Eloy Paredes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (573, 192, N'San Rafael de Alcázar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (574, 192, N'Santa Elena de Arenales')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (575, 193, N'Santa María de Caparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (576, 194, N'Pueblo Llano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (577, 195, N'Cacute')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (578, 195, N'La Toma')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (579, 195, N'Mucuchíes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (580, 195, N'Mucurubá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (581, 195, N'San Rafael')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (582, 196, N'Gerónimo Maldonado')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (583, 196, N'Bailadores')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (584, 197, N'Tabay')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (585, 198, N'Chiguará')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (586, 198, N'Estánquez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (587, 198, N'Lagunillas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (588, 198, N'La Trampa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (589, 198, N'Pueblo Nuevo del Sur')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (590, 198, N'San Juan')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (591, 199, N'El Amparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (592, 199, N'El Llano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (593, 199, N'San Francisco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (594, 199, N'Tovar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (595, 200, N'Independencia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (596, 200, N'María de la Concepción Palacios Blanco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (597, 200, N'Nueva Bolivia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (598, 200, N'Santa Apolonia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (599, 201, N'Caño El Tigre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (600, 201, N'Zea')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (601, 223, N'Aragüita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (602, 223, N'Arévalo González')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (603, 223, N'Capaya')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (604, 223, N'Caucagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (605, 223, N'Panaquire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (606, 223, N'Ribas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (607, 223, N'El Café')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (608, 223, N'Marizapa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (609, 224, N'Cumbo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (610, 224, N'San José de Barlovento')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (611, 225, N'El Cafetal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (612, 225, N'Las Minas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (613, 225, N'Nuestra Señora del Rosario')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (614, 226, N'Higuerote')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (615, 226, N'Curiepe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (616, 226, N'Tacarigua de Brión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (617, 227, N'Mamporal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (618, 228, N'Carrizal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (619, 229, N'Chacao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (620, 230, N'Charallave')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (621, 230, N'Las Brisas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (622, 231, N'El Hatillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (623, 232, N'Altagracia de la Montaña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (624, 232, N'Cecilio Acosta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (625, 232, N'Los Teques')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (626, 232, N'El Jarillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (627, 232, N'San Pedro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (628, 232, N'Tácata')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (629, 232, N'Paracotos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (630, 233, N'Cartanal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (631, 233, N'Santa Teresa del Tuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (632, 234, N'La Democracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (633, 234, N'Ocumare del Tuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (634, 234, N'Santa Bárbara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (635, 235, N'San Antonio de los Altos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (636, 236, N'Río Chico')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (637, 236, N'El Guapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (638, 236, N'Tacarigua de la Laguna')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (639, 236, N'Paparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (640, 236, N'San Fernando del Guapo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (641, 237, N'Santa Lucía del Tuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (642, 238, N'Cúpira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (643, 238, N'Machurucuto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (644, 239, N'Guarenas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (645, 240, N'San Antonio de Yare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (646, 240, N'San Francisco de Yare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (647, 241, N'Leoncio Martínez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (648, 241, N'Petare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (649, 241, N'Caucagüita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (650, 241, N'Filas de Mariche')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (651, 241, N'La Dolorita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (652, 242, N'Cúa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (653, 242, N'Nueva Cúa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (654, 243, N'Guatire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (655, 243, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (656, 258, N'San Antonio de Maturín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (657, 258, N'San Francisco de Maturín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (658, 259, N'Aguasay')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (659, 260, N'Caripito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (660, 261, N'El Guácharo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (661, 261, N'La Guanota')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (662, 261, N'Sabana de Piedra')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (663, 261, N'San Agustín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (664, 261, N'Teresen')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (665, 261, N'Caripe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (666, 262, N'Areo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (667, 262, N'Capital Cedeño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (668, 262, N'San Félix de Cantalicio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (669, 262, N'Viento Fresco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (670, 263, N'El Tejero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (671, 263, N'Punta de Mata')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (672, 264, N'Chaguaramas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (673, 264, N'Las Alhuacas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (674, 264, N'Tabasca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (675, 264, N'Temblador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (676, 265, N'Alto de los Godos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (677, 265, N'Boquerón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (678, 265, N'Las Cocuizas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (679, 265, N'La Cruz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (680, 265, N'San Simón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (681, 265, N'El Corozo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (682, 265, N'El Furrial')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (683, 265, N'Jusepín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (684, 265, N'La Pica')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (685, 265, N'San Vicente')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (686, 266, N'Aparicio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (687, 266, N'Aragua de Maturín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (688, 266, N'Chaguamal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (689, 266, N'El Pinto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (690, 266, N'Guanaguana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (691, 266, N'La Toscana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (692, 266, N'Taguaya')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (693, 267, N'Cachipo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (694, 267, N'Quiriquire')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (695, 268, N'Santa Bárbara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (696, 269, N'Barrancas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (697, 269, N'Los Barrancos de Fajardo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (698, 270, N'Uracoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (699, 271, N'Antolín del Campo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (700, 272, N'Arismendi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (701, 273, N'García')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (702, 273, N'Francisco Fajardo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (703, 274, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (704, 274, N'Guevara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (705, 274, N'Matasiete')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (706, 274, N'Santa Ana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (707, 274, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (708, 275, N'Aguirre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (709, 275, N'Maneiro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (710, 276, N'Adrián')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (711, 276, N'Juan Griego')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (712, 276, N'Yaguaraparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (713, 277, N'Porlamar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (714, 278, N'San Francisco de Macanao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (715, 278, N'Boca de Río')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (716, 279, N'Tubores')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (717, 279, N'Los Baleales')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (718, 280, N'Vicente Fuentes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (719, 280, N'Villalba')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (720, 281, N'San Juan Bautista')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (721, 281, N'Zabala')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (722, 283, N'Capital Araure')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (723, 283, N'Río Acarigua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (724, 284, N'Capital Esteller')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (725, 284, N'Uveral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (726, 285, N'Guanare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (727, 285, N'Córdoba')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (728, 285, N'San José de la Montaña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (729, 285, N'San Juan de Guanaguanare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (730, 285, N'Virgen de la Coromoto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (731, 286, N'Guanarito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (732, 286, N'Trinidad de la Capilla')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (733, 286, N'Divina Pastora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (734, 287, N'Monseñor José Vicente de Unda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (735, 287, N'Peña Blanca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (736, 288, N'Capital Ospino')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (737, 288, N'Aparición')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (738, 288, N'La Estación')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (739, 289, N'Páez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (740, 289, N'Payara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (741, 289, N'Pimpinela')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (742, 289, N'Ramón Peraza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (743, 290, N'Papelón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (744, 290, N'Caño Delgadito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (745, 291, N'San Genaro de Boconoito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (746, 291, N'Antolín Tovar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (747, 292, N'San Rafael de Onoto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (748, 292, N'Santa Fe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (749, 292, N'Thermo Morles')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (750, 293, N'Santa Rosalía')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (751, 293, N'Florida')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (752, 294, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (753, 294, N'Concepción')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (754, 294, N'San Rafael de Palo Alzado')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (755, 294, N'Uvencio Antonio Velásquez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (756, 294, N'San José de Saguaz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (757, 294, N'Villa Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (758, 295, N'Turén')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (759, 295, N'Canelones')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (760, 295, N'Santa Cruz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (761, 295, N'San Isidro Labrador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (762, 296, N'Mariño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (763, 296, N'Rómulo Gallegos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (764, 297, N'San José de Aerocuar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (765, 297, N'Tavera Acosta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (766, 298, N'Río Caribe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (767, 298, N'Antonio José de Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (768, 298, N'El Morro de Puerto Santo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (769, 298, N'Puerto Santo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (770, 298, N'San Juan de las Galdonas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (771, 299, N'El Pilar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (772, 299, N'El Rincón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (773, 299, N'General Francisco Antonio Váquez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (774, 299, N'Guaraúnos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (775, 299, N'Tunapuicito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (776, 299, N'Unión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (777, 300, N'Santa Catalina')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (778, 300, N'Santa Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (779, 300, N'Santa Teresa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (780, 300, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (781, 300, N'Maracapana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (782, 302, N'Libertad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (783, 302, N'El Paujil')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (784, 302, N'Yaguaraparo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (785, 303, N'Cruz Salmerón Acosta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (786, 303, N'Chacopata')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (787, 303, N'Manicuare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (788, 304, N'Tunapuy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (789, 304, N'Campo Elías')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (790, 305, N'Irapa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (791, 305, N'Campo Claro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (792, 305, N'Maraval')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (793, 305, N'San Antonio de Irapa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (794, 305, N'Soro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (795, 306, N'Mejía')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (796, 307, N'Cumanacoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (797, 307, N'Arenas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (798, 307, N'Aricagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (799, 307, N'Cogollar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (800, 307, N'San Fernando')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (801, 307, N'San Lorenzo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (802, 308, N'Villa Frontado (Muelle de Cariaco)')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (803, 308, N'Catuaro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (804, 308, N'Rendón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (805, 308, N'San Cruz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (806, 308, N'Santa María')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (807, 309, N'Altagracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (808, 309, N'Santa Inés')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (809, 309, N'Valentín Valiente')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (810, 309, N'Ayacucho')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (811, 309, N'San Juan')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (812, 309, N'Raúl Leoni')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (813, 309, N'Gran Mariscal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (814, 310, N'Cristóbal Colón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (815, 310, N'Bideau')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (816, 310, N'Punta de Piedras')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (817, 310, N'Güiria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (818, 341, N'Andrés Bello')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (819, 342, N'Antonio Rómulo Costa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (820, 343, N'Ayacucho')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (821, 343, N'Rivas Berti')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (822, 343, N'San Pedro del Río')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (823, 344, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (824, 344, N'Palotal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (825, 344, N'General Juan Vicente Gómez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (826, 344, N'Isaías Medina Angarita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (827, 345, N'Cárdenas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (828, 345, N'Amenodoro Ángel Lamus')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (829, 345, N'La Florida')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (830, 346, N'Córdoba')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (831, 347, N'Fernández Feo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (832, 347, N'Alberto Adriani')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (833, 347, N'Santo Domingo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (834, 348, N'Francisco de Miranda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (835, 349, N'García de Hevia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (836, 349, N'Boca de Grita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (837, 349, N'José Antonio Páez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (838, 350, N'Guásimos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (839, 351, N'Independencia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (840, 351, N'Juan Germán Roscio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (841, 351, N'Román Cárdenas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (842, 352, N'Jáuregui')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (843, 352, N'Emilio Constantino Guerrero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (844, 352, N'Monseñor Miguel Antonio Salas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (845, 353, N'José María Vargas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (846, 354, N'Junín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (847, 354, N'La Petrólea')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (848, 354, N'Quinimarí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (849, 354, N'Bramón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (850, 355, N'Libertad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (851, 355, N'Cipriano Castro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (852, 355, N'Manuel Felipe Rugeles')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (853, 356, N'Libertador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (854, 356, N'Doradas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (855, 356, N'Emeterio Ochoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (856, 356, N'San Joaquín de Navay')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (857, 357, N'Lobatera')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (858, 357, N'Constitución')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (859, 358, N'Michelena')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (860, 359, N'Panamericano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (861, 359, N'La Palmita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (862, 360, N'Pedro María Ureña')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (863, 360, N'Nueva Arcadia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (864, 361, N'Delicias')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (865, 361, N'Pecaya')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (866, 362, N'Samuel Darío Maldonado')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (867, 362, N'Boconó')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (868, 362, N'Hernández')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (869, 363, N'La Concordia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (870, 363, N'San Juan Bautista')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (871, 363, N'Pedro María Morantes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (872, 363, N'San Sebastián')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (873, 363, N'Dr. Francisco Romero Lobo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (874, 364, N'Seboruco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (875, 365, N'Simón Rodríguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (876, 366, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (877, 366, N'Eleazar López Contreras')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (878, 366, N'San Pablo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (879, 367, N'Torbes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (880, 368, N'Uribante')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (881, 368, N'Cárdenas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (882, 368, N'Juan Pablo Peñalosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (883, 368, N'Potosí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (884, 369, N'San Judas Tadeo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (885, 370, N'Araguaney')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (886, 370, N'El Jaguito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (887, 370, N'La Esperanza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (888, 370, N'Santa Isabel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (889, 371, N'Boconó')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (890, 371, N'El Carmen')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (891, 371, N'Mosquey')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (892, 371, N'Ayacucho')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (893, 371, N'Burbusay')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (894, 371, N'General Ribas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (895, 371, N'Guaramacal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (896, 371, N'Vega de Guaramacal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (897, 371, N'Monseñor Jáuregui')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (898, 371, N'Rafael Rangel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (899, 371, N'San Miguel')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (900, 371, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (901, 372, N'Sabana Grande')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (902, 372, N'Cheregüé')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (903, 372, N'Granados')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (904, 373, N'Arnoldo Gabaldón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (905, 373, N'Bolivia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (906, 373, N'Carrillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (907, 373, N'Cegarra')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (908, 373, N'Chejendé')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (909, 373, N'Manuel Salvador Ulloa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (910, 373, N'San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (911, 374, N'Carache')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (912, 374, N'La Concepción')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (913, 374, N'Cuicas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (914, 374, N'Panamericana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (915, 374, N'Santa Cruz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (916, 375, N'Escuque')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (917, 375, N'La Unión')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (918, 375, N'Santa Rita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (919, 375, N'Sabana Libre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (920, 376, N'El Socorro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (921, 376, N'Los Caprichos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (922, 376, N'Antonio José de Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (923, 377, N'Campo Elías')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (924, 377, N'Arnoldo Gabaldón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (925, 378, N'Santa Apolonia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (926, 378, N'El Progreso')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (927, 378, N'La Ceiba')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (928, 378, N'Tres de Febrero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (929, 379, N'El Dividive')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (930, 379, N'Agua Santa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (931, 379, N'Agua Caliente')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (932, 379, N'El Cenizo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (933, 379, N'Valerita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (934, 380, N'Monte Carmelo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (935, 380, N'Buena Vista')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (936, 380, N'Santa María del Horcón')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (937, 381, N'Motatán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (938, 381, N'El Baño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (939, 381, N'Jalisco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (940, 382, N'Pampán')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (941, 382, N'Flor de Patria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (942, 382, N'La Paz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (943, 382, N'Santa Ana')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (944, 383, N'Pampanito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (945, 383, N'La Concepción')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (946, 383, N'Pampanito II')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (947, 384, N'Betijoque')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (948, 384, N'José Gregorio Hernández')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (949, 384, N'La Pueblita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (950, 384, N'Los Cedros')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (951, 385, N'Carvajal')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (952, 385, N'Campo Alegre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (953, 385, N'Antonio Nicolás Briceño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (954, 385, N'José Leonardo Suárez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (955, 386, N'Sabana de Mendoza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (956, 386, N'Junín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (957, 386, N'Valmore Rodríguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (958, 386, N'El Paraíso')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (959, 387, N'Andrés Linares')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (960, 387, N'Chiquinquirá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (961, 387, N'Cristóbal Mendoza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (962, 387, N'Cruz Carrillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (963, 387, N'Matriz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (964, 387, N'Monseñor Carrillo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (965, 387, N'Tres Esquinas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (966, 388, N'Cabimbú')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (967, 388, N'Jajó')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (968, 388, N'La Mesa de Esnujaque')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (969, 388, N'Santiago')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (970, 388, N'Tuñame')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (971, 388, N'La Quebrada')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (972, 389, N'Juan Ignacio Montilla')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (973, 389, N'La Beatriz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (974, 389, N'La Puerta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (975, 389, N'Mendoza del Valle de Momboy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (976, 389, N'Mercedes Díaz')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (977, 389, N'San Luis')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (978, 390, N'Caraballeda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (979, 390, N'Carayaca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (980, 390, N'Carlos Soublette')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (981, 390, N'Caruao Chuspa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (982, 390, N'Catia La Mar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (983, 390, N'El Junko')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (984, 390, N'La Guaira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (985, 390, N'Macuto')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (986, 390, N'Maiquetía')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (987, 390, N'Naiguatá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (988, 390, N'Urimare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (989, 391, N'Arístides Bastidas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (990, 392, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (991, 407, N'Chivacoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (992, 407, N'Campo Elías')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (993, 408, N'Cocorote')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (994, 409, N'Independencia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (995, 410, N'José Antonio Páez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (996, 411, N'La Trinidad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (997, 412, N'Manuel Monge')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (998, 413, N'Salóm')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (999, 413, N'Temerla')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1000, 413, N'Nirgua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1001, 414, N'San Andrés')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1002, 414, N'Yaritagua')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1003, 415, N'San Javier')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1004, 415, N'Albarico')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1005, 415, N'San Felipe')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1006, 416, N'Sucre')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1007, 417, N'Urachiche')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1008, 418, N'El Guayabo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1009, 418, N'Farriar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1010, 441, N'Isla de Toas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1011, 441, N'Monagas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1012, 442, N'San Timoteo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1013, 442, N'General Urdaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1014, 442, N'Libertador')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1015, 442, N'Marcelino Briceño')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1016, 442, N'Pueblo Nuevo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1017, 442, N'Manuel Guanipa Matos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1018, 443, N'Ambrosio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1019, 443, N'Carmen Herrera')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1020, 443, N'La Rosa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1021, 443, N'Germán Ríos Linares')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1022, 443, N'San Benito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1023, 443, N'Rómulo Betancourt')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1024, 443, N'Jorge Hernández')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1025, 443, N'Punta Gorda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1026, 443, N'Arístides Calvani')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1027, 444, N'Encontrados')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1028, 444, N'Udón Pérez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1029, 445, N'Moralito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1030, 445, N'San Carlos del Zulia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1031, 445, N'Santa Cruz del Zulia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1032, 445, N'Santa Bárbara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1033, 445, N'Urribarrí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1034, 446, N'Carlos Quevedo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1035, 446, N'Francisco Javier Pulgar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1036, 446, N'Simón Rodríguez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1037, 446, N'Guamo-Gavilanes')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1038, 448, N'La Concepción')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1039, 448, N'San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1040, 448, N'Mariano Parra León')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1041, 448, N'José Ramón Yépez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1042, 449, N'Jesús María Semprún')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1043, 449, N'Barí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1044, 450, N'Concepción')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1045, 450, N'Andrés Bello')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1046, 450, N'Chiquinquirá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1047, 450, N'El Carmelo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1048, 450, N'Potreritos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1049, 451, N'Libertad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1050, 451, N'Alonso de Ojeda')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1051, 451, N'Venezuela')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1052, 451, N'Eleazar López Contreras')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1053, 451, N'Campo Lara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1054, 452, N'Bartolomé de las Casas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1055, 452, N'Libertad')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1056, 452, N'Río Negro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1057, 452, N'San José de Perijá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1058, 453, N'San Rafael')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1059, 453, N'La Sierrita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1060, 453, N'Las Parcelas')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1061, 453, N'Luis de Vicente')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1062, 453, N'Monseñor Marcos Sergio Godoy')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1063, 453, N'Ricaurte')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1064, 453, N'Tamare')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1065, 454, N'Antonio Borjas Romero')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1066, 454, N'Bolívar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1067, 454, N'Cacique Mara')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1068, 454, N'Carracciolo Parra Pérez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1069, 454, N'Cecilio Acosta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1070, 454, N'Cristo de Aranza')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1071, 454, N'Coquivacoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1072, 454, N'Chiquinquirá')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1073, 454, N'Francisco Eugenio Bustamante')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1074, 454, N'Idelfonzo Vásquez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1075, 454, N'Juana de Ávila')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1076, 454, N'Luis Hurtado Higuera')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1077, 454, N'Manuel Dagnino')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1078, 454, N'Olegario Villalobos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1079, 454, N'Raúl Leoni')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1080, 454, N'Santa Lucía')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1081, 454, N'Venancio Pulgar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1082, 454, N'San Isidro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1083, 455, N'Altagracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1084, 455, N'Faría')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1085, 455, N'Ana María Campos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1086, 455, N'San Antonio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1087, 455, N'San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1088, 456, N'Donaldo García')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1089, 456, N'El Rosario')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1090, 456, N'Sixto Zambrano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1091, 457, N'San Francisco')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1092, 457, N'El Bajo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1093, 457, N'Domitila Flores')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1094, 457, N'Francisco Ochoa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1095, 457, N'Los Cortijos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1096, 457, N'Marcial Hernández')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1097, 458, N'Santa Rita')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1098, 458, N'El Mene')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1099, 458, N'Pedro Lucas Urribarrí')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1100, 458, N'José Cenobio Urribarrí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1101, 459, N'Rafael Maria Baralt')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1102, 459, N'Manuel Manrique')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1103, 459, N'Rafael Urdaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1104, 460, N'Bobures')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1105, 460, N'Gibraltar')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1106, 460, N'Heras')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1107, 460, N'Monseñor Arturo Álvarez')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1108, 460, N'Rómulo Gallegos')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1109, 460, N'El Batey')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1110, 461, N'Rafael Urdaneta')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1111, 461, N'La Victoria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1112, 461, N'Raúl Cuenca')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1113, 447, N'Sinamaica')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1114, 447, N'Alta Guajira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1115, 447, N'Elías Sánchez Rubio')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1116, 447, N'Guajira')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1117, 462, N'Altagracia')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1118, 462, N'Antímano')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1119, 462, N'Caricuao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1120, 462, N'Catedral')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1121, 462, N'Coche')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1122, 462, N'El Junquito')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1123, 462, N'El Paraíso')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1124, 462, N'El Recreo')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1125, 462, N'El Valle')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1126, 462, N'La Candelaria')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1127, 462, N'La Pastora')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1128, 462, N'La Vega')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1129, 462, N'Macarao')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1130, 462, N'San Agustín')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1131, 462, N'San Bernardino')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1132, 462, N'San José')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1133, 462, N'San Juan')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1134, 462, N'San Pedro')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1135, 462, N'Santa Rosalía')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1136, 462, N'Santa Teresa')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1137, 462, N'Sucre (Catia)')
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1138, 462, N'23 de enero')
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] ON 

INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (1, N'Atención Visitas', N'Recepcion')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (6, N'Consultas', N'Solo realizan consultas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (9, N'Opciones Especiales', N'Actualizan tablas')
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (10, N'ADMINISTRADOR', N'ACCESO A TODO')
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] OFF
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] ON 

INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (1, N'Atencion Visitantes')
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (2, N'Consulta de Visitas')
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] OFF
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] ON 

INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (15, 1, 1)
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (16, 1, 2)
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] OFF
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] ON 

INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (2, N'Carceb', N'1', N'CARLOS CEBALLOS', N'ADMINISTRADOR', 10, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (4, N'Admin', N'1', N'Administrador', N'Admin', 10, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (21, N'Secre', N'1', N'SECRETARIA', N'SECRETARIA', 1, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (23, N'Secre2', N'1', N'SECRETARIA', N'SECRETARIA', 1, 0, N'Activo')
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario]) VALUES (24, N'Secre3', N'1', N'SECRETARIA', N'SECRETARIA', 1, 0, N'Activo')
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] OFF
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioEmpresa] ON 

INSERT [dbo].[SeguridadUsuarioEmpresa] ([SeguridadUsuarioEmpresaID], [SeguridadUsuarioDatosID], [SeguridadEmpresaID]) VALUES (1, 21, 1)
INSERT [dbo].[SeguridadUsuarioEmpresa] ([SeguridadUsuarioEmpresaID], [SeguridadUsuarioDatosID], [SeguridadEmpresaID]) VALUES (2, 21, 2)
INSERT [dbo].[SeguridadUsuarioEmpresa] ([SeguridadUsuarioEmpresaID], [SeguridadUsuarioDatosID], [SeguridadEmpresaID]) VALUES (3, 23, 1)
INSERT [dbo].[SeguridadUsuarioEmpresa] ([SeguridadUsuarioEmpresaID], [SeguridadUsuarioDatosID], [SeguridadEmpresaID]) VALUES (5, 24, 7)
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioEmpresa] OFF
SET IDENTITY_INSERT [dbo].[TipoHoraSemana] ON 

INSERT [dbo].[TipoHoraSemana] ([TipoHoraSemanaID], [NombreTipoHoraSemana]) VALUES (1, N'AM')
INSERT [dbo].[TipoHoraSemana] ([TipoHoraSemanaID], [NombreTipoHoraSemana]) VALUES (2, N'PM')
SET IDENTITY_INSERT [dbo].[TipoHoraSemana] OFF
ALTER TABLE [dbo].[Cita] ADD  CONSTRAINT [DF_Cita_EMailPacienteCita]  DEFAULT ('N/D') FOR [EMailPacienteCita]
GO
ALTER TABLE [dbo].[Cita] ADD  CONSTRAINT [DF_Cita_EstatusCitaID]  DEFAULT ((1)) FOR [EstatusCitaID]
GO
ALTER TABLE [dbo].[Cita] ADD  CONSTRAINT [DF_Cita_FechaCreacionCita]  DEFAULT (getdate()) FOR [FechaCreacionCita]
GO
ALTER TABLE [dbo].[Consultorio] ADD  CONSTRAINT [DF_Consultorio_EmailConsultorio]  DEFAULT ('N/D') FOR [EmailConsultorio]
GO
ALTER TABLE [dbo].[MedicoConsultorio] ADD  CONSTRAINT [DF_MedicoConsultorio_NumeroMaximoCitas]  DEFAULT ((1)) FOR [NumeroMaximoCitas]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Estado] FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([EstadoID])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Estado]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Estado] FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([EstadoID])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Estado]
GO
ALTER TABLE [dbo].[Parroquia]  WITH CHECK ADD  CONSTRAINT [FK_Parroquia_Municipio] FOREIGN KEY([MunicipioID])
REFERENCES [dbo].[Municipio] ([MunicipioID])
GO
ALTER TABLE [dbo].[Parroquia] CHECK CONSTRAINT [FK_Parroquia_Municipio]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[68] 4[3] 3[12] 2) )"
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
         Begin Table = "Ciudad"
            Begin Extent = 
               Top = 372
               Left = 312
               Bottom = 556
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Estado"
            Begin Extent = 
               Top = 391
               Left = 567
               Bottom = 496
               Right = 754
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DiaSemana"
            Begin Extent = 
               Top = 7
               Left = 812
               Bottom = 97
               Right = 972
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MedicoCalendarioSemana"
            Begin Extent = 
               Top = 16
               Left = 586
               Bottom = 201
               Right = 846
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoHoraSemana"
            Begin Extent = 
               Top = 197
               Left = 610
               Bottom = 300
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MinutosSemana"
            Begin Extent = 
               Top = 96
               Left = 950
               Bottom = 186
               Right = 1125
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoraSemana"
            Begin Extent = 
               Top = 254
               Left = 830
               Bottom = 344
               Right = 991
            End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleCalendarioConsultorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Medico"
            Begin Extent = 
               Top = 144
               Left = 851
               Bottom = 346
               Right = 1074
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MedicoConsultorio"
            Begin Extent = 
               Top = 21
               Left = 200
               Bottom = 186
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EspecialidadMedica"
            Begin Extent = 
               Top = 95
               Left = 542
               Bottom = 185
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FormaPago"
            Begin Extent = 
               Top = 99
               Left = 524
               Bottom = 313
               Right = 704
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consultorio"
            Begin Extent = 
               Top = 228
               Left = 23
               Bottom = 456
               Right = 277
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
      Begin ColumnWidths = 26
         Width = 284
         Width = 1500
         Width = 2055
         Width = 990
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1245
         Width = 2370
         Width = 4575
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3330
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 3060
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleCalendarioConsultorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleCalendarioConsultorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[21] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Begin Table = "Ciudad"
            Begin Extent = 
               Top = 353
               Left = 346
               Bottom = 473
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Estado"
            Begin Extent = 
               Top = 78
               Left = 907
               Bottom = 183
               Right = 1094
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DiaSemana"
            Begin Extent = 
               Top = 34
               Left = 719
               Bottom = 124
               Right = 879
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MedicoCalendarioSemana"
            Begin Extent = 
               Top = 35
               Left = 993
               Bottom = 155
               Right = 1215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoHoraSemana"
            Begin Extent = 
               Top = 164
               Left = 720
               Bottom = 254
               Right = 927
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MinutosSemana"
            Begin Extent = 
               Top = 139
               Left = 1041
               Bottom = 229
               Right = 1216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HoraSemana"
            Begin Extent = 
               Top = 169
               Left = 614
               Bottom = 259
               Right = 775
           ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleMedicos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Medico"
            Begin Extent = 
               Top = 192
               Left = 993
               Bottom = 312
               Right = 1194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MedicoConsultorio"
            Begin Extent = 
               Top = 52
               Left = 254
               Bottom = 313
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "EspecialidadMedica"
            Begin Extent = 
               Top = 201
               Left = 897
               Bottom = 291
               Right = 1114
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FormaPago"
            Begin Extent = 
               Top = 332
               Left = 831
               Bottom = 422
               Right = 1011
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consultorio"
            Begin Extent = 
               Top = 129
               Left = 10
               Bottom = 259
               Right = 227
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
      Begin ColumnWidths = 21
         Width = 284
         Width = 1245
         Width = 1755
         Width = 1755
         Width = 2115
         Width = 4425
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 8220
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleMedicos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleMedicos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[10] 2[10] 3) )"
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
               Top = 155
               Left = 917
               Bottom = 326
               Right = 1148
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SeguridadUsuarioEmpresa"
            Begin Extent = 
               Top = 3
               Left = 765
               Bottom = 167
               Right = 1003
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MedicoConsultorio"
            Begin Extent = 
               Top = 35
               Left = 336
               Bottom = 233
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Medico"
            Begin Extent = 
               Top = 191
               Left = 564
               Bottom = 387
               Right = 795
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Consultorio"
            Begin Extent = 
               Top = 30
               Left = 23
               Bottom = 232
               Right = 269
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
      Begin ColumnWidths = 15
         Width = 284
         Width = 3825
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
         Width' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleUsuarioConsultorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7215
         Alias = 2535
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleUsuarioConsultorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleUsuarioConsultorio'
GO
USE [master]
GO
ALTER DATABASE [Clinical] SET  READ_WRITE 
GO
