USE [master]
GO
/****** Object:  Database [Clinical]    Script Date: 2/6/2017 3:56:54 p.m. ******/
CREATE DATABASE [Clinical]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinical', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinical.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clinical_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Clinical_log.ldf' , SIZE = 10176KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  StoredProcedure [dbo].[usp_AtencionDoctor_ActualizarConsulta]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AtencionDoctor_ActualizarConsulta]
	(
		@PacienteConsultaID int,
		@DescripcionTratamiento varchar(3000),
		@Medicamentos varchar(3000),
		@DescripcionEvolucionTratamiento varchar(3000),
		@EstatusCitaID int

	)
AS
BEGIN
	UPDATE PacienteConsulta SET 
	DescripcionTratamiento = @DescripcionTratamiento,
	Medicamentos = @Medicamentos,
	DescripcionEvolucionTratamiento = @DescripcionEvolucionTratamiento,
	EstatusCitaID = @EstatusCitaID
	WHERE PacienteConsultaID= @PacienteConsultaID
	
	SELECT @@ROWCOUNT AS CantidadAfectada
END

GO
/****** Object:  StoredProcedure [dbo].[usp_AtencionDoctor_ObtenerConsultaRegistrada]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_AtencionDoctor_ObtenerConsultaRegistrada]
(
	@CedulaPaciente int,
	@FechaDeConsulta varchar(200)
)
AS
BEGIN
	SELECT dbo.PacienteConsulta.PacienteID, dbo.Paciente.CedulaPaciente, CONVERT(VARCHAR(10), dbo.PacienteConsulta.FechaConsulta, 103) AS FechaDeConsulta
	FROM   dbo.PacienteConsulta INNER JOIN dbo.Paciente ON dbo.PacienteConsulta.PacienteID = dbo.Paciente.PacienteID
	WHERE (dbo.Paciente.CedulaPaciente = @CedulaPaciente) 
	AND (CONVERT(VARCHAR(10), dbo.PacienteConsulta.FechaConsulta, 103) = @FechaDeConsulta)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AtencionDoctor_ObtenerDatosPacienteConsulta]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_AtencionDoctor_ObtenerDatosPacienteConsulta]
(
	@CedulaPaciente int,
	@MedicoID int
)
AS
BEGIN
SELECT        dbo.Paciente.PacienteID, dbo.Paciente.SexoPaciente, dbo.Paciente.CedulaPaciente, dbo.Paciente.FechaNacimientoPaciente, CAST(DATEDIFF(dd, dbo.Paciente.FechaNacimientoPaciente, GETDATE()) 
                         / 365.25 AS int) AS Edad, dbo.Paciente.NombrePaciente, dbo.Paciente.CelularPaciente, dbo.Estado.NombreEstado, dbo.Ciudad.NombreCiudad, dbo.Ciudad.CiudadID, dbo.Estado.EstadoID, 
                         dbo.Paciente.DireccionPaciente, dbo.Aseguradora.AseguradoraID, dbo.Aseguradora.NombreAseguradora, dbo.TipoSangre.TipoSangreID, dbo.TipoSangre.NombreTipoSangre, dbo.Paciente.Peso, 
                         dbo.PacienteConsulta.FechaConsulta, dbo.PacienteConsulta.MotivoConsulta, dbo.Medico.MedicoID, dbo.Medico.NombreMedico, dbo.PacienteConsulta.DescripcionTratamiento, 
                         dbo.PacienteConsulta.DescripcionEvolucionTratamiento, dbo.PacienteConsulta.FechaProximaConsulta, dbo.PacienteConsulta.PacienteConsultaID, dbo.PacienteConsulta.Medicamentos, 
                         dbo.PacienteConsulta.EstatusCitaID, CONVERT(VARCHAR(10), dbo.PacienteConsulta.FechaConsulta, 103) AS FechaDeConsulta, dbo.Cita.DescripcionPadecimiento
FROM            dbo.Paciente INNER JOIN
                         dbo.Ciudad ON dbo.Paciente.CiudadID = dbo.Ciudad.CiudadID INNER JOIN
                         dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID INNER JOIN
                         dbo.Aseguradora ON dbo.Paciente.AseguradoraID = dbo.Aseguradora.AseguradoraID INNER JOIN
                         dbo.TipoSangre ON dbo.Paciente.TipoSangreID = dbo.TipoSangre.TipoSangreID INNER JOIN
                         dbo.PacienteConsulta ON dbo.Paciente.PacienteID = dbo.PacienteConsulta.PacienteID INNER JOIN
                         dbo.Medico ON dbo.PacienteConsulta.MedicoID = dbo.Medico.MedicoID INNER JOIN
                         dbo.Cita ON dbo.Paciente.CedulaPaciente = dbo.Cita.CedulaPacienteCita
WHERE        (dbo.Paciente.CedulaPaciente = @CedulaPaciente) AND (dbo.Medico.MedicoID = @MedicoID)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerConsultorios]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerConsultorios] 
	@Query varchar(100)
AS
BEGIN

	SELECT  dbo.Consultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Consultorio.RIFConsultorio, dbo.Consultorio.DireccionConsultorio, dbo.Estado.NombreEstado, dbo.Estado.EstadoID, 
	dbo.Ciudad.NombreCiudad, dbo.Ciudad.CiudadID, dbo.Consultorio.TelefonoConsultorio, dbo.Consultorio.EmailConsultorio
	FROM     dbo.Ciudad INNER JOIN
	dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID INNER JOIN
	dbo.Consultorio ON dbo.Ciudad.CiudadID = dbo.Consultorio.CiudadID
	WHERE        (dbo.Consultorio.NombreConsultorio LIKE '%'+@Query+'%')
	ORDER BY dbo.Consultorio.NombreConsultorio

END


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerMedicoConsultorios]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerMedicoConsultorios] 
	@Query varchar(100)
AS
BEGIN

SELECT        TOP (100) PERCENT dbo.Consultorio.ConsultorioID, 
                         dbo.Consultorio.NombreConsultorio + ' [' + dbo.Estado.NombreEstado + ']  [' + dbo.Ciudad.NombreCiudad + ']  [ Dr. ' + dbo.Medico.NombreMedico + ']' AS DatosLargos, dbo.Consultorio.RIFConsultorio, 
                         dbo.Consultorio.DireccionConsultorio, dbo.Estado.NombreEstado, dbo.Estado.EstadoID, dbo.Ciudad.NombreCiudad, dbo.Ciudad.CiudadID, dbo.Consultorio.TelefonoConsultorio, dbo.Consultorio.EmailConsultorio, 
                         dbo.Medico.NombreMedico, dbo.Medico.MedicoID, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.Consultorio.NombreConsultorio
FROM            dbo.Ciudad INNER JOIN
                         dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID INNER JOIN
                         dbo.Consultorio ON dbo.Ciudad.CiudadID = dbo.Consultorio.CiudadID INNER JOIN
                         dbo.MedicoConsultorio ON dbo.Consultorio.ConsultorioID = dbo.MedicoConsultorio.ConsultorioID INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID
WHERE        (dbo.Consultorio.NombreConsultorio LIKE '%'+@Query+'%')
ORDER BY dbo.Consultorio.NombreConsultorio

END


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerMedicos]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerMedicos] 
	@Query varchar(100)
AS
BEGIN

SELECT        dbo.Medico.MedicoID, dbo.Medico.SexoMedico, dbo.Medico.CedulaMedico, dbo.Medico.NombreMedico, dbo.Medico.RIFMedico, dbo.Medico.MSAS, dbo.Medico.ColegioMedico, dbo.Medico.EspecialidadMedicaID,
                          dbo.Medico.DescripcionEspecialidad, dbo.Medico.CelularMedico, dbo.Medico.EmailMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica
FROM            dbo.Medico INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID
WHERE        (dbo.Medico.CedulaMedico  LIKE '%'+@Query+'%')



 
END


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerMedicosNombre]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerMedicosNombre] 
	@Query varchar(100)
AS
BEGIN

SELECT        dbo.Medico.MedicoID, dbo.Medico.SexoMedico, dbo.Medico.CedulaMedico, dbo.Medico.NombreMedico, dbo.Medico.RIFMedico, dbo.Medico.MSAS, dbo.Medico.ColegioMedico, dbo.Medico.EspecialidadMedicaID,
                          dbo.Medico.DescripcionEspecialidad, dbo.Medico.CelularMedico, dbo.Medico.EmailMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica
FROM            dbo.Medico INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID
WHERE        (dbo.Medico.NombreMedico  LIKE '%'+@Query+'%')



 
END


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerPaciente]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Autocomplete_ObtenerPaciente] 
	@Query varchar(100)
AS
BEGIN
	SELECT dbo.Paciente.*, dbo.Estado.EstadoID, dbo.Ciudad.CiudadID, dbo.Estado.NombreEstado, dbo.Ciudad.NombreCiudad
	FROM   dbo.Ciudad INNER JOIN
	dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID INNER JOIN
	dbo.Paciente ON dbo.Ciudad.CiudadID = dbo.Paciente.CiudadID
	WHERE (CedulaPaciente LIKE '%'+@Query+'%')
	ORDER BY CedulaPaciente


END


GO
/****** Object:  StoredProcedure [dbo].[usp_Autocomplete_ObtenerUsuarios]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_InsertarCita]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CitaAgendar_InsertarCita]
	(
		@MedicoConsultorioID int,
		@FechaCita smalldatetime,
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
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_ObtenerCalendario]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaAgendar_ObtenerCalendario]
(
	@MedicoConsultorioID int,
	@DiaSemana varchar(200)
)
AS
BEGIN
SELECT        TOP (100) PERCENT dbo.MedicoCalendarioSemana.MedicoCalendarioSemanaID, dbo.DiaSemana.DiaSemanaID, dbo.TipoHoraSemana.TipoHoraSemanaID, dbo.DiaSemana.DiaSemana, 
                         dbo.HoraSemana.HoraSemana, dbo.MinutosSemana.MinutosSemana, dbo.TipoHoraSemana.NombreTipoHoraSemana, dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, 
                         dbo.Medico.DescripcionEspecialidad, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.MedicoConsultorio.NumeroMaximoCitas, dbo.Medico.MedicoID, dbo.MedicoCalendarioSemana.IndicaHoraInicial, 
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
                         dbo.MedicoCalendarioSemana.MedicoConsultorioID = dbo.MedicoConsultorio.MedicoConsultorioID ON dbo.Consultorio.ConsultorioID = dbo.MedicoConsultorio.ConsultorioID
WHERE        (dbo.MedicoCalendarioSemana.IndicaHoraInicial = 0) AND (dbo.MedicoConsultorio.MedicoConsultorioID = @MedicoConsultorioID) AND (dbo.DiaSemana.DiaSemana = @DiaSemana)
ORDER BY dbo.DiaSemana.DiaSemanaID, dbo.TipoHoraSemana.TipoHoraSemanaID, dbo.HoraSemana.HoraSemana

END
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_ObtenerCitaPorCedula]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaAgendar_ObtenerCitaPorCedula]
(
	@CedulaPacienteCita int
)
AS
BEGIN
	SELECT * FROM Cita WHERE CedulaPacienteCita = @CedulaPacienteCita

END
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_ObtenerCitasConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaAgendar_ObtenerCitasConsultorio]
(
	@MedicoConsultorioID int,
	@FechaCita varchar(200)
)
AS
BEGIN
SELECT        MedicoConsultorioID, EstatusCitaID, COUNT(MedicoConsultorioID) AS TotalCitas, CONVERT(varchar(200), FechaCita, 103) AS FechaDeCita
FROM            dbo.Cita
GROUP BY MedicoConsultorioID, EstatusCitaID, FechaCita
HAVING        (EstatusCitaID = 1) AND (MedicoConsultorioID = @MedicoConsultorioID) AND (CONVERT(varchar(200), FechaCita, 103) = @FechaCita)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaAgendar_ObtenerSeleccionConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_CitaCola_ActualizarEstatusCita]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CitaCola_ActualizarEstatusCita]
	(
		@CitaID int,
		@EstatusCitaID int,
		@DescripcionPadecimiento varchar(200),
		@MedicoConsultorioD int
	)
AS
BEGIN
	UPDATE Cita SET 
	EstatusCitaID = @EstatusCitaID,
	DescripcionPadecimiento = @DescripcionPadecimiento,
	MedicoConsultorioID = @MedicoConsultorioD
	WHERE CitaID= @CitaID
	
	SELECT @@ROWCOUNT AS CantidadAfectada
END

GO
/****** Object:  StoredProcedure [dbo].[usp_CitaCola_EliminarCitaCola]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CitaCola_EliminarCitaCola]
	 @CitaID int
AS
BEGIN
	DELETE FROM Cita WHERE CitaID = @CitaID
	select @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaCola_InsertarPacienteConsulta]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CitaCola_InsertarPacienteConsulta]
	(
		@PacienteID int,
		@CedulaPaciente int,
		@FechaConsulta smalldatetime,
		@MotivoConsulta varchar(200),
		@MedicoConsultorioID int,
		@MedicoID int
	)

AS
BEGIN	
	SELECT @PacienteID = PacienteID FROM Paciente WHERE CedulaPaciente = @CedulaPaciente
	SELECT @MedicoID = MedicoID FROM MedicoConsultorio WHERE MedicoConsultorioID =@MedicoConsultorioID
	INSERT INTO PacienteConsulta
	(
		PacienteID,
		FechaConsulta,
		MotivoConsulta,
		MedicoID,
		EstatusCitaID
	) 
	VALUES
	(
		@PacienteID,
		@FechaConsulta,
		@MotivoConsulta,
		@MedicoID,
		3
	)
	SELECT @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[usp_CitaCola_ObtenerColaDeCitas]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaCola_ObtenerColaDeCitas]
(
	@ConsultorioID int,
	@FechaDeCita varchar(200)
)
AS
BEGIN
SELECT        TOP (100) PERCENT dbo.Cita.CitaID, dbo.MedicoConsultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, 
                         CONVERT(VARCHAR(10), dbo.Cita.FechaCita, 103) AS FechaDeCita, dbo.Cita.CedulaPacienteCita, dbo.Cita.NombrePacienteCita, dbo.Cita.CelularPacienteCita, dbo.CitaMotivo.NombreCitaMotivo, 
                         dbo.Cita.EMailPacienteCita, dbo.EstatusCita.NombreEstatusCita, dbo.Cita.FechaCreacionCita, dbo.EstatusCita.EstatusCitaID, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.CitaMotivo.CitaMotivoID, 
                         dbo.Cita.FechaCita, dbo.Cita.DescripcionPadecimiento, ISNULL(dbo.Paciente.NombrePaciente, '[PACIENTE SIN HISTORIA MEDICA]') AS PacienteRegistrado, dbo.Medico.MedicoID

FROM            dbo.Cita INNER JOIN
                         dbo.MedicoConsultorio ON dbo.Cita.MedicoConsultorioID = dbo.MedicoConsultorio.MedicoConsultorioID INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID INNER JOIN
                         dbo.EstatusCita ON dbo.Cita.EstatusCitaID = dbo.EstatusCita.EstatusCitaID INNER JOIN
                         dbo.CitaMotivo ON dbo.Cita.CitaMotivoID = dbo.CitaMotivo.CitaMotivoID LEFT OUTER JOIN
                         dbo.Paciente ON dbo.Cita.CedulaPacienteCita = dbo.Paciente.CedulaPaciente
WHERE        (dbo.EstatusCita.EstatusCitaID <> 4) AND (dbo.MedicoConsultorio.ConsultorioID = @ConsultorioID) AND (CONVERT(VARCHAR(10), dbo.Cita.FechaCita, 103) = @FechaDeCita)
ORDER BY dbo.Cita.FechaCreacionCita

END
GO
/****** Object:  StoredProcedure [dbo].[usp_CitaCola_ObtenerPacienteEnAtencion]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_CitaCola_ObtenerPacienteEnAtencion]
(
	@ConsultorioID int,
	@FechaDeCita varchar(200),
	@MedicoID int
)
AS
BEGIN
SELECT        TOP (100) PERCENT dbo.Cita.CitaID, dbo.MedicoConsultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, 
                         CONVERT(VARCHAR(10), dbo.Cita.FechaCita, 103) AS FechaDeCita, dbo.Cita.CedulaPacienteCita, dbo.Cita.NombrePacienteCita, dbo.Cita.CelularPacienteCita, dbo.CitaMotivo.NombreCitaMotivo, 
                         dbo.Cita.EMailPacienteCita, dbo.EstatusCita.NombreEstatusCita, dbo.Cita.FechaCreacionCita, dbo.EstatusCita.EstatusCitaID, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.CitaMotivo.CitaMotivoID, 
                         dbo.Cita.FechaCita, dbo.Cita.DescripcionPadecimiento, dbo.Medico.MedicoID

FROM            dbo.Cita INNER JOIN
                         dbo.MedicoConsultorio ON dbo.Cita.MedicoConsultorioID = dbo.MedicoConsultorio.MedicoConsultorioID INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID INNER JOIN
                         dbo.EstatusCita ON dbo.Cita.EstatusCitaID = dbo.EstatusCita.EstatusCitaID INNER JOIN
                         dbo.CitaMotivo ON dbo.Cita.CitaMotivoID = dbo.CitaMotivo.CitaMotivoID
WHERE        (dbo.EstatusCita.EstatusCitaID = 3) AND (dbo.MedicoConsultorio.ConsultorioID = @ConsultorioID) AND (CONVERT(VARCHAR(10), dbo.Cita.FechaCita, 103) = @FechaDeCita) AND (dbo.Medico.MedicoID = @MedicoID)

ORDER BY dbo.Cita.FechaCreacionCita

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Consultorio_ActualizarConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Consultorio_ActualizarConsultorio]
	(
		@ConsultorioID int,
		@NombreConsultorio varchar(200),
		@RIFConsultorio varchar(200),
		@DireccionConsultorio varchar(200),
		@CiudadID int,
		@TelefonoConsultorio varchar(200),
		@EmailConsultorio varchar (200)
	)
AS
BEGIN
	UPDATE Consultorio SET 
	NombreConsultorio= @NombreConsultorio,
	RIFConsultorio = @RIFConsultorio,
	DireccionConsultorio = @DireccionConsultorio,
	CiudadID = @CiudadID,
	TelefonoConsultorio = @TelefonoConsultorio,
	EmailConsultorio = @EmailConsultorio

	WHERE ConsultorioID= @ConsultorioID
	
	SELECT @@ROWCOUNT AS CantidadAfectada
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Consultorio_InsertarConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Consultorio_InsertarConsultorio]
	(
		@NombreConsultorio varchar(200),
		@RIFConsultorio varchar(200),
		@DireccionConsultorio varchar(200),
		@CiudadID int,
		@TelefonoConsultorio varchar(200),
		@EmailConsultorio varchar (200)
	)
AS
BEGIN
	INSERT INTO Consultorio
	(
		NombreConsultorio,
		RIFConsultorio,
		DireccionConsultorio,
		CiudadID,
		TelefonoConsultorio,
		EmailConsultorio
	) 
	VALUES
	(
		@NombreConsultorio,
		@RIFConsultorio,
		@DireccionConsultorio,
		@CiudadID,
		@TelefonoConsultorio,
		@EmailConsultorio
	)
	SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_Login_MedicoConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_Login_MedicoConsultorio]
(
	@MedicoID int
)
AS
BEGIN

SELECT        dbo.Consultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.MedicoConsultorio.MedicoConsultorioID, dbo.MedicoConsultorio.NumeroMaximoCitas, dbo.SeguridadUsuarioDatos.LoginUsuario, 
                         dbo.SeguridadUsuarioDatos.ClaveUsuario, dbo.Medico.NombreMedico, dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID
FROM            dbo.MedicoConsultorio INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID INNER JOIN
                         dbo.SeguridadUsuarioDatos ON dbo.MedicoConsultorio.SeguridadUsuarioDatosID = dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID
				WHERE        (dbo.Medico.MedicoID = @MedicoID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Login_UsuarioMedico]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_Login_UsuarioMedico]
(
	@SeguridadUsuarioDatosID int
)
AS
BEGIN
SELECT        SeguridadUsuarioDatosID, UsuarioTecnico, MedicoID
FROM            dbo.SeguridadUsuarioDatos
WHERE        (SeguridadUsuarioDatosID = @SeguridadUsuarioDatosID) AND (UsuarioTecnico = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Login_ValidarLogin]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Login_ValidarLogin]
	-- Add the parameters for the stored procedure here
	@LoginUsuario varchar(500),
	@ClaveUsuario varchar(150)
	
AS
	SELECT * FROM SeguridadUsuarioDatos
	 WHERE LoginUsuario = @LoginUsuario and ClaveUsuario=@ClaveUsuario

GO
/****** Object:  StoredProcedure [dbo].[usp_Login_ValidarLoginConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Login_ValidarLoginConsultorio]
	-- Add the parameters for the stored procedure here
	@LoginUsuario varchar(500),
	@ClaveUsuario varchar(150)
	
AS
	SELECT dbo.SeguridadUsuarioDatos.SeguridadUsuarioDatosID, dbo.SeguridadUsuarioDatos.LoginUsuario, dbo.SeguridadUsuarioDatos.ClaveUsuario, dbo.SeguridadUsuarioDatos.NombreCompleto, 
		dbo.SeguridadUsuarioDatos.DescripcionUsuario, dbo.SeguridadUsuarioDatos.SeguridadGrupoID, dbo.SeguridadUsuarioDatos.UsuarioTecnico, dbo.SeguridadUsuarioDatos.EstatusUsuario, 
		dbo.Consultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Consultorio.RIFConsultorio, dbo.Consultorio.DireccionConsultorio
	FROM dbo.SeguridadUsuarioDatos INNER JOIN
		dbo.Consultorio ON dbo.SeguridadUsuarioDatos.ConsultorioID = dbo.Consultorio.ConsultorioID
	WHERE LoginUsuario = @LoginUsuario and ClaveUsuario=@ClaveUsuario

GO
/****** Object:  StoredProcedure [dbo].[usp_Medico_ActualizarUsuarioMedico]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Medico_ActualizarUsuarioMedico]
(
	@SeguridadUsuarioDatosID int,
	@MedicoID int
)
AS
BEGIN
	UPDATE SeguridadUsuarioDatos set 
	MedicoID= @MedicoID,
	UsuarioTecnico = 1

	
	WHERE SeguridadUsuarioDatosID= @SeguridadUsuarioDatosID
	
	select @@ROWCOUNT as CantidadAfectada
end

GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoCalendario_EliminarMedicoCalendario]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_MedicoCalendario_EliminarMedicoCalendario]
(
	@MedicoCalendarioSemanaID int
)
AS
BEGIN
	DELETE FROM MedicoCalendarioSemana WHERE MedicoCalendarioSemanaID = @MedicoCalendarioSemanaID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoCalendario_InsertarMedicoCalendario]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MedicoCalendario_InsertarMedicoCalendario]
	(
		@MedicoConsultorioID int,
		@DiaSemanaID int,
		@HoraSemanaID int,
		@MinutosSemanaID int,
		@TipoHoraSemanaID int,
		@IndicaHoraInicial bit
	)
AS
BEGIN
	INSERT INTO MedicoCalendarioSemana
	(
		MedicoConsultorioID,
		DiaSemanaID,
		HoraSemanaID,
		MinutosSemanaID,
		TipoHoraSemanaID,
		IndicaHoraInicial
	) 
	VALUES
	(
		@MedicoConsultorioID,
		@DiaSemanaID,
		@HoraSemanaID,
		@MinutosSemanaID, 
		@TipoHoraSemanaID,
		@IndicaHoraInicial
	)
	SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoCalendario_ObtenerCalendario]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MedicoCalendario_ObtenerCalendario] 
	@MedicoID int
AS
BEGIN

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
WHERE        (dbo.Medico.MedicoID = @MedicoID)
ORDER BY dbo.DiaSemana.DiaSemanaID, dbo.TipoHoraSemana.TipoHoraSemanaID, dbo.Ciudad.NombreCiudad, dbo.HoraSemana.HoraSemana

END


GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoConsultorio_EliminarMedicoConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_MedicoConsultorio_EliminarMedicoConsultorio]
(
	@MedicoConsultorio int
)
AS
BEGIN
	DELETE FROM MedicoConsultorio WHERE MedicoConsultorioID = @MedicoConsultorio
END
GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoConsultorio_InsertarMedicoConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MedicoConsultorio_InsertarMedicoConsultorio]
	(
		@ConsultorioID int,
		@MedicoID int,
		@NumeroMaximoCitas int,
		@FormaPagoID int
	)
AS
BEGIN
	INSERT INTO MedicoConsultorio
	(
		ConsultorioID,
		MedicoID,
		NumeroMaximoCitas,
		FormaPagoID
	) 
	VALUES
	(
		@ConsultorioID,
		@MedicoID,
		@NumeroMaximoCitas,
		@FormaPagoID
	)
	SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoConsultorio_ObtenerMedicoConConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_MedicoConsultorio_ObtenerMedicoConConsultorio]
(
	@MedicoID int,
	@ConsultorioID int
)
AS
BEGIN
		SELECT * FROM MedicoConsultorio WHERE MedicoID = @MedicoID AND ConsultorioID = @ConsultorioID
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_MedicoConsultorio_ObtenerMedicoConsultorios]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_MedicoConsultorio_ObtenerMedicoConsultorios]
(
	@MedicoID int
)
AS
BEGIN

SELECT        TOP (100) PERCENT dbo.Medico.MedicoID, dbo.Medico.NombreMedico, dbo.EspecialidadMedica.NombreEspecialidadMedica, dbo.Consultorio.NombreConsultorio, dbo.Estado.NombreEstado, 
                         dbo.Ciudad.NombreCiudad, dbo.FormaPago.NombreFormaPago, dbo.Estado.EstadoID, dbo.Ciudad.CiudadID, dbo.EspecialidadMedica.EspecialidadMedicaID, dbo.MedicoConsultorio.MedicoConsultorioID, 
                         dbo.Consultorio.ConsultorioID
FROM            dbo.Medico INNER JOIN
                         dbo.FormaPago INNER JOIN
                         dbo.MedicoConsultorio ON dbo.FormaPago.FormaPagoID = dbo.MedicoConsultorio.FormaPagoID ON dbo.Medico.MedicoID = dbo.MedicoConsultorio.MedicoID INNER JOIN
                         dbo.Consultorio ON dbo.MedicoConsultorio.ConsultorioID = dbo.Consultorio.ConsultorioID INNER JOIN
                         dbo.Ciudad INNER JOIN
                         dbo.Estado ON dbo.Ciudad.EstadoID = dbo.Estado.EstadoID ON dbo.Consultorio.CiudadID = dbo.Ciudad.CiudadID INNER JOIN
                         dbo.EspecialidadMedica ON dbo.Medico.EspecialidadMedicaID = dbo.EspecialidadMedica.EspecialidadMedicaID
WHERE        (dbo.Medico.MedicoID = @MedicoID)
ORDER BY dbo.Medico.MedicoID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Medicos_ActualizarMedico]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Medicos_ActualizarMedico]
	(
		@MedicoID int,
		@SexoMedico varchar(200),
		@CedulaMedico int,
		@NombreMedico varchar(200),
		@RIFMedico varchar(200),
		@MSAS varchar(200),
		@ColegioMedico varchar (200),
		@EspecialidadMedicaID int,
		@DescripcionEspecialidad varchar (200),
		@CelularMedico varchar (200),
		@EmailMedico varchar (200)
	)
AS
BEGIN
	UPDATE Medico SET 
	SexoMedico= @SexoMedico,
	CedulaMedico = @CedulaMedico,
	NombreMedico = @NombreMedico,
	RIFMedico = @RIFMedico,
	MSAS = @MSAS,
	ColegioMedico = @ColegioMedico,
	EspecialidadMedicaID = @EspecialidadMedicaID,
	DescripcionEspecialidad = @DescripcionEspecialidad,
	CelularMedico = @CelularMedico,
	EmailMedico = @EmailMedico
	
	WHERE MedicoID= @MedicoID
	
	SELECT @@ROWCOUNT AS CantidadAfectada
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Medicos_InsertarMedico]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Medicos_InsertarMedico]
	(
		@SexoMedico varchar(200),
		@CedulaMedico int,
		@NombreMedico varchar(200),
		@RIFMedico varchar(200),
		@MSAS varchar(200),
		@ColegioMedico varchar (200),
		@EspecialidadMedicaID int,
		@DescripcionEspecialidad varchar (200),
		@CelularMedico varchar (200),
		@EmailMedico varchar (200)
	)
AS
BEGIN
	INSERT INTO Medico
	(
		SexoMedico,
		CedulaMedico,
		NombreMedico,
		RIFMedico,
		MSAS,
		ColegioMedico,
		EspecialidadMedicaID,
		DescripcionEspecialidad,
		CelularMedico,
		EmailMedico

	) 
	VALUES
	(
		@SexoMedico,
		@CedulaMedico,
		@NombreMedico,
		@RIFMedico, 
		@MSAS,
		@ColegioMedico, 
		@EspecialidadMedicaID, 
		@DescripcionEspecialidad, 
		@CelularMedico, 
		@EmailMedico
	)
	SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_Paciente_ActualizarPaciente]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Paciente_ActualizarPaciente]
	(
		@PacienteID int,
		@SexoPaciente varchar(12),
		@CedulaPaciente int,
		@FechaNacimientoPaciente smalldatetime,
		@NombrePaciente varchar(200),
		@CelularPaciente varchar(200),
		@CiudadID int,
		@DireccionPaciente varchar(300),
		@AseguradoraID int,
		@TipoSangreID int,
		@Peso int
	)
AS
BEGIN
	UPDATE Paciente SET 
	SexoPaciente= @SexoPaciente,
	CedulaPaciente = @CedulaPaciente,
	FechaNacimientoPaciente = @FechaNacimientoPaciente,
	NombrePaciente = @NombrePaciente,
	CelularPaciente = @CelularPaciente,
	CiudadID = @CiudadID,
	DireccionPaciente = @DireccionPaciente,
	AseguradoraID = @AseguradoraID,
	TipoSangreID = @TipoSangreID,
	Peso = @Peso
	
	WHERE PacienteID= @PacienteID
	
	SELECT @@ROWCOUNT AS CantidadAfectada
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Paciente_InsertarPaciente]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Paciente_InsertarPaciente]
	(
		@SexoPaciente varchar(12),
		@CedulaPaciente int,
		@FechaNacimientoPaciente smalldatetime,
		@NombrePaciente varchar(200),
		@CelularPaciente varchar(200),
		@CiudadID int,
		@DireccionPaciente varchar(300),
		@AseguradoraID int,
		@TipoSangreID int,
		@Peso int
	)
AS
BEGIN
	INSERT INTO Paciente
	(
		SexoPaciente,
		CedulaPaciente,
		FechaNacimientoPaciente,
		NombrePaciente,
		CelularPaciente,
		CiudadID,
		DireccionPaciente,
		AseguradoraID,
		TipoSangreID,
		Peso

	) 
	VALUES
	(
		@SexoPaciente,
		@CedulaPaciente,
		@FechaNacimientoPaciente,
		@NombrePaciente,
		@CelularPaciente,
		@CiudadID,
		@DireccionPaciente,
		@AseguradoraID,
		@TipoSangreID,
		@Peso
	)
	SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAccesoObjeto]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Seguridad_ObtenerAdministrador]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Actualizar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadGrupo_Insertar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Actualizar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjeto_Insertar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_EliminarObjetoGrupo]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_Insertar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetoGrupo]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadObjetoGrupo_ObtenerObjetosGrupo]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Actualizar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ActualizarClave]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_Insertar]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
		@EstatusUsuario varchar(200),
		@ConsultorioID int
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
		EstatusUsuario,
		ConsultorioID
	)
	VALUES
	(
		@LoginUsuario,
		@ClaveUsuario,
		@NombreCompleto,
		@DescripcionUsuario,
		@SeguridadGrupoID,
		@UsuarioTecnico,
		@EstatusUsuario,
		@ConsultorioID
		
	)
		select @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [dbo].[usp_SeguridadUsuario_ObtenerLogin]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Aseguradora]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aseguradora](
	[AseguradoraID] [int] IDENTITY(1,1) NOT NULL,
	[NombreAseguradora] [varchar](50) NOT NULL,
	[TelefonoAseguradora] [varchar](50) NOT NULL,
	[ContactoAseguradora] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Aseguradora] PRIMARY KEY CLUSTERED 
(
	[AseguradoraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
	[DescripcionPadecimiento] [varchar](150) NULL,
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
/****** Object:  Table [dbo].[CitaMotivo]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Ciudad]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Consultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consultorio](
	[ConsultorioID] [int] IDENTITY(1,1) NOT NULL,
	[NombreConsultorio] [varchar](200) NOT NULL,
	[RIFConsultorio] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[DiaSemana]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[EspecialidadMedica]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Estado]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[EstatusCita]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[FormaPago]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[HistoriaMedica]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistoriaMedica](
	[HistoriaMedicaID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[Alergias] [bit] NOT NULL,
	[DescripcionAlergias] [varchar](150) NOT NULL,
	[Fumador] [bit] NOT NULL,
 CONSTRAINT [PK_HistoriaMedica] PRIMARY KEY CLUSTERED 
(
	[HistoriaMedicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoraSemana]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Medico]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[MedicoCalendarioSemana]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoCalendarioSemana](
	[MedicoCalendarioSemanaID] [int] IDENTITY(1,1) NOT NULL,
	[MedicoConsultorioID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[MedicoConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
	[SeguridadUsuarioDatosID] [int] NOT NULL,
 CONSTRAINT [PK_Consultorio] PRIMARY KEY CLUSTERED 
(
	[MedicoConsultorioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MinutosSemana]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Municipio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[PacienteID] [int] IDENTITY(1,1) NOT NULL,
	[SexoPaciente] [varchar](1) NOT NULL,
	[CedulaPaciente] [int] NOT NULL,
	[FechaNacimientoPaciente] [smalldatetime] NOT NULL,
	[NombrePaciente] [varchar](64) NOT NULL,
	[CelularPaciente] [varchar](64) NOT NULL,
	[CiudadID] [int] NOT NULL,
	[DireccionPaciente] [varchar](150) NOT NULL,
	[AseguradoraID] [int] NOT NULL,
	[TipoSangreID] [int] NOT NULL,
	[Peso] [int] NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PacienteConsulta]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PacienteConsulta](
	[PacienteConsultaID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[FechaConsulta] [smalldatetime] NOT NULL,
	[MotivoConsulta] [varchar](150) NOT NULL,
	[MedicoID] [int] NOT NULL,
	[DescripcionTratamiento] [varchar](3000) NOT NULL,
	[Medicamentos] [varchar](3000) NOT NULL,
	[DescripcionEvolucionTratamiento] [varchar](1000) NOT NULL,
	[FechaProximaConsulta] [smalldatetime] NULL,
	[EstatusCitaID] [int] NOT NULL,
 CONSTRAINT [PK_PacienteConsulta] PRIMARY KEY CLUSTERED 
(
	[PacienteConsultaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parroquia]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[SeguridadGrupo]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[SeguridadObjeto]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[SeguridadObjetoAcceso]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[SeguridadUsuarioDatos]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
	[ConsultorioID] [int] NOT NULL,
 CONSTRAINT [PK_SeguridadUsuarioDatos] PRIMARY KEY CLUSTERED 
(
	[SeguridadUsuarioDatosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoHoraSemana]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  Table [dbo].[TipoSangre]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoSangre](
	[TipoSangreID] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoSangre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoSagre] PRIMARY KEY CLUSTERED 
(
	[TipoSangreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[DetalleCalendarioConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
                         dbo.Consultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio, dbo.Consultorio.DireccionConsultorio, dbo.Consultorio.TelefonoConsultorio, dbo.Consultorio.EmailConsultorio, 
                         'Dia ' + dbo.DiaSemana.DiaSemana + ' Hora ' + CONVERT(varchar(200), dbo.HoraSemana.HoraSemana) + ':' + CONVERT(varchar(200), dbo.MinutosSemana.MinutosSemana) 
                         + ' ' + dbo.TipoHoraSemana.NombreTipoHoraSemana + ' Dirección ' + dbo.Ciudad.NombreCiudad + ' ' + dbo.Consultorio.DireccionConsultorio AS Detalle
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
/****** Object:  View [dbo].[DetalleMedicos]    Script Date: 2/6/2017 3:56:54 p.m. ******/
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
/****** Object:  View [dbo].[DetalleUsuarioConsultorio]    Script Date: 2/6/2017 3:56:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetalleUsuarioConsultorio]
AS
SELECT        dbo.Consultorio.ConsultorioID, dbo.Consultorio.NombreConsultorio + '  [Dr. ' + dbo.Medico.NombreMedico + ']' AS Consultorio_Medico, dbo.MedicoConsultorio.MedicoConsultorioID, 
                         dbo.MedicoConsultorio.NumeroMaximoCitas, dbo.Medico.NombreMedico, dbo.Medico.CedulaMedico, dbo.Medico.SexoMedico, dbo.Medico.MedicoID, dbo.Consultorio.NombreConsultorio
FROM            dbo.Consultorio INNER JOIN
                         dbo.MedicoConsultorio INNER JOIN
                         dbo.Medico ON dbo.MedicoConsultorio.MedicoID = dbo.Medico.MedicoID ON dbo.Consultorio.ConsultorioID = dbo.MedicoConsultorio.ConsultorioID

GO
SET IDENTITY_INSERT [dbo].[Aseguradora] ON 

GO
INSERT [dbo].[Aseguradora] ([AseguradoraID], [NombreAseguradora], [TelefonoAseguradora], [ContactoAseguradora]) VALUES (1, N'SEGUROS HORIZONTE', N'N/D', N'N/D')
GO
INSERT [dbo].[Aseguradora] ([AseguradoraID], [NombreAseguradora], [TelefonoAseguradora], [ContactoAseguradora]) VALUES (2, N'SEGUROS LA PREVISORA', N'N/D', N'N/D')
GO
INSERT [dbo].[Aseguradora] ([AseguradoraID], [NombreAseguradora], [TelefonoAseguradora], [ContactoAseguradora]) VALUES (3, N'MULTINACIONAL DE SEGUROS', N'N/D', N'N/D')
GO
SET IDENTITY_INSERT [dbo].[Aseguradora] OFF
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 

GO
INSERT [dbo].[Cita] ([CitaID], [MedicoConsultorioID], [FechaCita], [CitaMotivoID], [DescripcionPadecimiento], [CedulaPacienteCita], [NombrePacienteCita], [CelularPacienteCita], [EMailPacienteCita], [EstatusCitaID], [FechaCreacionCita]) VALUES (3051, 3, CAST(0xA7860000 AS SmallDateTime), 1, N'fgfgtretert reterte', CAST(111111 AS Numeric(18, 0)), N'PABLO MILANESA', N'3424', N'', 3, CAST(0xA786038E AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[Cita] OFF
GO
SET IDENTITY_INSERT [dbo].[CitaMotivo] ON 

GO
INSERT [dbo].[CitaMotivo] ([CitaMotivoID], [NombreCitaMotivo]) VALUES (1, N'CONSULTA (NUEVO PADECIMIENTO)')
GO
INSERT [dbo].[CitaMotivo] ([CitaMotivoID], [NombreCitaMotivo]) VALUES (2, N'CHEQUEO (PADECIMIENTO EN TRATAMIENTO)')
GO
INSERT [dbo].[CitaMotivo] ([CitaMotivoID], [NombreCitaMotivo]) VALUES (3, N'PRIMERA VEZ (NUNCA ATENDIDO)')
GO
SET IDENTITY_INSERT [dbo].[CitaMotivo] OFF
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (1, 1, N'Maroa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (2, 1, N'Puerto Ayacucho', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (3, 1, N'San Fernando de Atabapo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (4, 2, N'Anaco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (5, 2, N'Aragua de Barcelona', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (6, 2, N'Barcelona', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (7, 2, N'Boca de Uchire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (8, 2, N'Cantaura', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (9, 2, N'Clarines', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (10, 2, N'El Chaparro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (11, 2, N'El Pao Anzoátegui', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (12, 2, N'El Tigre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (13, 2, N'El Tigrito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (14, 2, N'Guanape', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (15, 2, N'Guanta', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (16, 2, N'Lechería', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (17, 2, N'Onoto', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (18, 2, N'Pariaguán', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (19, 2, N'Píritu', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (20, 2, N'Puerto La Cruz', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (21, 2, N'Puerto Píritu', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (22, 2, N'Sabana de Uchire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (23, 2, N'San Mateo Anzoátegui', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (24, 2, N'San Pablo Anzoátegui', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (25, 2, N'San Tomé', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (26, 2, N'Santa Ana de Anzoátegui', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (27, 2, N'Santa Fe Anzoátegui', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (28, 2, N'Santa Rosa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (29, 2, N'Soledad', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (30, 2, N'Urica', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (31, 2, N'Valle de Guanape', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (43, 3, N'Achaguas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (44, 3, N'Biruaca', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (45, 3, N'Bruzual', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (46, 3, N'El Amparo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (47, 3, N'El Nula', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (48, 3, N'Elorza', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (49, 3, N'Guasdualito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (50, 3, N'Mantecal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (51, 3, N'Puerto Páez', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (52, 3, N'San Fernando de Apure', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (53, 3, N'San Juan de Payara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (54, 4, N'Barbacoas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (55, 4, N'Cagua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (56, 4, N'Camatagua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (58, 4, N'Choroní', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (59, 4, N'Colonia Tovar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (60, 4, N'El Consejo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (61, 4, N'La Victoria', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (62, 4, N'Las Tejerías', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (63, 4, N'Magdaleno', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (64, 4, N'Maracay', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (65, 4, N'Ocumare de La Costa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (66, 4, N'Palo Negro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (67, 4, N'San Casimiro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (68, 4, N'San Mateo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (69, 4, N'San Sebastián', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (70, 4, N'Santa Cruz de Aragua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (71, 4, N'Tocorón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (72, 4, N'Turmero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (73, 4, N'Villa de Cura', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (74, 4, N'Zuata', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (75, 5, N'Barinas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (76, 5, N'Barinitas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (77, 5, N'Barrancas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (78, 5, N'Calderas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (79, 5, N'Capitanejo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (80, 5, N'Ciudad Bolivia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (81, 5, N'El Cantón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (82, 5, N'Las Veguitas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (83, 5, N'Libertad de Barinas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (84, 5, N'Sabaneta', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (85, 5, N'Santa Bárbara de Barinas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (86, 5, N'Socopó', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (87, 6, N'Caicara del Orinoco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (88, 6, N'Canaima', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (89, 6, N'Ciudad Bolívar', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (90, 6, N'Ciudad Piar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (91, 6, N'El Callao', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (92, 6, N'El Dorado', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (93, 6, N'El Manteco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (94, 6, N'El Palmar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (95, 6, N'El Pao', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (96, 6, N'Guasipati', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (97, 6, N'Guri', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (98, 6, N'La Paragua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (99, 6, N'Matanzas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (100, 6, N'Puerto Ordaz', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (101, 6, N'San Félix', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (102, 6, N'Santa Elena de Uairén', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (103, 6, N'Tumeremo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (104, 6, N'Unare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (105, 6, N'Upata', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (106, 7, N'Bejuma', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (107, 7, N'Belén', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (108, 7, N'Campo de Carabobo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (109, 7, N'Canoabo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (110, 7, N'Central Tacarigua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (111, 7, N'Chirgua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (112, 7, N'Ciudad Alianza', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (113, 7, N'El Palito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (114, 7, N'Guacara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (115, 7, N'Guigue', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (116, 7, N'Las Trincheras', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (117, 7, N'Los Guayos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (118, 7, N'Mariara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (119, 7, N'Miranda', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (120, 7, N'Montalbán', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (121, 7, N'Morón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (122, 7, N'Naguanagua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (123, 7, N'Puerto Cabello', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (124, 7, N'San Joaquín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (125, 7, N'Tocuyito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (126, 7, N'Urama', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (127, 7, N'Valencia', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (128, 7, N'Vigirimita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (129, 8, N'Aguirre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (130, 8, N'Apartaderos Cojedes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (131, 8, N'Arismendi', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (132, 8, N'Camuriquito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (133, 8, N'El Baúl', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (134, 8, N'El Limón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (135, 8, N'El Pao Cojedes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (136, 8, N'El Socorro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (137, 8, N'La Aguadita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (138, 8, N'Las Vegas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (139, 8, N'Libertad de Cojedes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (140, 8, N'Mapuey', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (141, 8, N'Piñedo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (142, 8, N'Samancito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (143, 8, N'San Carlos', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (144, 8, N'Sucre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (145, 8, N'Tinaco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (146, 8, N'Tinaquillo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (147, 8, N'Vallecito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (148, 9, N'Tucupita', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (149, 24, N'Caracas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (150, 24, N'El Junquito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (151, 10, N'Adícora', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (152, 10, N'Boca de Aroa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (153, 10, N'Cabure', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (154, 10, N'Capadare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (155, 10, N'Capatárida', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (156, 10, N'Chichiriviche', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (157, 10, N'Churuguara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (158, 10, N'Coro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (159, 10, N'Cumarebo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (160, 10, N'Dabajuro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (161, 10, N'Judibana', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (162, 10, N'La Cruz de Taratara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (163, 10, N'La Vela de Coro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (164, 10, N'Los Taques', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (165, 10, N'Maparari', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (166, 10, N'Mene de Mauroa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (167, 10, N'Mirimire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (168, 10, N'Pedregal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (169, 10, N'Píritu Falcón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (170, 10, N'Pueblo Nuevo Falcón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (171, 10, N'Puerto Cumarebo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (172, 10, N'Punta Cardón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (173, 10, N'Punto Fijo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (174, 10, N'San Juan de Los Cayos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (175, 10, N'San Luis', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (176, 10, N'Santa Ana Falcón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (177, 10, N'Santa Cruz De Bucaral', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (178, 10, N'Tocopero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (179, 10, N'Tocuyo de La Costa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (180, 10, N'Tucacas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (181, 10, N'Yaracal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (182, 11, N'Altagracia de Orituco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (183, 11, N'Cabruta', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (184, 11, N'Calabozo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (185, 11, N'Camaguán', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (196, 11, N'Chaguaramas Guárico', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (197, 11, N'El Socorro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (198, 11, N'El Sombrero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (199, 11, N'Las Mercedes de Los Llanos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (200, 11, N'Lezama', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (201, 11, N'Onoto', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (202, 11, N'Ortíz', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (203, 11, N'San José de Guaribe', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (204, 11, N'San Juan de Los Morros', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (205, 11, N'San Rafael de Laya', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (206, 11, N'Santa María de Ipire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (207, 11, N'Tucupido', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (208, 11, N'Valle de La Pascua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (209, 11, N'Zaraza', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (210, 12, N'Aguada Grande', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (211, 12, N'Atarigua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (212, 12, N'Barquisimeto', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (213, 12, N'Bobare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (214, 12, N'Cabudare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (215, 12, N'Carora', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (216, 12, N'Cubiro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (217, 12, N'Cují', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (218, 12, N'Duaca', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (219, 12, N'El Manzano', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (220, 12, N'El Tocuyo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (221, 12, N'Guaríco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (222, 12, N'Humocaro Alto', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (223, 12, N'Humocaro Bajo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (224, 12, N'La Miel', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (225, 12, N'Moroturo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (226, 12, N'Quíbor', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (227, 12, N'Río Claro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (228, 12, N'Sanare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (229, 12, N'Santa Inés', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (230, 12, N'Sarare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (231, 12, N'Siquisique', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (232, 12, N'Tintorero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (233, 13, N'Apartaderos Mérida', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (234, 13, N'Arapuey', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (235, 13, N'Bailadores', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (236, 13, N'Caja Seca', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (237, 13, N'Canaguá', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (238, 13, N'Chachopo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (239, 13, N'Chiguara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (240, 13, N'Ejido', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (241, 13, N'El Vigía', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (242, 13, N'La Azulita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (243, 13, N'La Playa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (244, 13, N'Lagunillas Mérida', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (245, 13, N'Mérida', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (246, 13, N'Mesa de Bolívar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (247, 13, N'Mucuchíes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (248, 13, N'Mucujepe', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (249, 13, N'Mucuruba', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (250, 13, N'Nueva Bolivia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (251, 13, N'Palmarito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (252, 13, N'Pueblo Llano', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (253, 13, N'Santa Cruz de Mora', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (254, 13, N'Santa Elena de Arenales', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (255, 13, N'Santo Domingo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (256, 13, N'Tabáy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (257, 13, N'Timotes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (258, 13, N'Torondoy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (259, 13, N'Tovar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (260, 13, N'Tucani', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (261, 13, N'Zea', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (262, 14, N'Araguita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (263, 14, N'Carrizal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (264, 14, N'Caucagua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (265, 14, N'Chaguaramas Miranda', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (266, 14, N'Charallave', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (267, 14, N'Chirimena', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (268, 14, N'Chuspa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (269, 14, N'Cúa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (270, 14, N'Cupira', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (271, 14, N'Curiepe', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (272, 14, N'El Guapo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (273, 14, N'El Jarillo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (274, 14, N'Filas de Mariche', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (275, 14, N'Guarenas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (276, 14, N'Guatire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (277, 14, N'Higuerote', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (278, 14, N'Los Anaucos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (279, 14, N'Los Teques', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (280, 14, N'Ocumare del Tuy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (281, 14, N'Panaquire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (282, 14, N'Paracotos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (283, 14, N'Río Chico', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (284, 14, N'San Antonio de Los Altos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (285, 14, N'San Diego de Los Altos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (286, 14, N'San Fernando del Guapo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (287, 14, N'San Francisco de Yare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (288, 14, N'San José de Los Altos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (289, 14, N'San José de Río Chico', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (290, 14, N'San Pedro de Los Altos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (291, 14, N'Santa Lucía', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (292, 14, N'Santa Teresa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (293, 14, N'Tacarigua de La Laguna', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (294, 14, N'Tacarigua de Mamporal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (295, 14, N'Tácata', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (296, 14, N'Turumo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (297, 15, N'Aguasay', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (298, 15, N'Aragua de Maturín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (299, 15, N'Barrancas del Orinoco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (300, 15, N'Caicara de Maturín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (301, 15, N'Caripe', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (302, 15, N'Caripito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (303, 15, N'Chaguaramal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (305, 15, N'Chaguaramas Monagas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (307, 15, N'El Furrial', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (308, 15, N'El Tejero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (309, 15, N'Jusepín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (310, 15, N'La Toscana', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (311, 15, N'Maturín', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (312, 15, N'Miraflores', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (313, 15, N'Punta de Mata', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (314, 15, N'Quiriquire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (315, 15, N'San Antonio de Maturín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (316, 15, N'San Vicente Monagas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (317, 15, N'Santa Bárbara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (318, 15, N'Temblador', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (319, 15, N'Teresen', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (320, 15, N'Uracoa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (321, 16, N'Altagracia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (322, 16, N'Boca de Pozo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (323, 16, N'Boca de Río', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (324, 16, N'El Espinal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (325, 16, N'El Valle del Espíritu Santo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (326, 16, N'El Yaque', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (327, 16, N'Juangriego', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (328, 16, N'La Asunción', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (329, 16, N'La Guardia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (330, 16, N'Pampatar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (331, 16, N'Porlamar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (332, 16, N'Puerto Fermín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (333, 16, N'Punta de Piedras', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (334, 16, N'San Francisco de Macanao', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (335, 16, N'San Juan Bautista', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (336, 16, N'San Pedro de Coche', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (337, 16, N'Santa Ana de Nueva Esparta', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (338, 16, N'Villa Rosa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (339, 17, N'Acarigua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (340, 17, N'Agua Blanca', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (341, 17, N'Araure', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (342, 17, N'Biscucuy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (343, 17, N'Boconoito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (344, 17, N'Campo Elías', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (345, 17, N'Chabasquén', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (346, 17, N'Guanare', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (347, 17, N'Guanarito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (348, 17, N'La Aparición', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (349, 17, N'La Misión', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (350, 17, N'Mesa de Cavacas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (351, 17, N'Ospino', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (352, 17, N'Papelón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (353, 17, N'Payara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (354, 17, N'Pimpinela', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (355, 17, N'Píritu de Portuguesa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (356, 17, N'San Rafael de Onoto', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (357, 17, N'Santa Rosalía', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (358, 17, N'Turén', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (359, 18, N'Altos de Sucre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (360, 18, N'Araya', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (361, 18, N'Cariaco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (362, 18, N'Carúpano', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (363, 18, N'Casanay', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (364, 18, N'Cumaná', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (365, 18, N'Cumanacoa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (366, 18, N'El Morro Puerto Santo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (367, 18, N'El Pilar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (368, 18, N'El Poblado', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (369, 18, N'Guaca', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (370, 18, N'Guiria', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (371, 18, N'Irapa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (372, 18, N'Manicuare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (373, 18, N'Mariguitar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (374, 18, N'Río Caribe', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (375, 18, N'San Antonio del Golfo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (376, 18, N'San José de Aerocuar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (377, 18, N'San Vicente de Sucre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (378, 18, N'Santa Fe de Sucre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (379, 18, N'Tunapuy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (380, 18, N'Yaguaraparo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (381, 18, N'Yoco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (382, 19, N'Abejales', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (383, 19, N'Borota', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (384, 19, N'Bramon', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (385, 19, N'Capacho', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (386, 19, N'Colón', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (387, 19, N'Coloncito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (388, 19, N'Cordero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (389, 19, N'El Cobre', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (390, 19, N'El Pinal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (391, 19, N'Independencia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (392, 19, N'La Fría', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (393, 19, N'La Grita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (394, 19, N'La Pedrera', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (395, 19, N'La Tendida', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (396, 19, N'Las Delicias', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (397, 19, N'Las Hernández', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (398, 19, N'Lobatera', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (399, 19, N'Michelena', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (400, 19, N'Palmira', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (401, 19, N'Pregonero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (402, 19, N'Queniquea', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (403, 19, N'Rubio', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (404, 19, N'San Antonio del Tachira', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (405, 19, N'San Cristobal', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (406, 19, N'San José de Bolívar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (407, 19, N'San Josecito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (408, 19, N'San Pedro del Río', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (409, 19, N'Santa Ana Táchira', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (410, 19, N'Seboruco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (411, 19, N'Táriba', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (412, 19, N'Umuquena', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (413, 19, N'Ureña', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (414, 20, N'Batatal', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (415, 20, N'Betijoque', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (416, 20, N'Boconó', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (417, 20, N'Carache', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (418, 20, N'Chejende', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (419, 20, N'Cuicas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (420, 20, N'El Dividive', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (421, 20, N'El Jaguito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (422, 20, N'Escuque', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (423, 20, N'Isnotú', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (424, 20, N'Jajó', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (425, 20, N'La Ceiba', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (426, 20, N'La Concepción de Trujllo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (427, 20, N'La Mesa de Esnujaque', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (428, 20, N'La Puerta', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (429, 20, N'La Quebrada', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (430, 20, N'Mendoza Fría', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (431, 20, N'Meseta de Chimpire', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (432, 20, N'Monay', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (433, 20, N'Motatán', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (434, 20, N'Pampán', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (435, 20, N'Pampanito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (436, 20, N'Sabana de Mendoza', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (437, 20, N'San Lázaro', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (438, 20, N'Santa Ana de Trujillo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (439, 20, N'Tostós', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (440, 20, N'Trujillo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (441, 20, N'Valera', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (442, 21, N'Carayaca', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (443, 21, N'Litoral', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (444, 25, N'Archipiélago Los Roques', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (445, 22, N'Aroa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (446, 22, N'Boraure', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (447, 22, N'Campo Elías de Yaracuy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (448, 22, N'Chivacoa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (449, 22, N'Cocorote', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (450, 22, N'Farriar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (451, 22, N'Guama', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (452, 22, N'Marín', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (453, 22, N'Nirgua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (454, 22, N'Sabana de Parra', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (455, 22, N'Salom', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (456, 22, N'San Felipe', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (457, 22, N'San Pablo de Yaracuy', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (458, 22, N'Urachiche', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (459, 22, N'Yaritagua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (460, 22, N'Yumare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (461, 23, N'Bachaquero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (462, 23, N'Bobures', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (463, 23, N'Cabimas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (464, 23, N'Campo Concepción', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (465, 23, N'Campo Mara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (466, 23, N'Campo Rojo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (467, 23, N'Carrasquero', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (468, 23, N'Casigua', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (469, 23, N'Chiquinquirá', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (470, 23, N'Ciudad Ojeda', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (471, 23, N'El Batey', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (472, 23, N'El Carmelo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (473, 23, N'El Chivo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (474, 23, N'El Guayabo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (475, 23, N'El Mene', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (476, 23, N'El Venado', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (477, 23, N'Encontrados', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (478, 23, N'Gibraltar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (479, 23, N'Isla de Toas', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (480, 23, N'La Concepción del Zulia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (481, 23, N'La Paz', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (482, 23, N'La Sierrita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (483, 23, N'Lagunillas del Zulia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (484, 23, N'Las Piedras de Perijá', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (485, 23, N'Los Cortijos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (486, 23, N'Machiques', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (487, 23, N'Maracaibo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (488, 23, N'Mene Grande', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (489, 23, N'Palmarejo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (490, 23, N'Paraguaipoa', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (491, 23, N'Potrerito', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (492, 23, N'Pueblo Nuevo del Zulia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (493, 23, N'Puertos de Altagracia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (494, 23, N'Punta Gorda', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (495, 23, N'Sabaneta de Palma', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (496, 23, N'San Francisco', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (497, 23, N'San José de Perijá', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (498, 23, N'San Rafael del Moján', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (499, 23, N'San Timoteo', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (500, 23, N'Santa Bárbara Del Zulia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (501, 23, N'Santa Cruz de Mara', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (502, 23, N'Santa Cruz del Zulia', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (503, 23, N'Santa Rita', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (504, 23, N'Sinamaica', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (505, 23, N'Tamare', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (506, 23, N'Tía Juana', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (507, 23, N'Villa del Rosario', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (508, 21, N'La Guaira', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (509, 21, N'Catia La Mar', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (510, 21, N'Macuto', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (511, 21, N'Naiguatá', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (512, 25, N'Archipiélago Los Monjes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (513, 25, N'Isla La Tortuga y Cayos adyacentes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (514, 25, N'Isla La Sola', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (515, 25, N'Islas Los Testigos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (516, 25, N'Islas Los Frailes', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (517, 25, N'Isla La Orchila', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (518, 25, N'Archipiélago Las Aves', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (519, 25, N'Isla de Aves', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (520, 25, N'Isla La Blanquilla', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (521, 25, N'Isla de Patos', 0)
GO
INSERT [dbo].[Ciudad] ([CiudadID], [EstadoID], [NombreCiudad], [IndicaCapital]) VALUES (522, 25, N'Islas Los Hermanos', 0)
GO
SET IDENTITY_INSERT [dbo].[Consultorio] ON 

GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (1, N'CONSULTORIO 5', N'1', N'CALLE PAEZ EDIFICIO LA PAZ', 279, N'0212618.16.63', N'')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (2, N'LAS AMERICAS', N'2', N'CARRETERA PANAMERICANA KM 15 GALERIAS LAS AMERICAS NIVEL MEZZANINA', 285, N'2333', N'N/D')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (3, N'CONSULTORIO PH-9', N'3', N'Edif. Anexo Hospital Clínicas Caracas, Nivel Ph, Consultorio Ph-9, San Bernardino, Caracas.. ', 149, N'(0212)575.0513 (0212)319.7503 (0426)104.6573 (0424)751.5902', N'N/D')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (4, N'CC CABIMAS', N'4', N' Centro Clínico Cabimas. Sector Delicias Nuevas. Calle Carabobo. Edif. Centro Clínico Cabimas.', 463, N'0264 2413684 041462048', N'N/D')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (5, N'LOS COLORADOS', N'5', N'Calle 112, Nº. 103-a-120 (al Lado De Corpoelec), Los Colorados, Valencia', 127, N'04144288', N'N/D')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (6, N'N/D', N'6', N'N/D', 64, N'453532354', N'N/D')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (7, N'CENTRO MEDICO EL PASO', N'7', N'AVENIDA BICENTENARIA CALLE 23 EDIFICIO 45 PISO 5 LOS TEQUES MIRANDA', 279, N'0412-5444.5577', N'N/D')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (8, N'PRUEBA', N'8886767', N'ELKRJWERJ WEKRJ WELKR JWELRWLEKRJLWERJ WLEJREWRWUE HRWEHRIUEWHRIUEWHRWHERKJWEHJRWE', 150, N'rwerewr', N'ewrwerewr')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (9, N'LA CAMPIÑA', N'992827', N'FKS FKSJDHF FKJSDHJFHSJHFJSDHF JKD HKDSFIUERUIE WRWRHWHRH EHR KERHEWH RKJ WEHRKJWHE', 149, N'y7657654 4545646 54645646464', N'5435345345345')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (10, N'CONSULTORIO LAS FLORES', N'4243423', N'AVENIDA LAS FLORES ENTRE CALLE 44 Y AVENIDA 20', 6, N'343243242332', N'rtertre')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (11, N'CENTRO MEDICO CARICUAO', N'0099348', N'UD 5 DE CARICUAO ENTRE LOS BLOQUES 5 7 Y 999 PISO 12', 149, N'5434435', N'45345')
GO
INSERT [dbo].[Consultorio] ([ConsultorioID], [NombreConsultorio], [RIFConsultorio], [DireccionConsultorio], [CiudadID], [TelefonoConsultorio], [EmailConsultorio]) VALUES (12, N'SAN MARTIN Y ASOCIADOS', N'3324234', N'AVENIDA SAN MARTIN', 149, N'34324', N'435345')
GO
SET IDENTITY_INSERT [dbo].[Consultorio] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaSemana] ON 

GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (1, N'LUNES')
GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (2, N'MARTES')
GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (3, N'MIERCOLES')
GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (4, N'JUEVES')
GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (5, N'VIERNES')
GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (6, N'SABADO')
GO
INSERT [dbo].[DiaSemana] ([DiaSemanaID], [DiaSemana]) VALUES (7, N'DOMINGO')
GO
SET IDENTITY_INSERT [dbo].[DiaSemana] OFF
GO
SET IDENTITY_INSERT [dbo].[Enfermedad] ON 

GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (1, N'Abrasión corneal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (2, N'Accidentes de tráfico')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (3, N'Accidentes eléctricos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (4, N'Accidentes en el agua')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (5, N'Accidentes químicos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (6, N'Acné')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (7, N'Aftas bucales')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (8, N'Albinismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (9, N'Alcoholismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (10, N'Alergia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (11, N'Alergia al níquel')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (12, N'Alergia al sol')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (13, N'Alud')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (14, N'Alzhéimer')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (15, N'Amenorrea')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (16, N'Ampollas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (17, N'Anemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (18, N'Aneurisma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (19, N'Angina de pecho')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (20, N'Anisakiasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (21, N'Anorexia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (22, N'Ansiedad')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (23, N'Apendicitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (24, N'Apnea del sueño')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (25, N'Arritmia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (26, N'Arteriosclerosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (27, N'Artritis reumatoide')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (28, N'Artrosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (29, N'Ascitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (30, N'Asma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (31, N'Astigmatismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (32, N'Ataxia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (33, N'Atragantamiento')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (34, N'Atrofia vaginal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (35, N'Autismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (36, N'Balanitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (37, N'Bartolinitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (38, N'Bocio')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (39, N'Botulismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (40, N'Bronquiectasias')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (41, N'Bronquiolitis obliterante')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (42, N'Bronquitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (43, N'Brucelosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (44, N'Bruxismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (45, N'Bulimia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (46, N'Campylobacter')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (47, N'Cáncer')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (48, N'Cáncer de cabeza y cuello')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (49, N'Cáncer de colon')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (50, N'Cáncer de cuello de útero')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (51, N'Cáncer de esófago')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (52, N'Cáncer de estómago')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (53, N'Cáncer de hígado')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (54, N'Cáncer de laringe')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (55, N'Cáncer de mama')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (56, N'Cáncer de ovario')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (57, N'Cáncer de páncreas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (58, N'Cáncer de pene')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (59, N'Cáncer de piel')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (60, N'Cáncer de próstata')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (61, N'Cáncer de pulmón')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (62, N'Cáncer de riñón')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (63, N'Cáncer de testículo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (64, N'Cáncer de tiroides')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (65, N'Cáncer de vejiga')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (66, N'Cáncer oral')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (67, N'Cáncer óseo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (68, N'Candidiasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (69, N'Carbunco')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (70, N'Cataratas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (71, N'Catarro')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (72, N'Celiaquía')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (73, N'Chikungunya')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (74, N'Ciática')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (75, N'Cirrosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (76, N'Cistitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (77, N'Clamidia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (78, N'Cólera')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (79, N'Colesteatoma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (80, N'Cólico nefrítico')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (81, N'Colitis ulcerosa')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (82, N'Colon irritable')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (83, N'Congelamiento')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (84, N'Congestión nasal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (85, N'Conjuntivitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (86, N'Contusiones')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (87, N'Corte de digestión')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (88, N'Crisis de pánico')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (89, N'Cuerpos extraños')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (90, N'Daltonismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (91, N'Déficit de la hormona del crecimiento')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (92, N'Degeneración macular')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (93, N'Demencia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (94, N'Demencia con cuerpos de Lewy')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (95, N'Demencia vascular')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (96, N'Dengue')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (97, N'Depresión')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (98, N'Dermatitis atópica')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (99, N'Derrame ocular')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (100, N'Deterioro cognitivo leve')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (101, N'Diabetes')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (102, N'Diabetes gestacional')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (103, N'Diabetes insípida')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (104, N'Difteria')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (105, N'Disfunción eréctil')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (106, N'Dislexia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (107, N'Dismenorrea')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (108, N'Dispepsia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (109, N'Distonía')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (110, N'Distrofia muscular de Duchenne')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (111, N'Diverticulosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (112, N'Ébola')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (113, N'Edema pulmonar')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (114, N'Elefantiasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (115, N'Encefalitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (116, N'Endocarditis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (117, N'Endometriosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (118, N'Enfermedad de Addison')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (119, N'Enfermedad de Behçet')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (120, N'Enfermedad de Chagas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (121, N'Enfermedad de Crohn')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (122, N'Enfermedad de Huntington')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (123, N'Enfermedad de Kawasaki')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (124, N'Enfermedad de La Peyronie')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (125, N'Enfermedad de Lyme')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (126, N'Enfermedad de Paget')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (127, N'Enfermedad de Wilson')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (128, N'Enfermedad inflamatoria pélvica')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (129, N'Enfermedades de Transmisión Sexual')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (130, N'Enfermedades raras')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (131, N'Epilepsia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (132, N'EPOC')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (133, N'Escleritis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (134, N'Esclerodermia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (135, N'Esclerosis lateral amiotrófica')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (136, N'Esclerosis múltiple')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (137, N'Escoliosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (138, N'Esófago de Barrett')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (139, N'Espondilitis anquilosante')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (140, N'Esquizofrenia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (141, N'Esteatosis hepática')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (142, N'Estrabismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (143, N'Estreñimiento')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (144, N'Eyaculación precoz')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (145, N'Faringitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (146, N'Fascitis plantar')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (147, N'Fenilcetonuria')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (148, N'Fibrilación auricular')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (149, N'Fibromialgia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (150, N'Fibrosis quística')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (151, N'Fiebre amarilla')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (152, N'Fiebre de Lassa')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (153, N'Fiebre hemorrágica de Crimea-Congo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (154, N'Fístula anal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (155, N'Fractura de dedo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (156, N'Fractura nasal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (157, N'Galactorrea')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (158, N'Galactosemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (159, N'Gastritis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (160, N'Gastroenteritis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (161, N'Glaucoma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (162, N'Golpe de calor')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (163, N'Gonorrea')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (164, N'Gota')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (165, N'Gripe')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (166, N'Hemocromatosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (167, N'Hemofilia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (168, N'Hemorragia nasal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (169, N'Hemorroides')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (170, N'Hepatitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (171, N'Herida por arma de fuego')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (172, N'Heridas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (173, N'Hernia de hiato')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (174, N'Hernia discal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (175, N'Hernia inguinal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (176, N'Herpes')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (177, N'Herpes zóster')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (178, N'Hiperactividad (TDAH) ')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (179, N'Hipercolesterolemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (180, N'Hipermetropía')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (181, N'Hiperplasia benigna de próstata')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (182, N'Hipertensión arterial')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (183, N'Hipertiroidismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (184, N'Hipoacusia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (185, N'Hipocalcemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (186, N'Hipoglucemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (187, N'Hipogonadismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (188, N'Hipotensión arterial')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (189, N'Hipotermia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (190, N'Hipotiroidismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (191, N'Ictus')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (192, N'Impétigo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (193, N'Incendios')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (194, N'Incontinencia urinaria')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (195, N'Infarto de miocardio')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (196, N'Infecciones urinarias')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (197, N'Insomnio')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (198, N'Insomnio familiar fatal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (199, N'Insuficiencia cardiaca')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (200, N'Insuficiencia mitral')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (201, N'Insuficiencia renal crónica')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (202, N'Intoxicación etílica')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (203, N'Intoxicación por monóxido de carbono')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (204, N'Intoxicaciones')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (205, N'Juanetes')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (206, N'Ladillas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (207, N'Laringitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (208, N'Legionella')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (209, N'Leishmaniasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (210, N'Lepra')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (211, N'Leptospirosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (212, N'Lesiones maxilares')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (213, N'Leucemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (214, N'Lipodistrofia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (215, N'Lipotimia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (216, N'Listeriosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (217, N'Litiasis biliar')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (218, N'Lumbalgia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (219, N'Lupus')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (220, N'Luxaciones')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (221, N'Mal agudo de montaña')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (222, N'Malaria')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (223, N'Melanoma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (224, N'Melasma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (225, N'Melioidosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (226, N'Meningitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (227, N'Menopausia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (228, N'MERS')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (229, N'Mesotelioma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (230, N'Miastenia gravis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (231, N'Microcefalia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (232, N'Migraña')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (233, N'Miomatosis uterina')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (234, N'Miopía')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (235, N'Molusco contagioso')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (236, N'Mononucleosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (237, N'Mordeduras de animales')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (238, N'Narcolepsia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (239, N'Neumonía')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (240, N'Neumotórax')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (241, N'Neuralgia del trigémino')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (242, N'Neurofibromatosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (243, N'Nistagmo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (244, N'Obesidad')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (245, N'Obesidad infantil')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (246, N'Ojo seco')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (247, N'Oncocercosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (248, N'Onicomicosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (249, N'Orquitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (250, N'Osteomalacia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (251, N'Osteomielitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (252, N'Osteonecrosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (253, N'Osteoporosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (254, N'Otitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (255, N'Palpitaciones cardíacas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (256, N'Pancreatitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (257, N'Paperas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (258, N'Parálisis cerebral')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (259, N'Párkinson')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (260, N'Patologías benignas de mama')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (261, N'Pericarditis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (262, N'Peritonitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (263, N'Peste')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (264, N'Pian')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (265, N'Picaduras de insectos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (266, N'Pie de atleta')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (267, N'Pielonefritis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (268, N'Policitemia vera')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (269, N'Poliomielitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (270, N'Pólipos uterinos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (271, N'Prediabetes')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (272, N'Presbiacusia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (273, N'Presbicia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (274, N'Priapismo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (275, N'Prostatitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (276, N'Psoriasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (277, N'PTI (trombocitopenia inmune primaria)')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (278, N'Quemaduras')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (279, N'Rabia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (280, N'Raspaduras y laceraciones')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (281, N'Reacciones alérgicas a medicamentos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (282, N'Reanimación cardiopulmonar')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (283, N'Reflujo gastroesofágico')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (284, N'Rescate en montaña')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (285, N'Resistencia a la insulina')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (286, N'Retinosis pigmentaria')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (287, N'Rinitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (288, N'Rosácea')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (289, N'Rubéola')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (290, N'Salmonelosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (291, N'Sarampión')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (292, N'Sarcoidosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (293, N'Sarna')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (294, N'Sepsis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (295, N'Shigelosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (296, N'Shock')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (297, N'SIDA')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (298, N'Sífilis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (299, N'Síndrome de Angelman')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (300, N'Síndrome de Cushing')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (301, N'Síndrome de Down')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (302, N'Síndrome de fatiga crónica')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (303, N'Síndrome de Guillain-Barré ')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (304, N'Síndrome de Klinefelter')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (305, N'Síndrome de Lynch ')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (306, N'Síndrome de Marfan')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (307, N'Síndrome de Noonan')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (308, N'Síndrome de Ovario Poliquístico (SOP)')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (309, N'Síndrome de Patau')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (310, N'Síndrome de piernas inquietas')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (311, N'Síndrome de Rett')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (312, N'Síndrome de Reye')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (313, N'Síndrome de Sjögren')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (314, N'Síndrome de Tourette')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (315, N'Síndrome de Turner')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (316, N'Síndrome de Williams')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (317, N'Síndrome de X Frágil')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (318, N'Síndrome del túnel carpiano')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (319, N'Síndrome metabólico')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (320, N'Sinusitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (321, N'Siringomielia ')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (322, N'Sobredosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (323, N'Talasemia')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (324, N'Telangiectasias')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (325, N'Tendinitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (326, N'Teniasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (327, N'Terremotos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (328, N'Tétanos')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (329, N'Tinnitus')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (330, N'Tos ferina')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (331, N'Toxicodermias')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (332, N'Toxoplasmosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (333, N'Tracoma')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (334, N'Trastorno bipolar')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (335, N'Trastorno obsesivo compulsivo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (336, N'Traumatismo craneal')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (337, N'Tricomoniasis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (338, N'Tromboembolismo pulmonar')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (339, N'Trombosis venosa')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (340, N'Tuberculosis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (341, N'Tumores cerebrales')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (342, N'Úlcera')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (343, N'Uretritis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (344, N'Urticaria')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (345, N'Uveítis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (346, N'Vaginitis')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (347, N'Varicela')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (348, N'Varices')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (349, N'Varicocele')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (350, N'Vértigo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (351, N'Virus del Nilo Occidental')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (352, N'Virus Mayaro')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (353, N'Virus Zika')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (354, N'Vitíligo')
GO
INSERT [dbo].[Enfermedad] ([EnfermedadID], [NombreEnfermedad]) VALUES (355, N'VPH')
GO
SET IDENTITY_INSERT [dbo].[Enfermedad] OFF
GO
SET IDENTITY_INSERT [dbo].[EspecialidadMedica] ON 

GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (1, N'Alergólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (2, N'Cardiólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (3, N'Cirujano bariátrico')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (4, N'Cirujano cardiovascular')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (5, N'Cirujano de tórax ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (6, N'Cirujano general')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (7, N'Cirujano maxilofacial ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (8, N'Cirujano oncólogo ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (9, N'Cirujano ortopédico')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (10, N'Cirujano plástico ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (11, N'Cirujano Traumatólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (12, N'Cirujanos pediatra ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (13, N'Dermatólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (14, N'Endocrinólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (15, N'Endocrinólogo pediatra ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (16, N'Foniatra')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (17, N'Gastroenterólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (18, N'Gastroenterólogo pediátrico')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (19, N'Geriatra ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (20, N'Ginecólogo infantojuvenil')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (21, N'Ginecólogo y Obstetra')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (22, N'Hematólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (23, N'Infectólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (24, N'Infectólogo pediatra ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (25, N'Inmunólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (26, N'Médico familiar')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (27, N'Médico general')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (28, N'Médico internista')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (29, N'Nefrólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (30, N'Nefrólogo pediátrico ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (31, N'Neonatólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (32, N'Neumonólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (33, N'Neumonólogo pediátrico')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (34, N'Neurocirujano ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (35, N'Neurólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (36, N'Neuropediatra')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (37, N'Nutriólogo pediatra ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (38, N'Oftalmólogo ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (39, N'Oncólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (40, N'Oncólogo infantil')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (41, N'Ondontologo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (42, N'Otorrinolaringólogo ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (43, N'Pediatra')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (44, N'Psiquiatra')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (45, N'Reumatólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (46, N'Sexólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (47, N'Urólogo')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (48, N'Urolólogo pediátrico ')
GO
INSERT [dbo].[EspecialidadMedica] ([EspecialidadMedicaID], [NombreEspecialidadMedica]) VALUES (49, N'Médico Traumatólogo')
GO
SET IDENTITY_INSERT [dbo].[EspecialidadMedica] OFF
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (1, N'Amazonas', N'VE-X')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (2, N'Anzoátegui', N'VE-B')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (3, N'Apure', N'VE-C')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (4, N'Aragua', N'VE-D')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (5, N'Barinas', N'VE-E')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (6, N'Bolívar', N'VE-F')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (7, N'Carabobo', N'VE-G')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (8, N'Cojedes', N'VE-H')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (9, N'Delta Amacuro', N'VE-Y')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (10, N'Falcón', N'VE-I')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (11, N'Guárico', N'VE-J')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (12, N'Lara', N'VE-K')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (13, N'Mérida', N'VE-L')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (14, N'Miranda', N'VE-M')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (15, N'Monagas', N'VE-N')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (16, N'Nueva Esparta', N'VE-O')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (17, N'Portuguesa', N'VE-P')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (18, N'Sucre', N'VE-R')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (19, N'Táchira', N'VE-S')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (20, N'Trujillo', N'VE-T')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (21, N'Vargas', N'VE-W')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (22, N'Yaracuy', N'VE-U')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (23, N'Zulia', N'VE-V')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (24, N'Distrito Capital', N'VE-A')
GO
INSERT [dbo].[Estado] ([EstadoID], [NombreEstado], [Nombre_Iso_3166-2]) VALUES (25, N'Dependencias Federales', N'VE-Z')
GO
SET IDENTITY_INSERT [dbo].[EstatusCita] ON 

GO
INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (1, N'NO CONFIRMADA')
GO
INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (2, N'CONFIRMADA')
GO
INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (3, N'EN ATENCION')
GO
INSERT [dbo].[EstatusCita] ([EstatusCitaID], [NombreEstatusCita]) VALUES (4, N'ATENDIDA')
GO
SET IDENTITY_INSERT [dbo].[EstatusCita] OFF
GO
SET IDENTITY_INSERT [dbo].[FormaPago] ON 

GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (1, N'EFECTIVO')
GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (2, N'DEBITO')
GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (3, N'CREDITO')
GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (4, N'EFECTIVO / DEBITO')
GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (5, N'EFECTIVO / DEBITO / CREDITO')
GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (6, N'DEBITO / CREDITO')
GO
INSERT [dbo].[FormaPago] ([FormaPagoID], [NombreFormaPago]) VALUES (7, N'TRANSFERENCIA ELECTRONICA')
GO
SET IDENTITY_INSERT [dbo].[FormaPago] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoriaMedica] ON 

GO
INSERT [dbo].[HistoriaMedica] ([HistoriaMedicaID], [PacienteID], [Alergias], [DescripcionAlergias], [Fumador]) VALUES (1, 1, 0, N'N/D', 0)
GO
SET IDENTITY_INSERT [dbo].[HistoriaMedica] OFF
GO
SET IDENTITY_INSERT [dbo].[HoraSemana] ON 

GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (1, 1)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (2, 2)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (3, 3)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (4, 4)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (5, 5)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (6, 6)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (7, 7)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (8, 8)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (9, 9)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (10, 10)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (11, 11)
GO
INSERT [dbo].[HoraSemana] ([HoraSemanaID], [HoraSemana]) VALUES (12, 12)
GO
SET IDENTITY_INSERT [dbo].[HoraSemana] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 

GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (1, N'F', 5978663, N'Ingrid Yepez', N'V05978663-2', N'49976', N'13985', 14, N'ESPECIALISTA EN TRATAMIENTO DE DIABETES', N'04261112211', N'YEPEZ')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (3, N'M', 1, N'Jhenson Sifuentes', N'01', N'0', N'0', 49, N'Médico especialista en traumatología, Cirugía de la columna vertebral, especialista en manejo y tratamiento de la escoliosis', N'0', N'0')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (4, N'M', 2, N'Carlos Arévalo', N'02', N'0', N'0', 11, N'cirugía ortopédica y traumatológica.ortopedia y Traumatología. ortopedia infantil. reemplazos articulares. artroscopia de rodilla. tratamiento de fracturas, enferemdades degenerativas y corrección de deformidades', N'0', N'0')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (6, N'M', 3, N'Manuel Pérez', N'03', N'0', N'0', 49, N'Médico traumatólogo ortopedista, patologías de columna , prótesis de cadera y rodilla, fracturas en general - consulta traumatológica , patologías de columna , prótesis , fracturas en general', N'0', N'0')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (8, N'F', 4, N'Doris Turmero', N'04', N'0', N'0', 21, N'Ecografista Integral. obstetricia.ginecología. planificación Familiar. control Pre Y Post Natal. despistaje De Cáncer. citología.', N'0', N'@doristurmero')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (9, N'F', 5, N'Maria Chacón', N'04', N'0', N'0', 14, N'CONTROL DE OBESIDAD Y TIROIDES', N'0', N'0')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (10, N'F', 123, N'PETRONILO', N'RIF2323', N'MSAS3332', N'COL44566', 44, N'ORLANDO PEREIRA', N'TELF4545 4', N'emadddifdf')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (12, N'M', 10530364, N'CARLOS CEBALLOS', N'10530364', N'MAS323', N'12232', 38, N'ESPECIALISTA EN LO MAXIMO', N'3423433432', N'3432423')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (13, N'M', 13385671, N'VICTOR PINO', N'139928', N'9349324', N'39482948', 43, N'EWRO WEREWIRO WEUR  EWRUWIERUIWOERUIWERIOWERIWERIOWEURIEUR ERUEWR UWR WIR', N'345345345', N'665')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (14, N'F', 16031409, N'DAMELIS BETAN', N'233', N'4345', N'EWRW', 35, N'ERWERW ERWE EWRWER WEREWR', N'34234', N'324234')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (15, N'M', 10791, N'VANIA DONOSO', N'192929', N'93339', N'3738472', 46, N'ASHD SADSAHDKJAHDSAHD SADKHSADKHSAJDHSKJD AJSDHKASJHDKSAHD SAKDHSJ DKASJDHKSAJDH SAKDHASDIUYUE WQEUI WUEUIWEYUWQYEQWUI', N'454354543', N'gfgdf')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (16, N'F', 444, N'RAFITO CEDEÑO', N'334234', N'T4534534', N'FD35345', 12, N'RTERTERT', N'43534', N'435435')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (17, N'F', 9999, N'PARIS HILTON', N'453453', N'453453', N'435435', 16, N'435435DGFGD', N'45435453', N'435435')
GO
INSERT [dbo].[Medico] ([MedicoID], [SexoMedico], [CedulaMedico], [NombreMedico], [RIFMedico], [MSAS], [ColegioMedico], [EspecialidadMedicaID], [DescripcionEspecialidad], [CelularMedico], [EmailMedico]) VALUES (18, N'F', 9999, N'PARIS HILTON', N'453453', N'453453', N'435435', 16, N'435435DGFGD', N'45435453', N'435435')
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicoCalendarioSemana] ON 

GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (1, 1, 2, 2, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2, 2, 4, 2, 1, 2, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (3, 1, 2, 9, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (4, 1, 2, 11, 1, 1, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (5, 1, 2, 6, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (6, 3, 1, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (7, 3, 1, 5, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (8, 3, 2, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (9, 3, 2, 5, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (10, 3, 3, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (11, 3, 3, 5, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (12, 3, 4, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (13, 3, 4, 5, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (17, 2, 4, 5, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (19, 4, 3, 7, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (20, 4, 3, 6, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (21, 5, 1, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (22, 5, 1, 3, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (23, 5, 2, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (24, 5, 2, 3, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (25, 5, 3, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (26, 5, 3, 3, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (27, 5, 4, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (28, 5, 4, 3, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (29, 5, 5, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (30, 5, 5, 3, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (31, 6, 1, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (32, 6, 1, 2, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (33, 6, 3, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (34, 6, 3, 4, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (35, 6, 5, 1, 1, 2, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (36, 6, 5, 5, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (37, 7, 1, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (38, 7, 1, 5, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (39, 8, 1, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (43, 18, 3, 8, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (44, 18, 3, 5, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (45, 10, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (46, 18, 4, 10, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (47, 18, 4, 4, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (48, 19, 1, 11, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (49, 19, 1, 4, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (50, 19, 2, 11, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (51, 19, 2, 4, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (52, 21, 5, 6, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (53, 21, 5, 12, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (55, 3, 5, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (56, 3, 5, 11, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (57, 21, 6, 10, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (58, 21, 6, 5, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (1057, 21, 7, 6, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2057, 21, 7, 11, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2058, 22, 1, 8, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2059, 22, 1, 8, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2060, 23, 1, 4, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2061, 23, 1, 10, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2062, 23, 2, 7, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2063, 23, 2, 7, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2064, 22, 3, 5, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2065, 22, 3, 10, 2, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2066, 24, 3, 7, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2067, 24, 3, 7, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2068, 23, 3, 5, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2069, 23, 3, 11, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2070, 22, 4, 4, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2071, 22, 4, 10, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2072, 22, 5, 4, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2073, 22, 5, 8, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2074, 24, 4, 7, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2075, 24, 4, 7, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2076, 24, 5, 7, 1, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2077, 24, 5, 7, 1, 2, 0)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2078, 23, 4, 10, 2, 1, 1)
GO
INSERT [dbo].[MedicoCalendarioSemana] ([MedicoCalendarioSemanaID], [MedicoConsultorioID], [DiaSemanaID], [HoraSemanaID], [MinutosSemanaID], [TipoHoraSemanaID], [IndicaHoraInicial]) VALUES (2079, 23, 4, 10, 2, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[MedicoCalendarioSemana] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicoConsultorio] ON 

GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (1, 1, 1, 10, 1, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (2, 2, 1, 10, 4, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (3, 3, 3, 10, 4, 21)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (4, 4, 4, 10, 5, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (5, 5, 6, 10, 4, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (6, 6, 8, 10, 1, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (7, 7, 9, 10, 1, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (8, 1, 9, 10, 1, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (10, 4, 6, 12, 7, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (18, 10, 12, 2, 5, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (19, 11, 13, 7, 5, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (20, 10, 13, 7, 5, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (21, 12, 14, 9, 4, 0)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (22, 3, 10, 12, 1, 21)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (23, 3, 15, 5, 1, 21)
GO
INSERT [dbo].[MedicoConsultorio] ([MedicoConsultorioID], [ConsultorioID], [MedicoID], [NumeroMaximoCitas], [FormaPagoID], [SeguridadUsuarioDatosID]) VALUES (24, 3, 16, 4, 1, 21)
GO
SET IDENTITY_INSERT [dbo].[MedicoConsultorio] OFF
GO
SET IDENTITY_INSERT [dbo].[MinutosSemana] ON 

GO
INSERT [dbo].[MinutosSemana] ([MinutosSemanaID], [MinutosSemana]) VALUES (1, 0)
GO
INSERT [dbo].[MinutosSemana] ([MinutosSemanaID], [MinutosSemana]) VALUES (2, 30)
GO
SET IDENTITY_INSERT [dbo].[MinutosSemana] OFF
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (1, 1, N'Alto Orinoco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (2, 1, N'Atabapo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (3, 1, N'Atures')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (4, 1, N'Autana')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (5, 1, N'Manapiare')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (6, 1, N'Maroa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (7, 1, N'Río Negro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (8, 2, N'Anaco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (9, 2, N'Aragua')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (10, 2, N'Manuel Ezequiel Bruzual')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (11, 2, N'Diego Bautista Urbaneja')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (12, 2, N'Fernando Peñalver')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (13, 2, N'Francisco Del Carmen Carvajal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (14, 2, N'General Sir Arthur McGregor')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (15, 2, N'Guanta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (16, 2, N'Independencia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (17, 2, N'José Gregorio Monagas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (18, 2, N'Juan Antonio Sotillo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (19, 2, N'Juan Manuel Cajigal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (20, 2, N'Libertad')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (21, 2, N'Francisco de Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (22, 2, N'Pedro María Freites')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (23, 2, N'Píritu')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (24, 2, N'San José de Guanipa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (25, 2, N'San Juan de Capistrano')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (26, 2, N'Santa Ana')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (27, 2, N'Simón Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (28, 2, N'Simón Rodríguez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (29, 3, N'Achaguas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (30, 3, N'Biruaca')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (31, 3, N'Muñóz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (32, 3, N'Páez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (33, 3, N'Pedro Camejo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (34, 3, N'Rómulo Gallegos')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (35, 3, N'San Fernando')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (36, 4, N'Atanasio Girardot')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (37, 4, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (38, 4, N'Camatagua')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (39, 4, N'Francisco Linares Alcántara')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (40, 4, N'José Ángel Lamas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (41, 4, N'José Félix Ribas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (42, 4, N'José Rafael Revenga')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (43, 4, N'Libertador')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (44, 4, N'Mario Briceño Iragorry')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (45, 4, N'Ocumare de la Costa de Oro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (46, 4, N'San Casimiro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (47, 4, N'San Sebastián')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (48, 4, N'Santiago Mariño')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (49, 4, N'Santos Michelena')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (50, 4, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (51, 4, N'Tovar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (52, 4, N'Urdaneta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (53, 4, N'Zamora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (54, 5, N'Alberto Arvelo Torrealba')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (55, 5, N'Andrés Eloy Blanco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (56, 5, N'Antonio José de Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (57, 5, N'Arismendi')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (58, 5, N'Barinas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (59, 5, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (60, 5, N'Cruz Paredes')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (61, 5, N'Ezequiel Zamora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (62, 5, N'Obispos')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (63, 5, N'Pedraza')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (64, 5, N'Rojas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (65, 5, N'Sosa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (66, 6, N'Caroní')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (67, 6, N'Cedeño')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (68, 6, N'El Callao')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (69, 6, N'Gran Sabana')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (70, 6, N'Heres')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (71, 6, N'Piar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (72, 6, N'Angostura (Raúl Leoni)')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (73, 6, N'Roscio')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (74, 6, N'Sifontes')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (75, 6, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (76, 6, N'Padre Pedro Chien')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (77, 7, N'Bejuma')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (78, 7, N'Carlos Arvelo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (79, 7, N'Diego Ibarra')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (80, 7, N'Guacara')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (81, 7, N'Juan José Mora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (82, 7, N'Libertador')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (83, 7, N'Los Guayos')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (84, 7, N'Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (85, 7, N'Montalbán')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (86, 7, N'Naguanagua')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (87, 7, N'Puerto Cabello')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (88, 7, N'San Diego')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (89, 7, N'San Joaquín')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (90, 7, N'Valencia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (91, 8, N'Anzoátegui')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (92, 8, N'Tinaquillo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (93, 8, N'Girardot')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (94, 8, N'Lima Blanco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (95, 8, N'Pao de San Juan Bautista')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (96, 8, N'Ricaurte')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (97, 8, N'Rómulo Gallegos')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (98, 8, N'San Carlos')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (99, 8, N'Tinaco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (100, 9, N'Antonio Díaz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (101, 9, N'Casacoima')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (102, 9, N'Pedernales')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (103, 9, N'Tucupita')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (104, 10, N'Acosta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (105, 10, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (106, 10, N'Buchivacoa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (107, 10, N'Cacique Manaure')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (108, 10, N'Carirubana')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (109, 10, N'Colina')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (110, 10, N'Dabajuro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (111, 10, N'Democracia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (112, 10, N'Falcón')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (113, 10, N'Federación')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (114, 10, N'Jacura')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (115, 10, N'José Laurencio Silva')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (116, 10, N'Los Taques')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (117, 10, N'Mauroa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (118, 10, N'Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (119, 10, N'Monseñor Iturriza')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (120, 10, N'Palmasola')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (121, 10, N'Petit')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (122, 10, N'Píritu')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (123, 10, N'San Francisco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (124, 10, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (125, 10, N'Tocópero')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (126, 10, N'Unión')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (127, 10, N'Urumaco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (128, 10, N'Zamora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (129, 11, N'Camaguán')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (130, 11, N'Chaguaramas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (131, 11, N'El Socorro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (132, 11, N'José Félix Ribas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (133, 11, N'José Tadeo Monagas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (134, 11, N'Juan Germán Roscio')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (135, 11, N'Julián Mellado')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (136, 11, N'Las Mercedes')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (137, 11, N'Leonardo Infante')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (138, 11, N'Pedro Zaraza')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (139, 11, N'Ortíz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (140, 11, N'San Gerónimo de Guayabal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (141, 11, N'San José de Guaribe')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (142, 11, N'Santa María de Ipire')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (143, 11, N'Sebastián Francisco de Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (144, 12, N'Andrés Eloy Blanco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (145, 12, N'Crespo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (146, 12, N'Iribarren')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (147, 12, N'Jiménez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (148, 12, N'Morán')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (149, 12, N'Palavecino')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (150, 12, N'Simón Planas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (151, 12, N'Torres')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (152, 12, N'Urdaneta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (179, 13, N'Alberto Adriani')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (180, 13, N'Andrés Bello')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (181, 13, N'Antonio Pinto Salinas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (182, 13, N'Aricagua')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (183, 13, N'Arzobispo Chacón')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (184, 13, N'Campo Elías')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (185, 13, N'Caracciolo Parra Olmedo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (186, 13, N'Cardenal Quintero')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (187, 13, N'Guaraque')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (188, 13, N'Julio César Salas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (189, 13, N'Justo Briceño')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (190, 13, N'Libertador')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (191, 13, N'Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (192, 13, N'Obispo Ramos de Lora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (193, 13, N'Padre Noguera')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (194, 13, N'Pueblo Llano')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (195, 13, N'Rangel')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (196, 13, N'Rivas Dávila')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (197, 13, N'Santos Marquina')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (198, 13, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (199, 13, N'Tovar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (200, 13, N'Tulio Febres Cordero')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (201, 13, N'Zea')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (223, 14, N'Acevedo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (224, 14, N'Andrés Bello')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (225, 14, N'Baruta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (226, 14, N'Brión')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (227, 14, N'Buroz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (228, 14, N'Carrizal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (229, 14, N'Chacao')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (230, 14, N'Cristóbal Rojas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (231, 14, N'El Hatillo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (232, 14, N'Guaicaipuro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (233, 14, N'Independencia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (234, 14, N'Lander')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (235, 14, N'Los Salias')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (236, 14, N'Páez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (237, 14, N'Paz Castillo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (238, 14, N'Pedro Gual')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (239, 14, N'Plaza')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (240, 14, N'Simón Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (241, 14, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (242, 14, N'Urdaneta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (243, 14, N'Zamora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (258, 15, N'Acosta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (259, 15, N'Aguasay')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (260, 15, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (261, 15, N'Caripe')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (262, 15, N'Cedeño')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (263, 15, N'Ezequiel Zamora')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (264, 15, N'Libertador')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (265, 15, N'Maturín')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (266, 15, N'Piar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (267, 15, N'Punceres')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (268, 15, N'Santa Bárbara')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (269, 15, N'Sotillo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (270, 15, N'Uracoa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (271, 16, N'Antolín del Campo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (272, 16, N'Arismendi')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (273, 16, N'García')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (274, 16, N'Gómez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (275, 16, N'Maneiro')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (276, 16, N'Marcano')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (277, 16, N'Mariño')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (278, 16, N'Península de Macanao')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (279, 16, N'Tubores')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (280, 16, N'Villalba')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (281, 16, N'Díaz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (282, 17, N'Agua Blanca')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (283, 17, N'Araure')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (284, 17, N'Esteller')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (285, 17, N'Guanare')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (286, 17, N'Guanarito')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (287, 17, N'Monseñor José Vicente de Unda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (288, 17, N'Ospino')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (289, 17, N'Páez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (290, 17, N'Papelón')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (291, 17, N'San Genaro de Boconoíto')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (292, 17, N'San Rafael de Onoto')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (293, 17, N'Santa Rosalía')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (294, 17, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (295, 17, N'Turén')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (296, 18, N'Andrés Eloy Blanco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (297, 18, N'Andrés Mata')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (298, 18, N'Arismendi')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (299, 18, N'Benítez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (300, 18, N'Bermúdez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (301, 18, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (302, 18, N'Cajigal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (303, 18, N'Cruz Salmerón Acosta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (304, 18, N'Libertador')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (305, 18, N'Mariño')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (306, 18, N'Mejía')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (307, 18, N'Montes')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (308, 18, N'Ribero')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (309, 18, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (310, 18, N'Valdéz')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (341, 19, N'Andrés Bello')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (342, 19, N'Antonio Rómulo Costa')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (343, 19, N'Ayacucho')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (344, 19, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (345, 19, N'Cárdenas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (346, 19, N'Córdoba')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (347, 19, N'Fernández Feo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (348, 19, N'Francisco de Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (349, 19, N'García de Hevia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (350, 19, N'Guásimos')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (351, 19, N'Independencia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (352, 19, N'Jáuregui')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (353, 19, N'José María Vargas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (354, 19, N'Junín')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (355, 19, N'Libertad')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (356, 19, N'Libertador')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (357, 19, N'Lobatera')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (358, 19, N'Michelena')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (359, 19, N'Panamericano')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (360, 19, N'Pedro María Ureña')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (361, 19, N'Rafael Urdaneta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (362, 19, N'Samuel Darío Maldonado')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (363, 19, N'San Cristóbal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (364, 19, N'Seboruco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (365, 19, N'Simón Rodríguez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (366, 19, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (367, 19, N'Torbes')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (368, 19, N'Uribante')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (369, 19, N'San Judas Tadeo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (370, 20, N'Andrés Bello')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (371, 20, N'Boconó')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (372, 20, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (373, 20, N'Candelaria')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (374, 20, N'Carache')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (375, 20, N'Escuque')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (376, 20, N'José Felipe Márquez Cañizalez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (377, 20, N'Juan Vicente Campos Elías')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (378, 20, N'La Ceiba')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (379, 20, N'Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (380, 20, N'Monte Carmelo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (381, 20, N'Motatán')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (382, 20, N'Pampán')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (383, 20, N'Pampanito')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (384, 20, N'Rafael Rangel')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (385, 20, N'San Rafael de Carvajal')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (386, 20, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (387, 20, N'Trujillo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (388, 20, N'Urdaneta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (389, 20, N'Valera')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (390, 21, N'Vargas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (391, 22, N'Arístides Bastidas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (392, 22, N'Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (407, 22, N'Bruzual')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (408, 22, N'Cocorote')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (409, 22, N'Independencia')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (410, 22, N'José Antonio Páez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (411, 22, N'La Trinidad')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (412, 22, N'Manuel Monge')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (413, 22, N'Nirgua')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (414, 22, N'Peña')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (415, 22, N'San Felipe')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (416, 22, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (417, 22, N'Urachiche')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (418, 22, N'José Joaquín Veroes')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (441, 23, N'Almirante Padilla')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (442, 23, N'Baralt')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (443, 23, N'Cabimas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (444, 23, N'Catatumbo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (445, 23, N'Colón')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (446, 23, N'Francisco Javier Pulgar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (447, 23, N'Páez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (448, 23, N'Jesús Enrique Losada')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (449, 23, N'Jesús María Semprún')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (450, 23, N'La Cañada de Urdaneta')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (451, 23, N'Lagunillas')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (452, 23, N'Machiques de Perijá')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (453, 23, N'Mara')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (454, 23, N'Maracaibo')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (455, 23, N'Miranda')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (456, 23, N'Rosario de Perijá')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (457, 23, N'San Francisco')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (458, 23, N'Santa Rita')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (459, 23, N'Simón Bolívar')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (460, 23, N'Sucre')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (461, 23, N'Valmore Rodríguez')
GO
INSERT [dbo].[Municipio] ([MunicipioID], [EstadoID], [NombreMunicipio]) VALUES (462, 24, N'Libertador')
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

GO
INSERT [dbo].[Paciente] ([PacienteID], [SexoPaciente], [CedulaPaciente], [FechaNacimientoPaciente], [NombrePaciente], [CelularPaciente], [CiudadID], [DireccionPaciente], [AseguradoraID], [TipoSangreID], [Peso]) VALUES (2012, N'F', 111111, CAST(0x96730000 AS SmallDateTime), N'PABLO MILANESA', N'453453', 207, N'454353', 3, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[PacienteConsulta] ON 

GO
INSERT [dbo].[PacienteConsulta] ([PacienteConsultaID], [PacienteID], [FechaConsulta], [MotivoConsulta], [MedicoID], [DescripcionTratamiento], [Medicamentos], [DescripcionEvolucionTratamiento], [FechaProximaConsulta], [EstatusCitaID]) VALUES (1015, 2012, CAST(0xA7860000 AS SmallDateTime), N'fgfgtretert reterte', 3, N'N/D', N'N/D', N'N/D', NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[PacienteConsulta] OFF
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1, 1, N'Alto Orinoco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (2, 1, N'Huachamacare Acanaña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (3, 1, N'Marawaka Toky Shamanaña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (4, 1, N'Mavaka Mavaka')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (5, 1, N'Sierra Parima Parimabé')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (6, 2, N'Ucata Laja Lisa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (7, 2, N'Yapacana Macuruco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (8, 2, N'Caname Guarinuma')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (9, 3, N'Fernando Girón Tovar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (10, 3, N'Luis Alberto Gómez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (11, 3, N'Pahueña Limón de Parhueña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (12, 3, N'Platanillal Platanillal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (13, 4, N'Samariapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (14, 4, N'Sipapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (15, 4, N'Munduapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (16, 4, N'Guayapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (17, 5, N'Alto Ventuari')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (18, 5, N'Medio Ventuari')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (19, 5, N'Bajo Ventuari')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (20, 6, N'Victorino')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (21, 6, N'Comunidad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (22, 7, N'Casiquiare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (23, 7, N'Cocuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (24, 7, N'San Carlos de Río Negro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (25, 7, N'Solano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (26, 8, N'Anaco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (27, 8, N'San Joaquín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (28, 9, N'Cachipo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (29, 9, N'Aragua de Barcelona')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (30, 11, N'Lechería')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (31, 11, N'El Morro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (32, 12, N'Puerto Píritu')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (33, 12, N'San Miguel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (34, 12, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (35, 13, N'Valle de Guanape')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (36, 13, N'Santa Bárbara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (37, 14, N'El Chaparro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (38, 14, N'Tomás Alfaro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (39, 14, N'Calatrava')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (40, 15, N'Guanta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (41, 15, N'Chorrerón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (42, 16, N'Mamo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (43, 16, N'Soledad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (44, 17, N'Mapire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (45, 17, N'Piar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (46, 17, N'Santa Clara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (47, 17, N'San Diego de Cabrutica')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (48, 17, N'Uverito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (49, 17, N'Zuata')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (50, 18, N'Puerto La Cruz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (51, 18, N'Pozuelos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (52, 19, N'Onoto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (53, 19, N'San Pablo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (54, 20, N'San Mateo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (55, 20, N'El Carito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (56, 20, N'Santa Inés')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (57, 20, N'La Romereña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (58, 21, N'Atapirire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (59, 21, N'Boca del Pao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (60, 21, N'El Pao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (61, 21, N'Pariaguán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (62, 22, N'Cantaura')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (63, 22, N'Libertador')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (64, 22, N'Santa Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (65, 22, N'Urica')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (66, 23, N'Píritu')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (67, 23, N'San Francisco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (68, 24, N'San José de Guanipa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (69, 25, N'Boca de Uchire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (70, 25, N'Boca de Chávez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (71, 26, N'Pueblo Nuevo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (72, 26, N'Santa Ana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (73, 27, N'Bergantín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (74, 27, N'Caigua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (75, 27, N'El Carmen')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (76, 27, N'El Pilar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (77, 27, N'Naricual')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (78, 27, N'San Crsitóbal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (79, 28, N'Edmundo Barrios')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (80, 28, N'Miguel Otero Silva')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (81, 29, N'Achaguas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (82, 29, N'Apurito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (83, 29, N'El Yagual')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (84, 29, N'Guachara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (85, 29, N'Mucuritas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (86, 29, N'Queseras del medio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (87, 30, N'Biruaca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (88, 31, N'Bruzual')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (89, 31, N'Mantecal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (90, 31, N'Quintero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (91, 31, N'Rincón Hondo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (92, 31, N'San Vicente')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (93, 32, N'Guasdualito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (94, 32, N'Aramendi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (95, 32, N'El Amparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (96, 32, N'San Camilo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (97, 32, N'Urdaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (98, 33, N'San Juan de Payara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (99, 33, N'Codazzi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (100, 33, N'Cunaviche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (101, 34, N'Elorza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (102, 34, N'La Trinidad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (103, 35, N'San Fernando')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (104, 35, N'El Recreo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (105, 35, N'Peñalver')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (106, 35, N'San Rafael de Atamaica')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (107, 36, N'Pedro José Ovalles')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (108, 36, N'Joaquín Crespo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (109, 36, N'José Casanova Godoy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (110, 36, N'Madre María de San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (111, 36, N'Andrés Eloy Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (112, 36, N'Los Tacarigua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (113, 36, N'Las Delicias')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (114, 36, N'Choroní')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (115, 37, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (116, 38, N'Camatagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (117, 38, N'Carmen de Cura')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (118, 39, N'Santa Rita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (119, 39, N'Francisco de Miranda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (120, 39, N'Moseñor Feliciano González')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (121, 40, N'Santa Cruz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (122, 41, N'José Félix Ribas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (123, 41, N'Castor Nieves Ríos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (124, 41, N'Las Guacamayas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (125, 41, N'Pao de Zárate')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (126, 41, N'Zuata')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (127, 42, N'José Rafael Revenga')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (128, 43, N'Palo Negro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (129, 43, N'San Martín de Porres')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (130, 44, N'El Limón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (131, 44, N'Caña de Azúcar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (132, 45, N'Ocumare de la Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (133, 46, N'San Casimiro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (134, 46, N'Güiripa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (135, 46, N'Ollas de Caramacate')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (136, 46, N'Valle Morín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (137, 47, N'San Sebastían')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (138, 48, N'Turmero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (139, 48, N'Arevalo Aponte')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (140, 48, N'Chuao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (141, 48, N'Samán de Güere')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (142, 48, N'Alfredo Pacheco Miranda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (143, 49, N'Santos Michelena')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (144, 49, N'Tiara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (145, 50, N'Cagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (146, 50, N'Bella Vista')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (147, 51, N'Tovar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (148, 52, N'Urdaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (149, 52, N'Las Peñitas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (150, 52, N'San Francisco de Cara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (151, 52, N'Taguay')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (152, 53, N'Zamora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (153, 53, N'Magdaleno')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (154, 53, N'San Francisco de Asís')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (155, 53, N'Valles de Tucutunemo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (156, 53, N'Augusto Mijares')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (157, 54, N'Sabaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (158, 54, N'Juan Antonio Rodríguez Domínguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (159, 55, N'El Cantón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (160, 55, N'Santa Cruz de Guacas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (161, 55, N'Puerto Vivas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (162, 56, N'Ticoporo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (163, 56, N'Nicolás Pulido')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (164, 56, N'Andrés Bello')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (165, 57, N'Arismendi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (166, 57, N'Guadarrama')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (167, 57, N'La Unión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (168, 57, N'San Antonio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (169, 58, N'Barinas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (170, 58, N'Alberto Arvelo Larriva')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (171, 58, N'San Silvestre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (172, 58, N'Santa Inés')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (173, 58, N'Santa Lucía')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (174, 58, N'Torumos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (175, 58, N'El Carmen')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (176, 58, N'Rómulo Betancourt')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (177, 58, N'Corazón de Jesús')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (178, 58, N'Ramón Ignacio Méndez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (179, 58, N'Alto Barinas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (180, 58, N'Manuel Palacio Fajardo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (181, 58, N'Juan Antonio Rodríguez Domínguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (182, 58, N'Dominga Ortiz de Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (183, 59, N'Barinitas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (184, 59, N'Altamira de Cáceres')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (185, 59, N'Calderas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (186, 60, N'Barrancas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (187, 60, N'El Socorro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (188, 60, N'Mazparrito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (189, 61, N'Santa Bárbara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (190, 61, N'Pedro Briceño Méndez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (191, 61, N'Ramón Ignacio Méndez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (192, 61, N'José Ignacio del Pumar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (193, 62, N'Obispos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (194, 62, N'Guasimitos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (195, 62, N'El Real')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (196, 62, N'La Luz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (197, 63, N'Ciudad Bolívia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (198, 63, N'José Ignacio Briceño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (199, 63, N'José Félix Ribas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (200, 63, N'Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (201, 64, N'Libertad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (202, 64, N'Dolores')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (203, 64, N'Santa Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (204, 64, N'Palacio Fajardo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (205, 65, N'Ciudad de Nutrias')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (206, 65, N'El Regalo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (207, 65, N'Puerto Nutrias')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (208, 65, N'Santa Catalina')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (209, 66, N'Cachamay')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (210, 66, N'Chirica')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (211, 66, N'Dalla Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (212, 66, N'Once de Abril')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (213, 66, N'Simón Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (214, 66, N'Unare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (215, 66, N'Universidad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (216, 66, N'Vista al Sol')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (217, 66, N'Pozo Verde')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (218, 66, N'Yocoima')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (219, 66, N'5 de Julio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (220, 67, N'Cedeño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (221, 67, N'Altagracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (222, 67, N'Ascensión Farreras')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (223, 67, N'Guaniamo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (224, 67, N'La Urbana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (225, 67, N'Pijiguaos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (226, 68, N'El Callao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (227, 69, N'Gran Sabana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (228, 69, N'Ikabarú')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (229, 70, N'Catedral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (230, 70, N'Zea')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (231, 70, N'Orinoco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (232, 70, N'José Antonio Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (233, 70, N'Marhuanta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (234, 70, N'Agua Salada')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (235, 70, N'Vista Hermosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (236, 70, N'La Sabanita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (237, 70, N'Panapana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (238, 71, N'Andrés Eloy Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (239, 71, N'Pedro Cova')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (240, 72, N'Raúl Leoni')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (241, 72, N'Barceloneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (242, 72, N'Santa Bárbara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (243, 72, N'San Francisco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (244, 73, N'Roscio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (245, 73, N'Salóm')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (246, 74, N'Sifontes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (247, 74, N'Dalla Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (248, 74, N'San Isidro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (249, 75, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (250, 75, N'Aripao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (251, 75, N'Guarataro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (252, 75, N'Las Majadas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (253, 75, N'Moitaco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (254, 76, N'Padre Pedro Chien')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (255, 76, N'Río Grande')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (256, 77, N'Bejuma')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (257, 77, N'Canoabo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (258, 77, N'Simón Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (259, 78, N'Güigüe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (260, 78, N'Carabobo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (261, 78, N'Tacarigua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (262, 79, N'Mariara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (263, 79, N'Aguas Calientes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (264, 80, N'Ciudad Alianza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (265, 80, N'Guacara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (266, 80, N'Yagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (267, 81, N'Morón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (268, 81, N'Yagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (269, 82, N'Tocuyito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (270, 82, N'Independencia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (271, 83, N'Los Guayos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (272, 84, N'Miranda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (273, 85, N'Montalbán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (274, 86, N'Naguanagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (275, 87, N'Bartolomé Salóm')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (276, 87, N'Democracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (277, 87, N'Fraternidad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (278, 87, N'Goaigoaza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (279, 87, N'Juan José Flores')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (280, 87, N'Unión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (281, 87, N'Borburata')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (282, 87, N'Patanemo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (283, 88, N'San Diego')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (284, 89, N'San Joaquín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (285, 90, N'Candelaria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (286, 90, N'Catedral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (287, 90, N'El Socorro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (288, 90, N'Miguel Peña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (289, 90, N'Rafael Urdaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (290, 90, N'San Blas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (291, 90, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (292, 90, N'Santa Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (293, 90, N'Negro Primero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (294, 91, N'Cojedes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (295, 91, N'Juan de Mata Suárez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (296, 92, N'Tinaquillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (297, 93, N'El Baúl')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (298, 93, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (299, 94, N'La Aguadita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (300, 94, N'Macapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (301, 95, N'El Pao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (302, 96, N'El Amparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (303, 96, N'Libertad de Cojedes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (304, 97, N'Rómulo Gallegos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (305, 98, N'San Carlos de Austria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (306, 98, N'Juan Ángel Bravo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (307, 98, N'Manuel Manrique')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (308, 99, N'General en Jefe José Laurencio Silva')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (309, 100, N'Curiapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (310, 100, N'Almirante Luis Brión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (311, 100, N'Francisco Aniceto Lugo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (312, 100, N'Manuel Renaud')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (313, 100, N'Padre Barral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (314, 100, N'Santos de Abelgas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (315, 101, N'Imataca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (316, 101, N'Cinco de Julio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (317, 101, N'Juan Bautista Arismendi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (318, 101, N'Manuel Piar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (319, 101, N'Rómulo Gallegos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (320, 102, N'Pedernales')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (321, 102, N'Luis Beltrán Prieto Figueroa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (322, 103, N'San José (Delta Amacuro)')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (323, 103, N'José Vidal Marcano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (324, 103, N'Juan Millán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (325, 103, N'Leonardo Ruíz Pineda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (326, 103, N'Mariscal Antonio José de Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (327, 103, N'Monseñor Argimiro García')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (328, 103, N'San Rafael (Delta Amacuro)')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (329, 103, N'Virgen del Valle')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (330, 10, N'Clarines')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (331, 10, N'Guanape')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (332, 10, N'Sabana de Uchire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (333, 104, N'Capadare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (334, 104, N'La Pastora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (335, 104, N'Libertador')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (336, 104, N'San Juan de los Cayos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (337, 105, N'Aracua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (338, 105, N'La Peña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (339, 105, N'San Luis')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (340, 106, N'Bariro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (341, 106, N'Borojó')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (342, 106, N'Capatárida')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (343, 106, N'Guajiro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (344, 106, N'Seque')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (345, 106, N'Zazárida')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (346, 106, N'Valle de Eroa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (347, 107, N'Cacique Manaure')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (348, 108, N'Norte')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (349, 108, N'Carirubana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (350, 108, N'Santa Ana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (351, 108, N'Urbana Punta Cardón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (352, 109, N'La Vela de Coro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (353, 109, N'Acurigua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (354, 109, N'Guaibacoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (355, 109, N'Las Calderas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (356, 109, N'Macoruca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (357, 110, N'Dabajuro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (358, 111, N'Agua Clara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (359, 111, N'Avaria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (360, 111, N'Pedregal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (361, 111, N'Piedra Grande')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (362, 111, N'Purureche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (363, 112, N'Adaure')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (364, 112, N'Adícora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (365, 112, N'Baraived')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (366, 112, N'Buena Vista')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (367, 112, N'Jadacaquiva')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (368, 112, N'El Vínculo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (369, 112, N'El Hato')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (370, 112, N'Moruy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (371, 112, N'Pueblo Nuevo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (372, 113, N'Agua Larga')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (373, 113, N'El Paují')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (374, 113, N'Independencia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (375, 113, N'Mapararí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (376, 114, N'Agua Linda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (377, 114, N'Araurima')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (378, 114, N'Jacura')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (379, 115, N'Tucacas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (380, 115, N'Boca de Aroa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (381, 116, N'Los Taques')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (382, 116, N'Judibana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (383, 117, N'Mene de Mauroa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (384, 117, N'San Félix')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (385, 117, N'Casigua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (386, 118, N'Guzmán Guillermo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (387, 118, N'Mitare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (388, 118, N'Río Seco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (389, 118, N'Sabaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (390, 118, N'San Antonio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (391, 118, N'San Gabriel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (392, 118, N'Santa Ana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (393, 119, N'Boca del Tocuyo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (394, 119, N'Chichiriviche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (395, 119, N'Tocuyo de la Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (396, 120, N'Palmasola')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (397, 121, N'Cabure')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (398, 121, N'Colina')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (399, 121, N'Curimagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (400, 122, N'San José de la Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (401, 122, N'Píritu')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (402, 123, N'San Francisco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (403, 124, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (404, 124, N'Pecaya')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (405, 125, N'Tocópero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (406, 126, N'El Charal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (407, 126, N'Las Vegas del Tuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (408, 126, N'Santa Cruz de Bucaral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (409, 127, N'Bruzual')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (410, 127, N'Urumaco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (411, 128, N'Puerto Cumarebo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (412, 128, N'La Ciénaga')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (413, 128, N'La Soledad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (414, 128, N'Pueblo Cumarebo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (415, 128, N'Zazárida')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (416, 113, N'Churuguara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (417, 129, N'Camaguán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (418, 129, N'Puerto Miranda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (419, 129, N'Uverito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (420, 130, N'Chaguaramas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (421, 131, N'El Socorro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (422, 132, N'Tucupido')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (423, 132, N'San Rafael de Laya')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (424, 133, N'Altagracia de Orituco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (425, 133, N'San Rafael de Orituco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (426, 133, N'San Francisco Javier de Lezama')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (427, 133, N'Paso Real de Macaira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (428, 133, N'Carlos Soublette')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (429, 133, N'San Francisco de Macaira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (430, 133, N'Libertad de Orituco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (431, 134, N'Cantaclaro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (432, 134, N'San Juan de los Morros')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (433, 134, N'Parapara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (434, 135, N'El Sombrero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (435, 135, N'Sosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (436, 136, N'Las Mercedes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (437, 136, N'Cabruta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (438, 136, N'Santa Rita de Manapire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (439, 137, N'Valle de la Pascua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (440, 137, N'Espino')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (441, 138, N'San José de Unare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (442, 138, N'Zaraza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (443, 139, N'San José de Tiznados')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (444, 139, N'San Francisco de Tiznados')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (445, 139, N'San Lorenzo de Tiznados')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (446, 139, N'Ortiz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (447, 140, N'Guayabal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (448, 140, N'Cazorla')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (449, 141, N'San José de Guaribe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (450, 141, N'Uveral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (451, 142, N'Santa María de Ipire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (452, 142, N'Altamira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (453, 143, N'El Calvario')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (454, 143, N'El Rastro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (455, 143, N'Guardatinajas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (456, 143, N'Capital Urbana Calabozo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (457, 144, N'Quebrada Honda de Guache')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (458, 144, N'Pío Tamayo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (459, 144, N'Yacambú')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (460, 145, N'Fréitez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (461, 145, N'José María Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (462, 146, N'Catedral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (463, 146, N'Concepción')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (464, 146, N'El Cují')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (465, 146, N'Juan de Villegas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (466, 146, N'Santa Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (467, 146, N'Tamaca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (468, 146, N'Unión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (469, 146, N'Aguedo Felipe Alvarado')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (470, 146, N'Buena Vista')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (471, 146, N'Juárez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (472, 147, N'Juan Bautista Rodríguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (473, 147, N'Cuara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (474, 147, N'Diego de Lozada')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (475, 147, N'Paraíso de San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (476, 147, N'San Miguel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (477, 147, N'Tintorero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (478, 147, N'José Bernardo Dorante')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (479, 147, N'Coronel Mariano Peraza ')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (480, 148, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (481, 148, N'Anzoátegui')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (482, 148, N'Guarico')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (483, 148, N'Hilario Luna y Luna')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (484, 148, N'Humocaro Alto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (485, 148, N'Humocaro Bajo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (486, 148, N'La Candelaria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (487, 148, N'Morán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (488, 149, N'Cabudare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (489, 149, N'José Gregorio Bastidas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (490, 149, N'Agua Viva')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (491, 150, N'Sarare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (492, 150, N'Buría')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (493, 150, N'Gustavo Vegas León')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (494, 151, N'Trinidad Samuel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (495, 151, N'Antonio Díaz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (496, 151, N'Camacaro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (497, 151, N'Castañeda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (498, 151, N'Cecilio Zubillaga')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (499, 151, N'Chiquinquirá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (500, 151, N'El Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (501, 151, N'Espinoza de los Monteros')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (502, 151, N'Lara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (503, 151, N'Las Mercedes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (504, 151, N'Manuel Morillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (505, 151, N'Montaña Verde')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (506, 151, N'Montes de Oca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (507, 151, N'Torres')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (508, 151, N'Heriberto Arroyo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (509, 151, N'Reyes Vargas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (510, 151, N'Altagracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (511, 152, N'Siquisique')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (512, 152, N'Moroturo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (513, 152, N'San Miguel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (514, 152, N'Xaguas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (515, 179, N'Presidente Betancourt')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (516, 179, N'Presidente Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (517, 179, N'Presidente Rómulo Gallegos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (518, 179, N'Gabriel Picón González')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (519, 179, N'Héctor Amable Mora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (520, 179, N'José Nucete Sardi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (521, 179, N'Pulido Méndez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (522, 180, N'La Azulita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (523, 181, N'Santa Cruz de Mora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (524, 181, N'Mesa Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (525, 181, N'Mesa de Las Palmas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (526, 182, N'Aricagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (527, 182, N'San Antonio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (528, 183, N'Canagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (529, 183, N'Capurí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (530, 183, N'Chacantá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (531, 183, N'El Molino')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (532, 183, N'Guaimaral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (533, 183, N'Mucutuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (534, 183, N'Mucuchachí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (535, 184, N'Fernández Peña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (536, 184, N'Matriz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (537, 184, N'Montalbán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (538, 184, N'Acequias')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (539, 184, N'Jají')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (540, 184, N'La Mesa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (541, 184, N'San José del Sur')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (542, 185, N'Tucaní')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (543, 185, N'Florencio Ramírez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (544, 186, N'Santo Domingo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (545, 186, N'Las Piedras')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (546, 187, N'Guaraque')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (547, 187, N'Mesa de Quintero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (548, 187, N'Río Negro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (549, 188, N'Arapuey')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (550, 188, N'Palmira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (551, 189, N'San Cristóbal de Torondoy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (552, 189, N'Torondoy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (553, 190, N'Antonio Spinetti Dini')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (554, 190, N'Arias')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (555, 190, N'Caracciolo Parra Pérez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (556, 190, N'Domingo Peña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (557, 190, N'El Llano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (558, 190, N'Gonzalo Picón Febres')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (559, 190, N'Jacinto Plaza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (560, 190, N'Juan Rodríguez Suárez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (561, 190, N'Lasso de la Vega')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (562, 190, N'Mariano Picón Salas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (563, 190, N'Milla')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (564, 190, N'Osuna Rodríguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (565, 190, N'Sagrario')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (566, 190, N'El Morro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (567, 190, N'Los Nevados')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (568, 191, N'Andrés Eloy Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (569, 191, N'La Venta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (570, 191, N'Piñango')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (571, 191, N'Timotes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (572, 192, N'Eloy Paredes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (573, 192, N'San Rafael de Alcázar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (574, 192, N'Santa Elena de Arenales')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (575, 193, N'Santa María de Caparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (576, 194, N'Pueblo Llano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (577, 195, N'Cacute')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (578, 195, N'La Toma')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (579, 195, N'Mucuchíes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (580, 195, N'Mucurubá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (581, 195, N'San Rafael')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (582, 196, N'Gerónimo Maldonado')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (583, 196, N'Bailadores')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (584, 197, N'Tabay')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (585, 198, N'Chiguará')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (586, 198, N'Estánquez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (587, 198, N'Lagunillas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (588, 198, N'La Trampa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (589, 198, N'Pueblo Nuevo del Sur')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (590, 198, N'San Juan')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (591, 199, N'El Amparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (592, 199, N'El Llano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (593, 199, N'San Francisco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (594, 199, N'Tovar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (595, 200, N'Independencia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (596, 200, N'María de la Concepción Palacios Blanco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (597, 200, N'Nueva Bolivia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (598, 200, N'Santa Apolonia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (599, 201, N'Caño El Tigre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (600, 201, N'Zea')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (601, 223, N'Aragüita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (602, 223, N'Arévalo González')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (603, 223, N'Capaya')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (604, 223, N'Caucagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (605, 223, N'Panaquire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (606, 223, N'Ribas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (607, 223, N'El Café')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (608, 223, N'Marizapa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (609, 224, N'Cumbo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (610, 224, N'San José de Barlovento')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (611, 225, N'El Cafetal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (612, 225, N'Las Minas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (613, 225, N'Nuestra Señora del Rosario')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (614, 226, N'Higuerote')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (615, 226, N'Curiepe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (616, 226, N'Tacarigua de Brión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (617, 227, N'Mamporal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (618, 228, N'Carrizal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (619, 229, N'Chacao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (620, 230, N'Charallave')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (621, 230, N'Las Brisas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (622, 231, N'El Hatillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (623, 232, N'Altagracia de la Montaña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (624, 232, N'Cecilio Acosta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (625, 232, N'Los Teques')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (626, 232, N'El Jarillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (627, 232, N'San Pedro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (628, 232, N'Tácata')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (629, 232, N'Paracotos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (630, 233, N'Cartanal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (631, 233, N'Santa Teresa del Tuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (632, 234, N'La Democracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (633, 234, N'Ocumare del Tuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (634, 234, N'Santa Bárbara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (635, 235, N'San Antonio de los Altos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (636, 236, N'Río Chico')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (637, 236, N'El Guapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (638, 236, N'Tacarigua de la Laguna')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (639, 236, N'Paparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (640, 236, N'San Fernando del Guapo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (641, 237, N'Santa Lucía del Tuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (642, 238, N'Cúpira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (643, 238, N'Machurucuto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (644, 239, N'Guarenas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (645, 240, N'San Antonio de Yare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (646, 240, N'San Francisco de Yare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (647, 241, N'Leoncio Martínez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (648, 241, N'Petare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (649, 241, N'Caucagüita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (650, 241, N'Filas de Mariche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (651, 241, N'La Dolorita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (652, 242, N'Cúa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (653, 242, N'Nueva Cúa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (654, 243, N'Guatire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (655, 243, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (656, 258, N'San Antonio de Maturín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (657, 258, N'San Francisco de Maturín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (658, 259, N'Aguasay')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (659, 260, N'Caripito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (660, 261, N'El Guácharo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (661, 261, N'La Guanota')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (662, 261, N'Sabana de Piedra')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (663, 261, N'San Agustín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (664, 261, N'Teresen')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (665, 261, N'Caripe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (666, 262, N'Areo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (667, 262, N'Capital Cedeño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (668, 262, N'San Félix de Cantalicio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (669, 262, N'Viento Fresco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (670, 263, N'El Tejero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (671, 263, N'Punta de Mata')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (672, 264, N'Chaguaramas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (673, 264, N'Las Alhuacas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (674, 264, N'Tabasca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (675, 264, N'Temblador')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (676, 265, N'Alto de los Godos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (677, 265, N'Boquerón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (678, 265, N'Las Cocuizas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (679, 265, N'La Cruz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (680, 265, N'San Simón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (681, 265, N'El Corozo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (682, 265, N'El Furrial')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (683, 265, N'Jusepín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (684, 265, N'La Pica')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (685, 265, N'San Vicente')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (686, 266, N'Aparicio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (687, 266, N'Aragua de Maturín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (688, 266, N'Chaguamal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (689, 266, N'El Pinto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (690, 266, N'Guanaguana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (691, 266, N'La Toscana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (692, 266, N'Taguaya')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (693, 267, N'Cachipo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (694, 267, N'Quiriquire')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (695, 268, N'Santa Bárbara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (696, 269, N'Barrancas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (697, 269, N'Los Barrancos de Fajardo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (698, 270, N'Uracoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (699, 271, N'Antolín del Campo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (700, 272, N'Arismendi')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (701, 273, N'García')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (702, 273, N'Francisco Fajardo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (703, 274, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (704, 274, N'Guevara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (705, 274, N'Matasiete')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (706, 274, N'Santa Ana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (707, 274, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (708, 275, N'Aguirre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (709, 275, N'Maneiro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (710, 276, N'Adrián')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (711, 276, N'Juan Griego')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (712, 276, N'Yaguaraparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (713, 277, N'Porlamar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (714, 278, N'San Francisco de Macanao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (715, 278, N'Boca de Río')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (716, 279, N'Tubores')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (717, 279, N'Los Baleales')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (718, 280, N'Vicente Fuentes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (719, 280, N'Villalba')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (720, 281, N'San Juan Bautista')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (721, 281, N'Zabala')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (722, 283, N'Capital Araure')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (723, 283, N'Río Acarigua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (724, 284, N'Capital Esteller')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (725, 284, N'Uveral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (726, 285, N'Guanare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (727, 285, N'Córdoba')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (728, 285, N'San José de la Montaña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (729, 285, N'San Juan de Guanaguanare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (730, 285, N'Virgen de la Coromoto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (731, 286, N'Guanarito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (732, 286, N'Trinidad de la Capilla')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (733, 286, N'Divina Pastora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (734, 287, N'Monseñor José Vicente de Unda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (735, 287, N'Peña Blanca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (736, 288, N'Capital Ospino')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (737, 288, N'Aparición')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (738, 288, N'La Estación')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (739, 289, N'Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (740, 289, N'Payara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (741, 289, N'Pimpinela')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (742, 289, N'Ramón Peraza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (743, 290, N'Papelón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (744, 290, N'Caño Delgadito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (745, 291, N'San Genaro de Boconoito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (746, 291, N'Antolín Tovar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (747, 292, N'San Rafael de Onoto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (748, 292, N'Santa Fe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (749, 292, N'Thermo Morles')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (750, 293, N'Santa Rosalía')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (751, 293, N'Florida')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (752, 294, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (753, 294, N'Concepción')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (754, 294, N'San Rafael de Palo Alzado')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (755, 294, N'Uvencio Antonio Velásquez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (756, 294, N'San José de Saguaz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (757, 294, N'Villa Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (758, 295, N'Turén')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (759, 295, N'Canelones')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (760, 295, N'Santa Cruz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (761, 295, N'San Isidro Labrador')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (762, 296, N'Mariño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (763, 296, N'Rómulo Gallegos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (764, 297, N'San José de Aerocuar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (765, 297, N'Tavera Acosta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (766, 298, N'Río Caribe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (767, 298, N'Antonio José de Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (768, 298, N'El Morro de Puerto Santo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (769, 298, N'Puerto Santo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (770, 298, N'San Juan de las Galdonas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (771, 299, N'El Pilar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (772, 299, N'El Rincón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (773, 299, N'General Francisco Antonio Váquez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (774, 299, N'Guaraúnos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (775, 299, N'Tunapuicito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (776, 299, N'Unión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (777, 300, N'Santa Catalina')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (778, 300, N'Santa Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (779, 300, N'Santa Teresa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (780, 300, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (781, 300, N'Maracapana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (782, 302, N'Libertad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (783, 302, N'El Paujil')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (784, 302, N'Yaguaraparo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (785, 303, N'Cruz Salmerón Acosta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (786, 303, N'Chacopata')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (787, 303, N'Manicuare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (788, 304, N'Tunapuy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (789, 304, N'Campo Elías')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (790, 305, N'Irapa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (791, 305, N'Campo Claro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (792, 305, N'Maraval')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (793, 305, N'San Antonio de Irapa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (794, 305, N'Soro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (795, 306, N'Mejía')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (796, 307, N'Cumanacoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (797, 307, N'Arenas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (798, 307, N'Aricagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (799, 307, N'Cogollar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (800, 307, N'San Fernando')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (801, 307, N'San Lorenzo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (802, 308, N'Villa Frontado (Muelle de Cariaco)')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (803, 308, N'Catuaro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (804, 308, N'Rendón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (805, 308, N'San Cruz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (806, 308, N'Santa María')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (807, 309, N'Altagracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (808, 309, N'Santa Inés')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (809, 309, N'Valentín Valiente')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (810, 309, N'Ayacucho')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (811, 309, N'San Juan')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (812, 309, N'Raúl Leoni')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (813, 309, N'Gran Mariscal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (814, 310, N'Cristóbal Colón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (815, 310, N'Bideau')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (816, 310, N'Punta de Piedras')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (817, 310, N'Güiria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (818, 341, N'Andrés Bello')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (819, 342, N'Antonio Rómulo Costa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (820, 343, N'Ayacucho')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (821, 343, N'Rivas Berti')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (822, 343, N'San Pedro del Río')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (823, 344, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (824, 344, N'Palotal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (825, 344, N'General Juan Vicente Gómez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (826, 344, N'Isaías Medina Angarita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (827, 345, N'Cárdenas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (828, 345, N'Amenodoro Ángel Lamus')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (829, 345, N'La Florida')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (830, 346, N'Córdoba')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (831, 347, N'Fernández Feo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (832, 347, N'Alberto Adriani')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (833, 347, N'Santo Domingo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (834, 348, N'Francisco de Miranda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (835, 349, N'García de Hevia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (836, 349, N'Boca de Grita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (837, 349, N'José Antonio Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (838, 350, N'Guásimos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (839, 351, N'Independencia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (840, 351, N'Juan Germán Roscio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (841, 351, N'Román Cárdenas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (842, 352, N'Jáuregui')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (843, 352, N'Emilio Constantino Guerrero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (844, 352, N'Monseñor Miguel Antonio Salas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (845, 353, N'José María Vargas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (846, 354, N'Junín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (847, 354, N'La Petrólea')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (848, 354, N'Quinimarí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (849, 354, N'Bramón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (850, 355, N'Libertad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (851, 355, N'Cipriano Castro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (852, 355, N'Manuel Felipe Rugeles')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (853, 356, N'Libertador')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (854, 356, N'Doradas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (855, 356, N'Emeterio Ochoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (856, 356, N'San Joaquín de Navay')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (857, 357, N'Lobatera')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (858, 357, N'Constitución')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (859, 358, N'Michelena')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (860, 359, N'Panamericano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (861, 359, N'La Palmita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (862, 360, N'Pedro María Ureña')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (863, 360, N'Nueva Arcadia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (864, 361, N'Delicias')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (865, 361, N'Pecaya')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (866, 362, N'Samuel Darío Maldonado')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (867, 362, N'Boconó')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (868, 362, N'Hernández')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (869, 363, N'La Concordia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (870, 363, N'San Juan Bautista')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (871, 363, N'Pedro María Morantes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (872, 363, N'San Sebastián')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (873, 363, N'Dr. Francisco Romero Lobo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (874, 364, N'Seboruco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (875, 365, N'Simón Rodríguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (876, 366, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (877, 366, N'Eleazar López Contreras')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (878, 366, N'San Pablo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (879, 367, N'Torbes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (880, 368, N'Uribante')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (881, 368, N'Cárdenas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (882, 368, N'Juan Pablo Peñalosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (883, 368, N'Potosí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (884, 369, N'San Judas Tadeo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (885, 370, N'Araguaney')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (886, 370, N'El Jaguito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (887, 370, N'La Esperanza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (888, 370, N'Santa Isabel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (889, 371, N'Boconó')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (890, 371, N'El Carmen')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (891, 371, N'Mosquey')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (892, 371, N'Ayacucho')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (893, 371, N'Burbusay')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (894, 371, N'General Ribas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (895, 371, N'Guaramacal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (896, 371, N'Vega de Guaramacal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (897, 371, N'Monseñor Jáuregui')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (898, 371, N'Rafael Rangel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (899, 371, N'San Miguel')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (900, 371, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (901, 372, N'Sabana Grande')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (902, 372, N'Cheregüé')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (903, 372, N'Granados')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (904, 373, N'Arnoldo Gabaldón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (905, 373, N'Bolivia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (906, 373, N'Carrillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (907, 373, N'Cegarra')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (908, 373, N'Chejendé')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (909, 373, N'Manuel Salvador Ulloa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (910, 373, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (911, 374, N'Carache')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (912, 374, N'La Concepción')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (913, 374, N'Cuicas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (914, 374, N'Panamericana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (915, 374, N'Santa Cruz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (916, 375, N'Escuque')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (917, 375, N'La Unión')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (918, 375, N'Santa Rita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (919, 375, N'Sabana Libre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (920, 376, N'El Socorro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (921, 376, N'Los Caprichos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (922, 376, N'Antonio José de Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (923, 377, N'Campo Elías')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (924, 377, N'Arnoldo Gabaldón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (925, 378, N'Santa Apolonia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (926, 378, N'El Progreso')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (927, 378, N'La Ceiba')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (928, 378, N'Tres de Febrero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (929, 379, N'El Dividive')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (930, 379, N'Agua Santa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (931, 379, N'Agua Caliente')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (932, 379, N'El Cenizo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (933, 379, N'Valerita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (934, 380, N'Monte Carmelo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (935, 380, N'Buena Vista')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (936, 380, N'Santa María del Horcón')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (937, 381, N'Motatán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (938, 381, N'El Baño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (939, 381, N'Jalisco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (940, 382, N'Pampán')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (941, 382, N'Flor de Patria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (942, 382, N'La Paz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (943, 382, N'Santa Ana')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (944, 383, N'Pampanito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (945, 383, N'La Concepción')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (946, 383, N'Pampanito II')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (947, 384, N'Betijoque')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (948, 384, N'José Gregorio Hernández')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (949, 384, N'La Pueblita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (950, 384, N'Los Cedros')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (951, 385, N'Carvajal')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (952, 385, N'Campo Alegre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (953, 385, N'Antonio Nicolás Briceño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (954, 385, N'José Leonardo Suárez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (955, 386, N'Sabana de Mendoza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (956, 386, N'Junín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (957, 386, N'Valmore Rodríguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (958, 386, N'El Paraíso')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (959, 387, N'Andrés Linares')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (960, 387, N'Chiquinquirá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (961, 387, N'Cristóbal Mendoza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (962, 387, N'Cruz Carrillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (963, 387, N'Matriz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (964, 387, N'Monseñor Carrillo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (965, 387, N'Tres Esquinas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (966, 388, N'Cabimbú')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (967, 388, N'Jajó')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (968, 388, N'La Mesa de Esnujaque')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (969, 388, N'Santiago')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (970, 388, N'Tuñame')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (971, 388, N'La Quebrada')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (972, 389, N'Juan Ignacio Montilla')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (973, 389, N'La Beatriz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (974, 389, N'La Puerta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (975, 389, N'Mendoza del Valle de Momboy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (976, 389, N'Mercedes Díaz')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (977, 389, N'San Luis')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (978, 390, N'Caraballeda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (979, 390, N'Carayaca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (980, 390, N'Carlos Soublette')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (981, 390, N'Caruao Chuspa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (982, 390, N'Catia La Mar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (983, 390, N'El Junko')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (984, 390, N'La Guaira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (985, 390, N'Macuto')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (986, 390, N'Maiquetía')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (987, 390, N'Naiguatá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (988, 390, N'Urimare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (989, 391, N'Arístides Bastidas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (990, 392, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (991, 407, N'Chivacoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (992, 407, N'Campo Elías')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (993, 408, N'Cocorote')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (994, 409, N'Independencia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (995, 410, N'José Antonio Páez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (996, 411, N'La Trinidad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (997, 412, N'Manuel Monge')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (998, 413, N'Salóm')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (999, 413, N'Temerla')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1000, 413, N'Nirgua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1001, 414, N'San Andrés')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1002, 414, N'Yaritagua')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1003, 415, N'San Javier')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1004, 415, N'Albarico')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1005, 415, N'San Felipe')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1006, 416, N'Sucre')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1007, 417, N'Urachiche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1008, 418, N'El Guayabo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1009, 418, N'Farriar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1010, 441, N'Isla de Toas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1011, 441, N'Monagas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1012, 442, N'San Timoteo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1013, 442, N'General Urdaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1014, 442, N'Libertador')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1015, 442, N'Marcelino Briceño')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1016, 442, N'Pueblo Nuevo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1017, 442, N'Manuel Guanipa Matos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1018, 443, N'Ambrosio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1019, 443, N'Carmen Herrera')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1020, 443, N'La Rosa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1021, 443, N'Germán Ríos Linares')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1022, 443, N'San Benito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1023, 443, N'Rómulo Betancourt')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1024, 443, N'Jorge Hernández')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1025, 443, N'Punta Gorda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1026, 443, N'Arístides Calvani')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1027, 444, N'Encontrados')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1028, 444, N'Udón Pérez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1029, 445, N'Moralito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1030, 445, N'San Carlos del Zulia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1031, 445, N'Santa Cruz del Zulia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1032, 445, N'Santa Bárbara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1033, 445, N'Urribarrí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1034, 446, N'Carlos Quevedo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1035, 446, N'Francisco Javier Pulgar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1036, 446, N'Simón Rodríguez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1037, 446, N'Guamo-Gavilanes')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1038, 448, N'La Concepción')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1039, 448, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1040, 448, N'Mariano Parra León')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1041, 448, N'José Ramón Yépez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1042, 449, N'Jesús María Semprún')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1043, 449, N'Barí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1044, 450, N'Concepción')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1045, 450, N'Andrés Bello')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1046, 450, N'Chiquinquirá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1047, 450, N'El Carmelo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1048, 450, N'Potreritos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1049, 451, N'Libertad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1050, 451, N'Alonso de Ojeda')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1051, 451, N'Venezuela')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1052, 451, N'Eleazar López Contreras')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1053, 451, N'Campo Lara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1054, 452, N'Bartolomé de las Casas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1055, 452, N'Libertad')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1056, 452, N'Río Negro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1057, 452, N'San José de Perijá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1058, 453, N'San Rafael')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1059, 453, N'La Sierrita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1060, 453, N'Las Parcelas')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1061, 453, N'Luis de Vicente')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1062, 453, N'Monseñor Marcos Sergio Godoy')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1063, 453, N'Ricaurte')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1064, 453, N'Tamare')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1065, 454, N'Antonio Borjas Romero')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1066, 454, N'Bolívar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1067, 454, N'Cacique Mara')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1068, 454, N'Carracciolo Parra Pérez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1069, 454, N'Cecilio Acosta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1070, 454, N'Cristo de Aranza')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1071, 454, N'Coquivacoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1072, 454, N'Chiquinquirá')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1073, 454, N'Francisco Eugenio Bustamante')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1074, 454, N'Idelfonzo Vásquez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1075, 454, N'Juana de Ávila')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1076, 454, N'Luis Hurtado Higuera')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1077, 454, N'Manuel Dagnino')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1078, 454, N'Olegario Villalobos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1079, 454, N'Raúl Leoni')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1080, 454, N'Santa Lucía')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1081, 454, N'Venancio Pulgar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1082, 454, N'San Isidro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1083, 455, N'Altagracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1084, 455, N'Faría')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1085, 455, N'Ana María Campos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1086, 455, N'San Antonio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1087, 455, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1088, 456, N'Donaldo García')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1089, 456, N'El Rosario')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1090, 456, N'Sixto Zambrano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1091, 457, N'San Francisco')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1092, 457, N'El Bajo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1093, 457, N'Domitila Flores')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1094, 457, N'Francisco Ochoa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1095, 457, N'Los Cortijos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1096, 457, N'Marcial Hernández')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1097, 458, N'Santa Rita')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1098, 458, N'El Mene')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1099, 458, N'Pedro Lucas Urribarrí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1100, 458, N'José Cenobio Urribarrí')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1101, 459, N'Rafael Maria Baralt')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1102, 459, N'Manuel Manrique')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1103, 459, N'Rafael Urdaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1104, 460, N'Bobures')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1105, 460, N'Gibraltar')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1106, 460, N'Heras')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1107, 460, N'Monseñor Arturo Álvarez')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1108, 460, N'Rómulo Gallegos')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1109, 460, N'El Batey')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1110, 461, N'Rafael Urdaneta')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1111, 461, N'La Victoria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1112, 461, N'Raúl Cuenca')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1113, 447, N'Sinamaica')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1114, 447, N'Alta Guajira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1115, 447, N'Elías Sánchez Rubio')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1116, 447, N'Guajira')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1117, 462, N'Altagracia')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1118, 462, N'Antímano')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1119, 462, N'Caricuao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1120, 462, N'Catedral')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1121, 462, N'Coche')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1122, 462, N'El Junquito')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1123, 462, N'El Paraíso')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1124, 462, N'El Recreo')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1125, 462, N'El Valle')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1126, 462, N'La Candelaria')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1127, 462, N'La Pastora')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1128, 462, N'La Vega')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1129, 462, N'Macarao')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1130, 462, N'San Agustín')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1131, 462, N'San Bernardino')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1132, 462, N'San José')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1133, 462, N'San Juan')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1134, 462, N'San Pedro')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1135, 462, N'Santa Rosalía')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1136, 462, N'Santa Teresa')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1137, 462, N'Sucre (Catia)')
GO
INSERT [dbo].[Parroquia] ([ParroquiaID], [MunicipioID], [NombreParroquia]) VALUES (1138, 462, N'23 de enero')
GO
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] ON 

GO
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (1, N'Atención Visitas', N'Recepcion')
GO
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (6, N'Consultas', N'Solo realizan consultas')
GO
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (9, N'Opciones Especiales', N'Actualizan tablas')
GO
INSERT [dbo].[SeguridadGrupo] ([SeguridadGrupoID], [NombreGrupo], [DescripcionGrupo]) VALUES (10, N'ADMINISTRADOR', N'ACCESO A TODO')
GO
SET IDENTITY_INSERT [dbo].[SeguridadGrupo] OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] ON 

GO
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (1, N'Atencion Visitantes')
GO
INSERT [dbo].[SeguridadObjeto] ([SeguridadObjetoID], [NombreObjeto]) VALUES (2, N'Consulta de Visitas')
GO
SET IDENTITY_INSERT [dbo].[SeguridadObjeto] OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] ON 

GO
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (15, 1, 1)
GO
INSERT [dbo].[SeguridadObjetoAcceso] ([SeguridadObjetoAccesoID], [SeguridadGrupoID], [SeguridadObjetoID]) VALUES (16, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[SeguridadObjetoAcceso] OFF
GO
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] ON 

GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (2, N'Carceb', N'1', N'CARLOS CEBALLOS', N'ADMINISTRADOR', 10, 0, N'Activo', 3)
GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (4, N'Admin', N'1', N'Administrador', N'Admin', 10, 0, N'Activo', 3)
GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (23, N'JSifuentes', N'1', N'JHENSON SIFUENTES', N'MEDICO', 1, 1, N'Activo', 3)
GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (25, N'IYepez', N'1', N'INGRID YEPEZ', N'MEDICO', 1, 1, N'Activo', 3)
GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (27, N'Secre1', N'1', N'SECRETARIA 1', N'SECRETARIA 1', 1, 0, N'Activo', 3)
GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (28, N'VDonoso', N'1', N'VANIA DONOSO', N'DOCTORA', 1, 1, N'Activo', 3)
GO
INSERT [dbo].[SeguridadUsuarioDatos] ([SeguridadUsuarioDatosID], [LoginUsuario], [ClaveUsuario], [NombreCompleto], [DescripcionUsuario], [SeguridadGrupoID], [UsuarioTecnico], [EstatusUsuario], [ConsultorioID]) VALUES (29, N'Petronilo', N'1', N'PETRONILO', N'DOCTOR', 1, 1, N'Activo', 3)
GO
SET IDENTITY_INSERT [dbo].[SeguridadUsuarioDatos] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoHoraSemana] ON 

GO
INSERT [dbo].[TipoHoraSemana] ([TipoHoraSemanaID], [NombreTipoHoraSemana]) VALUES (1, N'AM')
GO
INSERT [dbo].[TipoHoraSemana] ([TipoHoraSemanaID], [NombreTipoHoraSemana]) VALUES (2, N'PM')
GO
SET IDENTITY_INSERT [dbo].[TipoHoraSemana] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoSangre] ON 

GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (1, N'A+')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (2, N'A-')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (3, N'B+')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (4, N'B-')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (5, N'AB+')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (6, N'AB-')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (7, N'O+')
GO
INSERT [dbo].[TipoSangre] ([TipoSangreID], [NombreTipoSangre]) VALUES (8, N'O-')
GO
SET IDENTITY_INSERT [dbo].[TipoSangre] OFF
GO
ALTER TABLE [dbo].[Aseguradora] ADD  CONSTRAINT [DF_Aseguradora_TelefonoAseguradora]  DEFAULT ('N/D') FOR [TelefonoAseguradora]
GO
ALTER TABLE [dbo].[Aseguradora] ADD  CONSTRAINT [DF_Aseguradora_ContactoAseguradora]  DEFAULT ('N/D') FOR [ContactoAseguradora]
GO
ALTER TABLE [dbo].[Cita] ADD  CONSTRAINT [DF_Cita_EMailPacienteCita]  DEFAULT ('N/D') FOR [EMailPacienteCita]
GO
ALTER TABLE [dbo].[Cita] ADD  CONSTRAINT [DF_Cita_EstatusCitaID]  DEFAULT ((1)) FOR [EstatusCitaID]
GO
ALTER TABLE [dbo].[Cita] ADD  CONSTRAINT [DF_Cita_FechaCreacionCita]  DEFAULT (getdate()) FOR [FechaCreacionCita]
GO
ALTER TABLE [dbo].[Consultorio] ADD  CONSTRAINT [DF_Consultorio_EmailConsultorio]  DEFAULT ('N/D') FOR [EmailConsultorio]
GO
ALTER TABLE [dbo].[HistoriaMedica] ADD  CONSTRAINT [DF_HistoriaMedica_Alergias]  DEFAULT ((0)) FOR [Alergias]
GO
ALTER TABLE [dbo].[HistoriaMedica] ADD  CONSTRAINT [DF_HistoriaMedica_DescripcionAlergias]  DEFAULT ('N/D') FOR [DescripcionAlergias]
GO
ALTER TABLE [dbo].[HistoriaMedica] ADD  CONSTRAINT [DF_HistoriaMedica_Fumador]  DEFAULT ((0)) FOR [Fumador]
GO
ALTER TABLE [dbo].[MedicoConsultorio] ADD  CONSTRAINT [DF_MedicoConsultorio_NumeroMaximoCitas]  DEFAULT ((1)) FOR [NumeroMaximoCitas]
GO
ALTER TABLE [dbo].[MedicoConsultorio] ADD  CONSTRAINT [DF_MedicoConsultorio_SeguridadUsuarioDatosID]  DEFAULT ((0)) FOR [SeguridadUsuarioDatosID]
GO
ALTER TABLE [dbo].[Paciente] ADD  CONSTRAINT [DF_Paciente_Peso]  DEFAULT ((0)) FOR [Peso]
GO
ALTER TABLE [dbo].[PacienteConsulta] ADD  CONSTRAINT [DF_PacienteConsulta_DescripcionTratamiento]  DEFAULT ('N/D') FOR [DescripcionTratamiento]
GO
ALTER TABLE [dbo].[PacienteConsulta] ADD  CONSTRAINT [DF_PacienteConsulta_Medicamentos]  DEFAULT ('N/D') FOR [Medicamentos]
GO
ALTER TABLE [dbo].[PacienteConsulta] ADD  CONSTRAINT [DF_PacienteConsulta_DescripcionEvolucionTratamiento]  DEFAULT ('N/D') FOR [DescripcionEvolucionTratamiento]
GO
ALTER TABLE [dbo].[SeguridadUsuarioDatos] ADD  CONSTRAINT [DF_SeguridadUsuarioDatos_ConsultorioID]  DEFAULT ((0)) FOR [ConsultorioID]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Estado] FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([EstadoID])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Estado]
GO
ALTER TABLE [dbo].[MedicoConsultorio]  WITH CHECK ADD  CONSTRAINT [FK_MedicoConsultorio_Medico] FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medico] ([MedicoID])
GO
ALTER TABLE [dbo].[MedicoConsultorio] CHECK CONSTRAINT [FK_MedicoConsultorio_Medico]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Estado] FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([EstadoID])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Estado]
GO
ALTER TABLE [dbo].[PacienteConsulta]  WITH CHECK ADD  CONSTRAINT [FK_PacienteConsulta_Medico] FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medico] ([MedicoID])
GO
ALTER TABLE [dbo].[PacienteConsulta] CHECK CONSTRAINT [FK_PacienteConsulta_Medico]
GO
ALTER TABLE [dbo].[PacienteConsulta]  WITH CHECK ADD  CONSTRAINT [FK_PacienteConsulta_Paciente] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Paciente] ([PacienteID])
GO
ALTER TABLE [dbo].[PacienteConsulta] CHECK CONSTRAINT [FK_PacienteConsulta_Paciente]
GO
ALTER TABLE [dbo].[Parroquia]  WITH CHECK ADD  CONSTRAINT [FK_Parroquia_Municipio] FOREIGN KEY([MunicipioID])
REFERENCES [dbo].[Municipio] ([MunicipioID])
GO
ALTER TABLE [dbo].[Parroquia] CHECK CONSTRAINT [FK_Parroquia_Municipio]
GO
/****** Object:  Trigger [dbo].[ActualizaEstatusCita]    Script Date: 2/6/2017 3:56:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ActualizaEstatusCita] ON [dbo].[PacienteConsulta]
AFTER UPDATE
AS
declare @PacienteID int
declare @CedulaPaciente int
declare @EstatusCitaID int

select @PacienteID= PacienteID from inserted
select @EstatusCitaID= EstatusCitaID from inserted

select @CedulaPaciente = CedulaPaciente from Paciente Where PacienteID = @PacienteID
 if @EstatusCitaID = 4
	delete from Cita where CedulaPacienteCita = @CedulaPaciente
else
	update Cita set EstatusCitaID= @EstatusCitaID 
	where CedulaPacienteCita = @CedulaPaciente

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[20] 3[4] 2) )"
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
         Begin Table = "Consultorio"
            Begin Extent = 
               Top = 85
               Left = 108
               Bottom = 313
               Right = 362
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
               Top = 117
               Left = 579
               Bottom = 220
               Right = 786
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
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Medico"
            Begin Extent = 
               Top = 109
               Left = 827
               Bottom = 311
               Right = 1050
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleCalendarioConsultorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
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
               Top = 70
               Left = 647
               Bottom = 160
               Right = 864
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
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
         Width = 11805
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3750
         Alias = 900
         Table = 3045
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
         Configuration = "(H (1[40] 4[18] 2[6] 3) )"
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
         Begin Table = "MedicoConsultorio"
            Begin Extent = 
               Top = 6
               Left = 539
               Bottom = 204
               Right = 737
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Consultorio"
            Begin Extent = 
               Top = 7
               Left = 103
               Bottom = 209
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Medico"
            Begin Extent = 
               Top = 68
               Left = 783
               Bottom = 264
               Right = 1014
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Width = 3885
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DetalleUsuarioConsultorio'
GO
USE [master]
GO
ALTER DATABASE [Clinical] SET  READ_WRITE 
GO
