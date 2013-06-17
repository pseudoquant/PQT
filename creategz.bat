:: http://www.computing.net/answers/programming/batch-file-to-join-files-into-one-file/19150.html
@echo off

:: clean up
::rmdir /S /Q SIT

if not exist .\temp mkdir .\temp

:: delete code.r if present
if exist .\temp\code.r del .\temp\code.r

:: create code.r
echo. >.\temp\code.r

::copy/b .\temp\code.r+Readme.txt .\temp\code.r

:: merge all R\*.r files
for %%a in (R\*.r) do (
	echo. >>.\temp\code.r
	copy/b .\temp\code.r+"%%a" .\temp\code.r
)

::remove_r_comments .\temp\code.r .\temp\code1.r
::del .\temp\code.r
::copy/b Readme.txt+.\temp\code1.r .\temp\code.r


:: delete pqt.zip if present
if exist pqt.gz del pqt.gz

:: create zip
.\library\7za.exe a -tgzip pqt.gz -mx9 .\temp\code.r

:: clean up
del /Q .\temp\*.*
rmdir .\temp
