/*** CONTROLLER*/
import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";
import { GetSalesById } from "../Sales.js";
export const rptNoteSalesById = async (id, currentUserId) => {
    try {
        const comId = GetEmpresaIdByUser(currentUserId)
        const currentSalesNote = await GetSalesById(id, currentUserId)
        const company = await prisma.companys.findFirst(comId)
        const inputTemplate = './src/reports/NotedeVenta.html'
        const outputPdf = './src/reports/tmp/' + comId + '-NotedeVenta-' + currentSalesNote.id + '.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        console.log(currentSalesNote)
        let datas = {
            title: "Nota de venta",
            records: currentSalesNote,
            totalRecords: currentSalesNote.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result

    } catch (err) {
        console.log(err)

    }
};
