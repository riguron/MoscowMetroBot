@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\MoscowSubwayBot\Telegram\1.0\Telegram-1.0.jar;"%REPO%"\org\telegram\telegrambots\4.1\telegrambots-4.1.jar;"%REPO%"\org\telegram\telegrambots-meta\4.1\telegrambots-meta-4.1.jar;"%REPO%"\com\google\inject\guice\4.1.0\guice-4.1.0.jar;"%REPO%"\javax\inject\javax.inject\1\javax.inject-1.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\com\google\guava\guava\19.0\guava-19.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.9.0\jackson-annotations-2.9.0.jar;"%REPO%"\com\fasterxml\jackson\jaxrs\jackson-jaxrs-json-provider\2.9.6\jackson-jaxrs-json-provider-2.9.6.jar;"%REPO%"\com\fasterxml\jackson\jaxrs\jackson-jaxrs-base\2.9.6\jackson-jaxrs-base-2.9.6.jar;"%REPO%"\com\fasterxml\jackson\module\jackson-module-jaxb-annotations\2.9.6\jackson-module-jaxb-annotations-2.9.6.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.9.6\jackson-databind-2.9.6.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.9.6\jackson-core-2.9.6.jar;"%REPO%"\org\glassfish\jersey\media\jersey-media-json-jackson\2.26\jersey-media-json-jackson-2.26.jar;"%REPO%"\org\glassfish\jersey\core\jersey-common\2.26\jersey-common-2.26.jar;"%REPO%"\org\glassfish\hk2\osgi-resource-locator\1.0.1\osgi-resource-locator-1.0.1.jar;"%REPO%"\org\glassfish\jersey\ext\jersey-entity-filtering\2.26\jersey-entity-filtering-2.26.jar;"%REPO%"\org\glassfish\jersey\containers\jersey-container-grizzly2-http\2.25.1\jersey-container-grizzly2-http-2.25.1.jar;"%REPO%"\org\glassfish\hk2\external\javax.inject\2.5.0-b32\javax.inject-2.5.0-b32.jar;"%REPO%"\org\glassfish\grizzly\grizzly-http-server\2.3.28\grizzly-http-server-2.3.28.jar;"%REPO%"\org\glassfish\grizzly\grizzly-http\2.3.28\grizzly-http-2.3.28.jar;"%REPO%"\org\glassfish\grizzly\grizzly-framework\2.3.28\grizzly-framework-2.3.28.jar;"%REPO%"\javax\ws\rs\javax.ws.rs-api\2.0.1\javax.ws.rs-api-2.0.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-server\2.26\jersey-server-2.26.jar;"%REPO%"\org\glassfish\jersey\core\jersey-client\2.26\jersey-client-2.26.jar;"%REPO%"\org\glassfish\jersey\media\jersey-media-jaxb\2.26\jersey-media-jaxb-2.26.jar;"%REPO%"\javax\validation\validation-api\2.0.1.Final\validation-api-2.0.1.Final.jar;"%REPO%"\org\json\json\20160810\json-20160810.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.6\httpclient-4.5.6.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.10\httpcore-4.4.10.jar;"%REPO%"\commons-codec\commons-codec\1.11\commons-codec-1.11.jar;"%REPO%"\org\apache\httpcomponents\httpmime\4.5.6\httpmime-4.5.6.jar;"%REPO%"\commons-io\commons-io\2.5\commons-io-2.5.jar;"%REPO%"\MoscowSubwayBot\Core\1.0\Core-1.0.jar;"%REPO%"\com\google\code\gson\gson\2.8.5\gson-2.8.5.jar;"%REPO%"\org\apache\commons\commons-collections4\4.3\commons-collections4-4.3.jar;"%REPO%"\MoscowSubwayBot\Persistence\1.0\Persistence-1.0.jar;"%REPO%"\javax\persistence\javax.persistence-api\2.2\javax.persistence-api-2.2.jar;"%REPO%"\com\zaxxer\HikariCP\2.7.9\HikariCP-2.7.9.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.25\slf4j-api-1.7.25.jar;"%REPO%"\org\postgresql\postgresql\42.2.5\postgresql-42.2.5.jar;"%REPO%"\javax\xml\bind\jaxb-api\2.3.0\jaxb-api-2.3.0.jar;"%REPO%"\org\springframework\boot\spring-boot-starter\2.0.5.RELEASE\spring-boot-starter-2.0.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot\2.0.5.RELEASE\spring-boot-2.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-context\5.0.9.RELEASE\spring-context-5.0.9.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\5.0.9.RELEASE\spring-expression-5.0.9.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-autoconfigure\2.0.5.RELEASE\spring-boot-autoconfigure-2.0.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-logging\2.0.5.RELEASE\spring-boot-starter-logging-2.0.5.RELEASE.jar;"%REPO%"\ch\qos\logback\logback-classic\1.2.3\logback-classic-1.2.3.jar;"%REPO%"\ch\qos\logback\logback-core\1.2.3\logback-core-1.2.3.jar;"%REPO%"\org\apache\logging\log4j\log4j-to-slf4j\2.10.0\log4j-to-slf4j-2.10.0.jar;"%REPO%"\org\apache\logging\log4j\log4j-api\2.10.0\log4j-api-2.10.0.jar;"%REPO%"\org\slf4j\jul-to-slf4j\1.7.25\jul-to-slf4j-1.7.25.jar;"%REPO%"\javax\annotation\javax.annotation-api\1.3.2\javax.annotation-api-1.3.2.jar;"%REPO%"\org\springframework\spring-core\5.0.9.RELEASE\spring-core-5.0.9.RELEASE.jar;"%REPO%"\org\springframework\spring-jcl\5.0.9.RELEASE\spring-jcl-5.0.9.RELEASE.jar;"%REPO%"\org\yaml\snakeyaml\1.19\snakeyaml-1.19.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-data-jpa\2.0.5.RELEASE\spring-boot-starter-data-jpa-2.0.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-aop\2.0.5.RELEASE\spring-boot-starter-aop-2.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\5.0.9.RELEASE\spring-aop-5.0.9.RELEASE.jar;"%REPO%"\org\aspectj\aspectjweaver\1.8.13\aspectjweaver-1.8.13.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-jdbc\2.0.5.RELEASE\spring-boot-starter-jdbc-2.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-jdbc\5.0.9.RELEASE\spring-jdbc-5.0.9.RELEASE.jar;"%REPO%"\javax\transaction\javax.transaction-api\1.2\javax.transaction-api-1.2.jar;"%REPO%"\org\hibernate\hibernate-core\5.2.17.Final\hibernate-core-5.2.17.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.3.2.Final\jboss-logging-3.3.2.Final.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.1-api\1.0.2.Final\hibernate-jpa-2.1-api-1.0.2.Final.jar;"%REPO%"\org\javassist\javassist\3.22.0-GA\javassist-3.22.0-GA.jar;"%REPO%"\antlr\antlr\2.7.7\antlr-2.7.7.jar;"%REPO%"\org\jboss\jandex\2.0.3.Final\jandex-2.0.3.Final.jar;"%REPO%"\com\fasterxml\classmate\1.3.4\classmate-1.3.4.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\org\hibernate\common\hibernate-commons-annotations\5.0.1.Final\hibernate-commons-annotations-5.0.1.Final.jar;"%REPO%"\org\springframework\data\spring-data-jpa\2.0.10.RELEASE\spring-data-jpa-2.0.10.RELEASE.jar;"%REPO%"\org\springframework\data\spring-data-commons\2.0.10.RELEASE\spring-data-commons-2.0.10.RELEASE.jar;"%REPO%"\org\springframework\spring-orm\5.0.9.RELEASE\spring-orm-5.0.9.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\5.0.9.RELEASE\spring-tx-5.0.9.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\5.0.9.RELEASE\spring-beans-5.0.9.RELEASE.jar;"%REPO%"\org\springframework\spring-aspects\5.0.9.RELEASE\spring-aspects-5.0.9.RELEASE.jar;"%REPO%"\org\hsqldb\hsqldb\2.5.0\hsqldb-2.5.0.jar;"%REPO%"\MoscowSubwayBot\Bootstrap\1.0\Bootstrap-1.0.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="worker" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" io.riguron.metro.Bootstrap %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
