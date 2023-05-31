import { get } from "./controller/Users.js"
//import md5 from 'md5';
import { v4 as uuidv4 } from 'uuid';
export default function sessions () {
    var storeSessions = new Map()
    return {
        AddSession: async (socket, userName, password) => {
            let user = await get({ useName: { equals: userName }, usePassword: { equals: password } })
            if (user.length > 0) {
                const IdSession = uuidv4()
                storeSessions.set(IdSession, { socket, user: user[0] })
                return IdSession

            }
            return null
        },
        RemoveSession: (sessionId) => {
            storeSessions.delete(sessionId)
        },
        HasSession: (sessionId, socket) => {
            if (storeSessions.get(sessionId) == null)
                return false;
            else {
                storeSessions.get(sessionId).socket = socket
                return true;
            }
        },
        GetSessions: () => {
            return storeSessions
        },
        GetSessionById: (sessionId) => {
            return storeSessions.get(sessionId)
        }
    }
}
