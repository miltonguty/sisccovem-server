import { ERROR_MESSASGE_LOGIN, SOCKET_KEY } from "./constants.js";
import ClientEvents from "./routes/socket/clients.js";
import CompanyEvents from "./routes/socket/company.js";
import sessions from './sessions.js'
export const appSocket = (io) => {
    const session = sessions()
    io.on(SOCKET_KEY.CONNECTION, async (socket) => {
        console.log(socket.id)

        ClientEvents(io, socket, session)
        CompanyEvents(io, socket, session)


        socket.on(SOCKET_KEY.LOGOUT.LOGOUT, (sessionId) => {
            session.RemoveSession(sessionId)
            socket.emit(SOCKET_KEY.LOGOUT.SUCCESS)

        })
        socket.on(SOCKET_KEY.SESSION.GET_SESSION, (sessionId) => {
            if (session.HasSession(sessionId, socket)) {
                const user = session.GetSessionById(sessionId).user
                const socketCli = session.GetSessionById(sessionId).socket
                socketCli.emit(SOCKET_KEY.LOGIN.SUCCESS, { sessionId, userName: user.name, email: user.email })
            } else {
                socket.emit(SOCKET_KEY.SESSION.WITHOUT_SESSION)
            }
        })
        socket.on(SOCKET_KEY.LOGIN.LOGIN, async ({ userName, password }) => {
            const sessionId = await session.AddSession(socket, userName, password)
            if (sessionId) {
                const user = session.GetSessionById(sessionId).user
                const socket = session.GetSessionById(sessionId).socket
                socket.emit(SOCKET_KEY.LOGIN.SUCCESS, { sessionId, userName: user.name, email: user.email })
            }
            else {
                socket.emit(SOCKET_KEY.LOGIN.ERROR, { Error: ERROR_MESSASGE_LOGIN })
            }
        })
    });
    io.on(SOCKET_KEY.DISCONNECT, (reason) => {
        socket.Disconnect()
        console.log("disconnection")
        session.RemoveSession(socket.id)
        console.info("disconnection")
    });
}