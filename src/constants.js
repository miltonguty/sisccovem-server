export const SOCKET_KEY = {
    CONNECTION: 'connection',
    DISCONNECT: "disconnect",
    LOGOUT: {
        LOGOUT: 'logout',
        LOGOUT_SUCCESS: "logoutSuccess",
    },
    LOGIN: {
        LOGIN: "login",
        SUCCESS: "loginSuccess",
        ERROR: "loginError"
    },
    SESSION: {
        GET_SESSION: "getSession",
        WITHOUT_SESSION: "witoutSession",
    },
    CLIENTS: {
        GET_CLIENTS: "GetClients",
        CREATE_CLIENT: "CreateClient",
        UPDATE_CLIENT: "UpdateClient",
        GET_CLIENT_BY_ID: "GetClientById",
        DELETE_CLIENT: "DeleteClient"
    },
    COMPANY: {
        GET_COMPANYS: "GetCompanys",
        CREATE_COMPANY: "CreateCompany",
        UPDATE_COMPANY: "UpdateCompany",
        GET_COMPANY_BY_ID: "GetCompanyById",
        DELETE_COMPANY: "DeleteCompany"
    },
    EMPLOYEE: {
        GET_EMPLOYEES: "GetEmployees",
        CREATE_EMPLOYEE: "CreateEmployee",
        UPDATE_EMPLOYEE: "UpdateEmployee",
        GET_EMPLOYEE_BY_ID: "GetEmployeeById",
        DELETE_EMPLOYEE: "DeleteEmployee"
    },
    PRODUCT: {
        GET_PRODUCTS: "GetProducts",
        CREATE_PRODUCT: "CreateProduct",
        UPDATE_PRODUCT: "UpdateProduct",
        GET_PRODUCT_BY_ID: "GetProductById",
        DELETE_PRODUCT: "DeleteProduct"
    },
    PURCHASES: {
        GET_PURCHASES: "GetPurchases",
        CREATE_PURCHASE: "CreatePurchase",
        UPDATE_PURCHASE: "UpdatePurchase",
        GET_PURCHASE_BY_ID: "GetPurchaseById",
        DELETE_PURCHASE: "DeletePurchase"
    },
    SUPLIERS: {
        GET_SUPLIERS: "GetSuppliers",
        CREATE_SUPLIERS: "CreateSupplier",
        UPDATE_SUPLIERS: "UpdateSupplier",
        GET_SUPLIERS_BY_ID: "GetSupplierById",
        DELETE_SUPLIERS: "DeleteSupplier"
    },

}
export const ERROR_MESSASGE_LOGIN = "user and Password invalid"

