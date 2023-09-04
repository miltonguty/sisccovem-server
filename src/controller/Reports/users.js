/*** CONTROLLER*/
import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";

export const UsersList = async (currentUserId) => {
    try {
        const comId = GetEmpresaIdByUser(currentUserId)
        const filter = {
            where: {
                useComId: comId,
                useDeleted: FALSE,
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let users = await prisma.users.findMany(filter)
        let totalRecords = 0


        const inputTemplate = './src/reports/UsersList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-UsersList.pdf'
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
