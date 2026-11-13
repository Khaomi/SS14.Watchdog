FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["SS14.Watchdog/SS14.Watchdog/SS14.Watchdog.csproj", "SS14.Watchdog/"]
RUN dotnet restore "SS14.Watchdog/SS14.Watchdog.csproj"
COPY SS14.Watchdog .
RUN dotnet publish -c Release --no-self-contained -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
VOLUME /app/instances
VOLUME /app/data.db
EXPOSE 5000/tcp
EXPOSE 1212/tcp
EXPOSE 1212/udp
ENV Data__File="/app/data.db"
ENV Servers__InstanceRoot="/app/instances"
ENTRYPOINT ["./SS14.Watchdog"]