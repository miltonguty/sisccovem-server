/*** CONTROLLER*/
import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";

export const ProvidersList = async (currentUserId) => {
    try {
        const comId = GetEmpresaIdByUser(currentUserId)
        const filter = {
            where: {
                prvComId: comId,
                prvDeleted: FALSE,
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let providers = await prisma.providers.findMany(filter)
        let totalRecords = 0


        const inputTemplate = './src/reports/ProvidersList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-ProvidersList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Providers",
            records: providers,
            totalRecords: providers.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result


    } catch (err) {
        console.log(err)

    }
};
