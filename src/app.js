import express from 'express'

const app = express();
import http from 'http'
const server = http.createServer(app);
import { appHttp } from './app-http.js'
import { appSocket } from './app-sockets.js'
import { Server } from "socket.io"
const io = new Server(server, {
    cors: {
        origin: ["http://localhost:3000"],

    }
});
const PORT = process.env.PORT || 4000;

app.get('/', (req, res) => {
    res.send('<h1>Hello world</h1>');
});

appSocket(io )
appHttp(app)
server.listen(PORT, () => {
    console.log(`App listening at port ${ PORT }`)
    console.log(`App listening client  ${ process.env.CLIENT_URL }`)
});

/*import cors from 'cors'
import { createServer } from 'http'
import express, { json } from 'express'
import { Server } from 'socket.io'

import { appHttp } from './app-http.js'
import { appSocket } from './app-sockets.js'
const app = express()
const httpServer = createServer(app)

import sessions from './sessions.js'
const PORT = process.env.PORT || 4000;
//app.use(json())

const io = new Server(httpServer, {
    cors: {
        origin: '*'
    }
});

app.use(cors({
    origin: '*'

}))
sessions();
appSocket(io, sessions)
appHttp(app, sessions)
app.listen(PORT, () => {
    console.log(`App listening at port ${ PORT }`)
    console.log(`App listening client  ${ process.env.CLIENT_URL }`)
});
*/