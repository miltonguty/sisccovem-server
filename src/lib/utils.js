export function makeSerializable (o) {
  return JSON.parse(JSON.stringify(o));
}
export function GetEmpresaIdByUser (userId = "") {
  return 1;
}
export function GetPurchaseId (userId = "") {
  return 1;
}
export function GetCurrentUserId () {
  return 1;
}
export const MessageError = (message, ErrorNumber = 403) => {
  return {
    ErrorNumber: 403,
    error: { message }
  }
}
