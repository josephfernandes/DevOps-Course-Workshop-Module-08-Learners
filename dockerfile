FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app/app

COPY . .

RUN dotnet build &&\
    curl -fsSL https://deb.nodesource.com/setup_17.x | bash - &&\
    apt-get install -y nodejs &&\
    cd DotnetTemplate.Web &&\
    npm install &&\
    npm run build 
  


WORKDIR  /app/app/DotnetTemplate.Web

ENTRYPOINT dotnet run 