/*** CONTROLLER*/
import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";

export const PurchasesList = async () => {
    try {
        const comId = GetEmpresaIdByUser(currentUserId)
        const filter = {
            where: {
                purComId: comId,
                purDeleted: FALSE,
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let purchases = await prisma.purchases.findMany(filter)
        let totalRecords = 0


        const inputTemplate = './src/reports/PurchasesList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-PurchasesList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Usuarios",
            records: users,
            totalRecords: users.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result


    } catch (err) {
        console.log(err)

    }
};
export const NotePurchase = async (purId, currentUserId) => {
    try {
        const comId = GetEmpresaIdByUser(currentUserId)
        const filter = {
            where: {
                purComId: comId,
                purDeleted: FALSE,
                purId: purId,
            },
            include: {
                purchasesdetails: true
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let purchase = await prisma.purchases.findFirst(filter)
        let totalRecords = 0


        const inputTemplate = './src/reports/NotePurchase.html'
        const outputPdf = './src/reports/tmp/' + comId + '-NotePurchase-' + purId + '.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Note Purchases",
            records: purchase,
            totalRecords: purchase.purchasesdetails.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result


    } catch (err) {
        console.log(err)

    }
};