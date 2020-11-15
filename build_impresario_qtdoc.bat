echo off
echo Setting up environment for hugo usage...
set PATH=C:\Qt\5.12.7\msvc2017_64\bin;D:\Tools\hugo;%PATH%
echo Building Impresario documentation pages...
set HUGO_UGLYURLS=true
hugo --destination="public_doc" --baseUrl="qthelp://impresario.2.1/doc" --theme="impresario-doc"
echo Building Qt Help file...
copy impresario_*.qhp .\public_doc /Y
cd .\public_doc
qhelpgenerator impresario_2.1.qhp -o ..\impresario_2.1.qch
