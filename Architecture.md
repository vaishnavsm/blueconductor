# Architecture

## Web Server
It's a lightweight server that connects to each of the devices you want to
orchestrate and coordinates connecting/disconnecting between them.

It keeps a websocket alive between itself and each device.

### Endpoints
 
#### `POST /v1/auth` 
#### `DELETE /v1/auth` 

#### `GET /v1/hosts` 
#### `POST /v1/hosts`
#### `DELETE /v1/hosts`

#### `GET /v1/devices` 
#### `POST /v1/devices`
#### `DELETE /v1/devices`

#### `POST /v1/connects`
#### `GET /v1/connects`

## Daemon
Since connecting to/disconnecting from a device has to be done from 
the device, we need a daemon to be running on it to listen to requests 
to do this. 

This daemon authenticates with the server using its token and listens to
any required actions, and performs them.

## CLI



