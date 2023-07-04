import express from 'express'

const app = express();
import cors from 'cors'
import http from 'http'
const server = http.createServer(app);
import { appHttp } from './app-http.js'

//import session from 'express-session'
app.use(cors())
const PORT = process.env.PORT || 4000;
/*app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
}))

// middleware to test if authenticated
function isAuthenticated (req, res, next) {
    if (req.session.user) next()
    else next('route')
}
*/
//const session = sessions()

appHttp(app)
server.listen(PORT, () => {
    console.log(`App listening at port ${ PORT }`)

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