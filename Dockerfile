FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base

# Make volume dirs
RUN for DIR in /app/instances; do mkdir $DIR; chown app: $DIR; done
RUN touch /app/data.db && chown app: /app/data.db

USER $APP_UID
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ./SS14.Watchdog .
RUN dotnet restore "SS14.Watchdog/SS14.Watchdog.csproj"
WORKDIR "/src/SS14.Watchdog"
RUN dotnet build "SS14.Watchdog.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "SS14.Watchdog.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SS14.Watchdog.dll"]

VOLUME /app/instances