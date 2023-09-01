/*** CONTROLLER*/
import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";

export const ProductsList = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const filter = {
            where: {
                proComId: comId,
                proDeleted: FALSE,
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let products = await prisma.products.findMany(filter)
        let totalRecords = 0


        const inputTemplate = './src/reports/ProductsList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-ProductsList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de products",
            records: products,
            totalRecords: products.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result


    } catch (err) {
        console.log(err)

    }
};
