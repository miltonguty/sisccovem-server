import { add, get, getById, remove, update } from './../../controller/Clients.js';
import { SOCKET_KEY } from "./../../constants.js";

const ClientEvents = (io, socket, session) => {
    socket.on(SOCKET_KEY.CLIENTS.GET_CLIENTS, async ({ sessionId, filter }) => {
        if (session.HasSession(sessionId)) {
            const result = await get(filter);

            io.emit(SOCKET_KEY.CLIENTS.GET_CLIENTS, result)
        } else {
            socket.emit(SOCKET_KEY.SESSION.WITHOUT_SESSION)
        }

    })
    socket.on(SOCKET_KEY.CLIENTS.CREATE_CLIENT, async ({ sessionId, client }) => {
        if (session.HasSession(sessionId)) {
            const result = await add(client);
            io.emit(SOCKET_KEY.CLIENTS.CREATE_CLIENT, result)
        } else {
            socket.emit(SOCKET_KEY.SESSION.WITHOUT_SESSION)
        }
    })
    socket.on(SOCKET_KEY.CLIENTS.UPDATE_CLIENT, async ({ sessionId, client }) => {
        if (session.HasSession(sessionId)) {
            const result = await update(client);
            io.emit(SOCKET_KEY.CLIENTS.UPDATE_CLIENT, result)
        } else {
            socket.emit(SOCKET_KEY.SESSION.WITHOUT_SESSION)
        }
    })
    socket.on(SOCKET_KEY.CLIENTS.GET_CLIENT_BY_ID, async ({ sessionId, clientId }) => {
        if (session.HasSession(sessionId)) {
            const client = await getById(clientId);
            socket.emit(SOCKET_KEY.CLIENTS.GET_CLIENT_BY_ID, client)
        } else {
            socket.emit(SOCKET_KEY.SESSION.WITHOUT_SESSION)
        }
    })
    socket.on(SOCKET_KEY.CLIENTS.DELETE_CLIENT, async ({ sessionId, id }) => {
        if (session.HasSession(sessionId)) {
            const cliDeleted = await remove(id);
            io.emit(SOCKET_KEY.CLIENTS.DELETE_CLIENT, cliDeleted.cliId)
        } else {
            socket.emit(SOCKET_KEY.SESSION.WITHOUT_SESSION)
        }
    })
}
export default ClientEvents
