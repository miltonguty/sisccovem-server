import { FALSE, TRUE } from "../constants.js"
import prisma from "../lib/prisma.js"
import { GetEmpresaIdByUser } from "../lib/utils.js"


export const login = async (userName, password) => {
    const userResult = await prisma.users.findMany({
        where: {
            useName: userName, usePassword: password
        },
        include: {
            companys: true
        }
    })
    if (userResult.length > 0) {
        
        return {
            
            name: userResult[0].useName,
            email: userResult[0].useEmail,
            company: {
                name: userResult[0].companys.comName,
                phone: userResult[0].companys.comPhone,
                address: userResult[0].companys.comAddress,
                id: userResult[0].companys.comKey
            },
            id: userResult[0].useKey
        }
    }
    return null
}
export const
    get = async ({ userName, email, pageSize, page }) => {
        const comId = GetEmpresaIdByUser()
        let filter = {
            skip: Number(page * pageSize),
            take: Number(pageSize),
            where: {
                useComId: comId,
                useDeleted: FALSE
            }
        }
        const orConditions = []
        if (userName) {
            orConditions.push(
                {
                    useName: {
                        contains: userName,
                    }
                })
        }
        if (email) {
            orConditions.push(
                {
                    useEmail: {
                        contains: email,
                    }
                })
        }
        if (orConditions.length > 0) {
            filter.where.OR = orConditions
        }
        const users = await prisma.users.findMany(filter);
        const result = users.map(item =>
        ({
            id: item.useKey,
            userName: item.useName,
            email: item.useEmail

        }))
        return result

    };
export const getById = async (key, ignoreDeleted = FALSE) => {


    let result = null
    if (key) {
        const comId = GetEmpresaIdByUser()
        let where = {}
        if (ignoreDeleted) {
            where = {
                useKey: key,
                useComId: comId
            }
        } else {
            where = {
                useKey: key,
                useComId: comId,
                useDeleted: FALSE
            }
        }
        const user = await prisma.users.findFirst({
            where: where,
        });
        result = {
            id: user.useKey,
            userName: user.useName,
            email: user.useEmail
        }
    }
    return result;


};
export const add = async (user) => {
    const comId = GetEmpresaIdByUser()
    const userCreated = await prisma.users.create({
        data: {
            useName: user.userName,
            usePassword: user.userName,
            useEmail: user.email,
            useComId: comId
        },
    });
    const userResult = await getById(userCreated.useKey)
    return userResult;

};
export const update = async ({ id, name, email }) => {
    const userUpdate = await prisma.users.updateMany({
        where: { useKey: id },
        data: {
            useName: name,
            useEmail: email
        },
    });
    const userResult = await getById(userUpdate.useKey)
    return userResult
};
export const remove = async (useKey) => {
    const comId = GetEmpresaIdByUser()
    const useentDelete = await prisma.users.updateMany({
        where: {
            useKey: useKey
        }, data: {
            useDeleted: TRUE
        }
    });
    const userResult = await getById(useKey, TRUE)
    return userResult;

};
