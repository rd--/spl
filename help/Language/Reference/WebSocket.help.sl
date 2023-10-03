# WebSocket -- system type

WebSockets allow two-way interactive communication between a client and a server.

Messages are sent using _send_.

Message are received by registering a listener using either _addEventListener_ or _onMessage_.

WebSockets are somewhat similar to standard Unix-style sockets.

```
| ws = WebSocket('ws://localhost:9160'); | ws.onOpen { ws.send('hello!'); ws.close }
```
