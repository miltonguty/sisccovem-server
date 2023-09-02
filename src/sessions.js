
//import md5 from 'md5';
import { v4 as uuidv4 } from 'uuid';
import { MessageError } from './lib/utils.js';
var storeSessions = new Map()

export const AddSession = ({ userId, companyId, userName, password }) => {
    const IdSession = uuidv4()
    storeSessions.set(IdSession, { userId, companyId, userName, password, date: Date.now() })
    return IdSession
}
export const RemoveSession = (sessionId) => {
    storeSessions.delete(sessionId)
}
export const HasSession = (sessionId) => {
    if (storeSessions.get(sessionId) == null)
        return false;
    else {
        storeSessions.get(sessionId)
        return true;
    }
}
export const GetSessions = () => {
    return storeSessions
}
export const GetSessionById = (sessionId) => {
    return storeSessions.get(sessionId)
}

export const Authorization = (req, res, next) => {
    const sessionId = req.headers.authorization
    if (HasSession(sessionId)) {
        next()
    } else {
        res.status(403).json(MessageError("User Dooes not has session"));
    }

}

