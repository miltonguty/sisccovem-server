export function SetFilterClients ({ page, pageSize, firstName, lastName, email, phone }) {

    const filter = {
        page: page ? page - 1 : 0,
        firstName, lastName, email, phone,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}
export function SetFilterCompany ({ page, pageSize, name, phone, address }) {

    const filter = {
        page: page ? page - 1 : 0,
        name, phone, address,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}
export function SetFilterEmployee ({ page, pageSize, firstName, lastName, email, phone, salary }) {

    const filter = {
        page: page ? page - 1 : 0,
        firstName, lastName, email, phone, salary,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}
export function SetFilterProduct ({ page, pageSize, description, priceSales, pricePurchase }) {
    const filter = {
        page: page ? page - 1 : 0,
        description, priceSales, pricePurchase,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}
export function SetFilterProviders ({ page, pageSize, name, phone, address }) {

    const filter = {
        page: page ? page - 1 : 0,
        name, phone, address,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}
export function SetFilterUsers ({ page, pageSize, userName, email }) {

    const filter = {
        page: page ? page - 1 : 0,
        userName, email,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}
export function SetFilterActives ({ page, pageSize, codigo, description, cliId }) {

    const filter = {
        page: page ? page - 1 : 0,
        codigo, description, cliId,
        pageSize: pageSize ? pageSize : Number.MAX_SAFE_INTEGER
    }
    return filter
}