@echo off
title passwordPrj
:start
cls
echo password options:
echo 1. create password.
echo 2. check password.
echo 3. reset password.
echo 4. show password.
echo 5. quit.
echo.
set /p option= select the option....
if %option%== 1 goto create
if %option%== 2 goto check
if %option%== 3 goto reset
if %option%== 4 goto showpassword
if %option%== 5 goto quit
:create
cls
set /p password= enter a password..
echo %password% > password.txt
echo password created sucessfully.. 
set /p tocontinue= Do you want to continue?(y/n)
if %tocontinue%== y goto start
if %tocontinue%== n goto cancel

:check
cls
set /p password= enter password...
for /f "Delims=" %%a in (password.txt) do (
set opsw=%%a
)
if %password%==%opsw% goto checkcorrect
echo entered passord is wrong!!
set /p torepeat= Do you want to go menu?(y/n)
if %torepeat%== y goto start
if %torepeat%== n goto cancel

:checkcorrect
echo entered is right!!
set /p torepeat= Do you want to go menu?(y/n)
if %torepeat%== y goto start
if %torepeat%== n goto cancel

:reset
cls
set /p password= enter old password...
for /f "Delims=" %%a in (password.txt) do (
set opsw= %%a
)
if %password%==%opsw% goto resetcheckcorrect
echo entered passord is wrong!!
set /p totry= Do you want to try again?(y/n)
if %totry%== y goto reset
set /p torepeat= Do you want to go menu?(y/n)
if %torepeat%== y goto start
if %torepeat%== n goto cancel

:resetcheckcorrect
echo entered is right!!
set /p setpassword= enter a password..
echo %setpassword% > password.txt
echo password changed sucessfully.. 
set /p torepeat= Do you want to go menu?(y/n)
if %torepeat%== y goto start
if %torepeat%== n goto cancel

:showpassword
for /f "Delims=" %%a in (password.txt) do (
set psw= %%a
)
echo the password is...
echo %psw%
set /p torepeat= Do you want to go menu?(y/n)
if %torepeat%== y goto start
if %torepeat%== n goto cancel

:quit

:cancel
