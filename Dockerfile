FROM mcr.microsoft.com/windows/servercore:20H2

# Install .NET Framework 4
RUN powershell -Command "Install-WindowsFeature NET-Framework-Core"

# Install Office 365 Interop Assemblies
RUN powershell -Command "Install-Module -Name Microsoft365DSC"
RUN powershell -Command "Install-Microsoft365DSCConfiguration -ApplicationName Microsoft365Apps -Edition Standard"

# Set the working directory and entry point
WORKDIR /app

WORKDIR /app
ENTRYPOINT ["test.exe"]
