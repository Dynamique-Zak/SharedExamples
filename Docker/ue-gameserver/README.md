## Build

docker build . -t du-online-server:latest

## Run

docker run -p 7778:7777/udp --rm -it du-online-server

docker run -p 7778:7777/udp -d --net=host --name=du-online-dedicated du-online-server

docker run -d --net=host -v /home/steam/du-online-dedicated/ --name=du-online-dedicated du-online-server

docker run -d --net=host -v /usr/games/du-online-dedicated/ --name=du-online-dedicated du-online-server

docker run -d --net=host --name=du-server du-online-server


docker run -p 7778:7777/udp -d --net=host -v /home/steam/du-online-dedicated/ --name=du-online-dedicated du-online-server

## details
du-online-dedicated

/home/steam/du-online-dedicated/