/*********************************************/
/*Ejercicio 1*/

CREATE DATABASE lab2;

USE lab2;

CREATE TABLE [Tabla] (
  id int IDENTITY PRIMARY KEY,
  descripcion varchar(100)
);

GO

-- Using DDL trigger
CREATE TRIGGER DoNotDropOrAlterTables
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
  RAISERROR ('Cannot drop or alter tables!', 10, 1);
  ROLLBACK;

GO

DROP TABLE [dbo].[Tabla]
GO

ALTER TABLE [dbo].[Tabla] ADD descripcion2 varchar(100)
GO

/*********************************************/
/*Ejercicio 2*/

USE master;
GO

CREATE LOGIN Practica02User1 WITH PASSWORD = '12345', CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF;
GO
GRANT VIEW SERVER STATE TO Practica02User1;
GO

CREATE TRIGGER LimitConnectionsUser
ON ALL SERVER WITH EXECUTE AS 'Practica02User1'
FOR LOGON
AS
BEGIN
  IF ORIGINAL_LOGIN() = 'Practica02User1'
    AND (SELECT
      COUNT(*)
    FROM sys.dm_exec_sessions
    WHERE is_user_process = 1
    AND original_login_name = 'Practica02User1')
    > 2
    ROLLBACK;
END;


/*****************************************************/
/*Ejercicio 3*/


CREATE TABLE Practica02Logins (
  EventDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  EventType nvarchar(64),
  EventDDL nvarchar(max),
  EventXML xml,
  DatabaseName nvarchar(255),
  SchemaName nvarchar(255),
  ObjectName nvarchar(255),
  HostName varchar(64),
  IPAddress varchar(32),
  ProgramName nvarchar(255),
  LoginName nvarchar(255)
);

CREATE TRIGGER AudCreateDropUser
ON DATABASE
FOR CREATE_USER, DROP_USER
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @EventData xml = EVENTDATA();

  DECLARE @ip varchar(32) = (SELECT
    client_net_address
  FROM sys.dm_exec_connections
  WHERE session_id = @@SPID);

  INSERT Practica02Logins (EventType,
  EventDDL,
  EventXML,
  DatabaseName,
  SchemaName,
  ObjectName,
  HostName,
  IPAddress,
  ProgramName,
  LoginName)
    SELECT
      @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)'),
      @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(MAX)'),
      @EventData,
      DB_NAME(),
      @EventData.value('(/EVENT_INSTANCE/SchemaName)[1]', 'NVARCHAR(255)'),
      @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)'),
      HOST_NAME(),
      @ip,
      PROGRAM_NAME(),
      SUSER_SNAME();
END

USE [master]
GO
CREATE LOGIN [Practica02User2] WITH PASSWORD=N'12345', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [lab2]
GO
CREATE USER [Practica02User2] FOR LOGIN [Practica02User2]
GO

USE [master]
GO
DROP LOGIN [Practica02User2]
GO

USE [lab2]
GO

DROP USER [Practica02User2]
GO


SELECT [EventDate]
      ,[EventType]
      ,[EventDDL]
      ,[EventXML]
      ,[DatabaseName]
      ,[SchemaName]
      ,[ObjectName]
      ,[HostName]
      ,[IPAddress]
      ,[ProgramName]
      ,[LoginName]
  FROM [lab2].[dbo].[Practica02Logins]


/*****************************************************/
/*Ejercicio 4*/
GO

CREATE TRIGGER FormatUser
ON DATABASE
FOR CREATE_USER
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @EventData xml = EVENTDATA();
  DECLARE @user nvarchar(255) = @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)');

  IF (SELECT
      PATINDEX('[a-z]', LOWER(SUBSTRING(@user, 1, 1))))
    = 1
    AND (SELECT
      PATINDEX('[a-z]', LOWER(SUBSTRING(@user, 2, 1))))
    = 1
    AND (SELECT
      PATINDEX('[a-z]', LOWER(SUBSTRING(@user, 3, 1))))
    = 1
    AND (SELECT
      PATINDEX('[a-z]', LOWER(SUBSTRING(@user, 4, 1))))
    = 1
    AND (SELECT
      PATINDEX('_', LOWER(SUBSTRING(@user, 5, 1))))
    = 1
  BEGIN
    PRINT ('Created user!');
  END
  ELSE
  BEGIN
    PRINT ('Cannot create user!');
	ROLLBACK;
  END
END
GO

USE [master]
GO
CREATE LOGIN [test] WITH PASSWORD=N'12345', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [lab2]
GO
CREATE USER [test] FOR LOGIN [test]
GO

USE [master]
GO
CREATE LOGIN [1] WITH PASSWORD=N'12345', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [lab2]
GO
CREATE USER [1]  FOR LOGIN [test_]
GO