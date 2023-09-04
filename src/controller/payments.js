/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import {  GetEmpresaIdByUser } from "../lib/utils.js";
import { v4 as uuidv4 } from 'uuid';
export const add = async ({ noteSalesId, mount }, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    const payment = await prisma.payments.create({
        data: {
            payKey: uuidv4(),
            paySalId: Number(noteSalesId),
            payMount: Number(mount),
            payComId: comId
        }
    })
    const pay = await getById(payment.payKey)
    return pay
}
export const getById = async (id, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    let payment = await prisma.payments.findFirst({ where: { payKey: id, payComId: comId } })
    payment = {
        id: payment.payId,
        salId: payment.paySalId,
        date: payment.payDate,
        mount: payment.payMount,
        payKey: payment.payKey
    }
    return payment
}
export const getPaymentsBySalesId = async (salesId, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    let payments = await prisma.payments.findMany({
        where: { paySalId: Number(salesId), payDeleted: FALSE, payComId: comId }
    })
    payments = payments.map(payment => {
        return {
            id: payment.payId,
            salId: payment.paySalId,
            date: payment.payDate,
            mount: payment.payMount,
            payKey: payment.payKey
        }
    })

    return payments
}
export const remove = async (id, currentUserId) => {
    const comId = await GetEmpresaIdByUser(currentUserId)
    let payment = await prisma.payments.updateMany({
        where: { payKey: id, payComId: comId }
    })
    payment = await getById(id, currentUserId)
    return payment
}