/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
import { v4 as uuidv4 } from 'uuid';
export const add = async ({ noteSalesId, mount }, currentUserId, comId) => {

    const sales = await prisma.sales.findFirst({ where: { salKey: noteSalesId } })
    const payment = await prisma.payments.create({
        data: {
            payKey: uuidv4(),
            paySalId: Number(sales.salId),
            payMount: Number(mount),
            payComId: comId
        }
    })
    const pay = await getById(payment.payKey, currentUserId, comId)
    return pay
}
export const getById = async (id, currentUserId, comId) => {
    let payment = await prisma.payments.findFirst({
        where: {
            payKey: id,
            payComId: comId,
            payDeleted: FALSE
        }
    })
    return {
        id: payment.payId,
        salId: payment.paySalId,
        date: payment.payDate,
        mount: payment.payMount,
        payKey: payment.payKey
    }

}
export const getPaymentsBySalesId = async (id, currentUserId, comId) => {
    const sales = await prisma.salesview.findFirst({
        where: {
            salKey: id,
            salComId: comId
        }
    })
    const client = await prisma.clientsview.findFirst({ where: { cliId: sales.salCliId } })
    let payments = await prisma.payments.findMany({
        where: {
            paySalId: Number(sales.salId),
            payDeleted: FALSE,
            payComId: comId
        }
    })
    payments = payments.map(payment => {
        return {
            id: payment.payKey,
            salId: payment.paySalId,
            date: payment.payDate,
            mount: payment.payMount

        }
    })
    const salesNote = {
        numberNote: sales.salId,
        id: sales.salKey,
        date: sales.salDate,
        totalPayment: sales.totalPayment,
        total: (Number(sales.total)).toFixed(2),
        descuento: sales.salDescuento,
        totalWithDesc: (Number(sales.totalWithDesc)).toFixed(2),
        totalDesc: (Number(sales.totalDesc)).toFixed(2),
        due: (Number(sales.due)).toFixed(2),
        client: {
            firstName: client.cliFirstName,
            lastName: client.cliLastName,
            id: client.cliKey,
            rute: client.rutName,
            deuda: client.deuda
        },
        payments: payments
    }
    return salesNote
}
export const remove = async (id, currentUserId, comId) => {

    let payment = await prisma.payments.updateMany({
        where: {
            payKey: id,
            payComId: comId
        },
        data: { payDeleted: TRUE }
    })
    payment = await prisma.payments.findFirst({
        where: {
            payKey: id, payComId: comId,
        }
    })
    return {
        id: payment.payId,
        salId: payment.paySalId,
        date: payment.payDate,
        mount: payment.payMount,
        payKey: payment.payKey
    }

}