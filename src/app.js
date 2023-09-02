import express from 'express'
const app = express();
import cors from 'cors'
import http from 'http'
const server = http.createServer(app);
import { appHttp } from './app-http.js'

app.use(cors())
const PORT = process.env.PORT || 4000;

appHttp(app)
server.listen(PORT, () => {
    console.log(`App listening at port ${ PORT }`)

});