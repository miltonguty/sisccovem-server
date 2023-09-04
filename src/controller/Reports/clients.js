/*** CONTROLLER*/
import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";
export const ClientsList = async (currentUserId) => {
    try {
        const comId = GetEmpresaIdByUser(currentUserId)
        const filter = {
            where: {
                rutComId: comId,
                rutDeleted: FALSE
            },
            include: {
                clients: true
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let rutes = await prisma.rutes.findMany(filter)
        let totalRecords = 0
        rutes = rutes.map((item) => {
            return ({
                ...item,
                clients: item.clients.map((cl, index) => {
                    totalRecords++
                    return { n: totalRecords, ...cl }
                })
            }
            )
        })
        const inputTemplate = './src/reports/ClientsList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-clientsList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de clientes",
            records: rutes,
            totalRecords: totalRecords
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result

    } catch (err) {
        console.log(err)

    }
};
