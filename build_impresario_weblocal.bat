echo off
echo Setting up environment for hugo usage...
set PATH=D:\Tools\hugo;%PATH%
echo Building Impresario web pages...
hugo server --destination="public_web" --theme="impresario-web"

