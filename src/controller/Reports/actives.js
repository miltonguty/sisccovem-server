/*** CONTROLLER*/



import { GetEmpresaIdByUser } from "../../lib/utils.js";
import { FALSE } from "../../constants.js";
import prisma from "../../lib/prisma.js";
import pdfCreator from "../../lib/pdfCreator.js";
export const ActivesNoAssigned = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const filter = {
            where: {
                actComId: comId,
                actDeleted: FALSE,
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let actives = await prisma.actives.findMany(filter)
        let totalRecords = 0
        actives = actives.filter((item) => item.actCliId == null)

        const inputTemplate = './src/reports/ActivesList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-ActivesList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Activos No Asignados",
            records: actives,
            totalRecords: actives.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result

    } catch (err) {
        console.log(err)

    }
};
export const ActivesAssigned = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const filter = {
            where: {
                cliComId: comId,
                cliDeleted: FALSE,

            },
            include: {
                actives: {
                    where: {
                        actDeleted: FALSE
                    }
                }
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let clients = await prisma.clients.findMany(filter)
        let totalRecords = 0
        clients = clients.filter((item) => item.actives.length > 0)
        clients = clients.map((item) => {
            return ({
                ...item,
                actives: item.actives.map((active) => {
                    totalRecords++
                    return { n: totalRecords, ...active }
                })
            })
        })
        const inputTemplate = './src/reports/ActivesAssignedList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-ActivesAssignedList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Activos Asignados",
            records: clients,
            totalRecords: totalRecords
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result

    } catch (err) {
        console.log(err)

    }
};
export const ActivesList = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const filter = {
            where: {
                actComId: comId,
                actDeleted: FALSE,

            }
        }
        const company = await prisma.companys.findFirst(comId)
        let actives = await prisma.actives.findMany(filter)
        let totalRecords = 0


        const inputTemplate = './src/reports/ActivesList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-ActivesList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Activos",
            records: actives,
            totalRecords: actives.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result


    } catch (err) {
        console.log(err)

    }
};
