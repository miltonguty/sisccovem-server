import express from 'express'
const app = express();
import cors from 'cors'
import http from 'http'
import path from 'path'
import { fileURLToPath } from 'url';
import { appHttp } from './app-http.js'

const server = http.createServer(app)

const __filename = fileURLToPath(import.meta.url)

const __dirname = path.dirname(__filename);
app.use(cors())
const PORT = process.env.PORT || 4000;
// Hacer que node sirva los archivos de nuestro app React
app.use(express.static(path.resolve(__dirname, '../../sisccovem-cl/build')));

appHttp(app)
app.get('*', (req, res) => {
    res.sendFile(path.resolve(__dirname, '../../sisccovem-cl/build', 'index.html'));
});
server.listen(PORT, () => {
    console.log(`App listening at port ${ PORT }`)

});