
import { getUserById } from "../controller/Users.js";
import { GetSessionById } from "../sessions.js";

export function makeSerializable (o) {
  return JSON.parse(JSON.stringify(o));
}
export async function GetEmpresaIdByUser (userId = "") {
  const user = await getUserById(userId)
  if (user == null) throw miExcepcionUsuario;
  return Number(user.useComId);
}
export function GetPurchaseId (userId = "") {
  return 1;
}
export function GetCurrentUserId (sessionId) {
  const currentSession = GetSessionById(sessionId)
  return currentSession.userId;
}
export const MessageError = (message, ErrorNumber = 403) => {
  return {
    ErrorNumber: 403,
    error: { message }
  }
}
