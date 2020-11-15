echo off
echo Setting up environment for hugo usage...
set PATH=C:\Qt\5.12.7\msvc2017_64\bin;D:\Tools\hugo;%PATH%
set HUGO_UGLYURLS=true
echo Building Impresario documentation pages...
hugo --destination="public_doc" --baseUrl="file:///D:/Daten_Lars/Projekte/impresario-doc/public_doc" --theme="impresario-doc"


