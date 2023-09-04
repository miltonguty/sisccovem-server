import { FALSE, TRUE } from "../constants.js"
import prisma from "../lib/prisma.js"
import { GetEmpresaIdByUser } from "../lib/utils.js"
import { v4 as uuidv4 } from 'uuid';

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
            id: userResult[0].useId
        }
    }
    return null
}
export const get = async ({ userName, email, pageSize, page }, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    let filter = {
        skip: Number(page * pageSize),
        take: Number(pageSize),
        where: {
            useComId: comId,
            useDeleted: FALSE,
            useComId: comId
        }, include: { companys: true }
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
        email: item.useEmail,
        company: item.companys.comName

    }))
    return result

};
export const getUserById = async (id) => {
    const user = await prisma.users.findFirst({ where: { useId: id } })
    return user
}
export const getById = async (key, currentUserId) => {
    const ignoreDeleted = FALSE
    const comId = await GetEmpresaIdByUser(currentUserId)

    let result = null
    if (key) {
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
export const add = async (user, currentUserId) => {
    const company = await prisma.companys.findFirst({ where: { comKey: user.company } })
    const userCreated = await prisma.users.create({
        data: {
            useKey: uuidv4(),
            useName: user.userName,
            usePassword: user.userName,
            useEmail: user.email,
            useComId: company.comId
        },
    });
    const userResult = await getById(userCreated.useKey, currentUserId)
    return userResult;

};
export const update = async ({ id, userName, email }, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    const userUpdate = await prisma.users.updateMany({
        where: { useKey: id, useComId: comId },
        data: {
            useName: userName,
            useEmail: email
        },
    });
    const userResult = await getById(id, currentUserId)
    return userResult
};
export const remove = async (useKey, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    const useentDelete = await prisma.users.updateMany({
        where: {
            useKey: useKey, useComId: comId
        }, data: {
            useDeleted: TRUE
        }
    });
    const userResult = await getById(useKey, currentUserId)
    return userResult;

};
