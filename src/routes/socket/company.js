import { SOCKET_KEY } from '../../constants.js';
import { add, get, getById, remove } from '../../controller/Companys.js';

const CompanyEvents = (io, socket, session) => {
    io.on(SOCKET_KEY.COMPANY.GET_COMPANYS, async (sessionId, filter) => {
        if (session.HasSession(sessionId)) {
            const result = await get(filter);
            io.emit(SOCKET_KEY.COMPANY.GET_COMPANYS, result)
        } else {
            socket.emit(SOCKET_KEY.LOGIN.ERROR)
        }
    })
    io.on(SOCKET_KEY.COMPANY.CREATE_COMPANY, async (sessionId, company) => {
        if (session.HasSession(sessionId)) {
            const result = await add(company);
            io.emit(SOCKET_KEY.COMPANY.CREATE_COMPANY, result)
        } else {
            socket.emit(SOCKET_KEY.LOGIN.ERROR)
        }
    })
    io.on(SOCKET_KEY.COMPANY.UPDATE_COMPANY, async (sessionId, id, company) => {
        if (session.HasSession(sessionId)) {
            const result = await update(req, res);
            io.emit(SOCKET_KEY.COMPANY.UPDATE_COMPANY, result)
        } else {
            socket.emit(SOCKET_KEY.LOGIN.ERROR)
        }
    })
    io.on(SOCKET_KEY.COMPANY.GET_COMPANY_BY_ID, async (sessionId, id) => {
        if (session.HasSession(sessionId)) {
            const result = await getById(id);
            socket.emit(SOCKET_KEY.COMPANY.GET_COMPANY_BY_ID, result)
        } else {
            socket.emit(SOCKET_KEY.LOGIN.ERROR)
        }
    })
    io.on(SOCKET_KEY.COMPANY.DELETE_COMPANY, async (sessionId, id) => {
        if (session.HasSession(sessionId)) {
            const result = await remove(id);
            socket.emit(SOCKET_KEY.COMPANY.DELETE_COMPANY, result)
        } else {
            socket.emit(SOCKET_KEY.LOGIN.ERROR)
        }
    })
}
export default CompanyEvents
