# docker-homebridge-loxone

This image runs [Homebridge with Loxone Plugin](https://github.com/Sroose/homebridge-loxone-ws).

## How to use this image

```sudo docker run --restart=always --net=host -d --name homebridge -p 5353:5353 -p 51826:51826 -e LOXONE_IP_ADDRESS=192.168.1.200 -e LOXONE_PASSWORD='password' vchrisb/homebridge-loxone```

The following environment variables are also honored for configuring your ScaleIO Gateway instance:
* `-e LOXONE_IP_ADDRESS=` 
* `-e LOXONE_USERNAME=` defaults to `admin`
* `-e LOXONE_PASSWORD=` 
* `-e HOMEBRIDGE_USERNAME=` defaults to `CA:AA:12:34:56:78`
* `-e HOMEBRIDGE_PIN=` defaults to `012-34-567`

## Examples

### use docker volume for persistence

```
sudo docker volume create homebridge_vol
```

```sudo docker run --restart=always --net=host -d --name homebridge -p 5353:5353 -p 51826:51826 -e LOXONE_IP_ADDRESS=192.168.1.200 -e LOXONE_USERNAME="admin" -e LOXONE_PASSWORD='password' -e HOMEBRIDGE_USERNAME="CA:AA:12:34:56:78" -e HOMEBRIDGE_PIN="012-34-567" -v homebridge_vol:/root/.homebridge/perist vchrisb/homebridge-loxone```

### use local folder for persistence

```sudo docker run --restart=always --net=host -d --name homebridge -p 5353:5353 -p 51826:51826 -e LOXONE_IP_ADDRESS=192.168.1.200 -e LOXONE_USERNAME="admin" -e LOXONE_PASSWORD='password' -e HOMEBRIDGE_USERNAME="CA:AA:12:34:56:78" -e HOMEBRIDGE_PIN="012-34-567" -v /home/user/homebridge_persist:/root/.homebridge/perist vchrisb/homebridge-loxone```