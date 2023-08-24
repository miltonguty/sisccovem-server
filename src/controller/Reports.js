/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import pdfCreator from "../lib/pdfCreator.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
import { GetCurrentNoteSalesByUser } from "./Sales.js";
export const ClientsList = async () => {
    try {
        const comId = GetEmpresaIdByUser()
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
export const EmployeesList = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const filter = {
            where: {
                empComId: comId,
                empDeleted: FALSE
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let employees = await prisma.employees.findMany(filter)


        const inputTemplate = './src/reports/EmployeesList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-EmployeesList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Empleados",
            records: employees,
            totalRecords: employees.length
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result

    } catch (err) {
        console.log(err)

    }
};
export const ProductsList = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const filter = {
            where: {
                secComId: comId,
                secDeleted: FALSE
            },
            include: {
                products: true
            }
        }
        const company = await prisma.companys.findFirst(comId)
        let sections = await prisma.sections.findMany(filter)
        let totalRecords = 0
        sections = sections.map((item) => {
            return ({
                ...item,
                products: item.products.map((prod) => {
                    totalRecords++
                    return { n: totalRecords, ...prod }
                })
            }
            )
        })
        const inputTemplate = './src/reports/ProductsList.html'
        const outputPdf = './src/reports/tmp/' + comId + '-ProductsList.pdf'
        const headerTemplate = '<div class="header"> <div class="header-title">' + company.comName + '</div><div class="header-address">' + company.comAddress + '</div><div class="header-phones">' + company.comPhone + '</div></div>'
        const footerTemplate = '<span style="color: #444;">{{page}}</span>/<span>{{pages}}</span>' // fallback value
        let datas = {
            title: "Lista de Productos",
            records: sections,
            totalRecords: totalRecords
        }
        const result = await pdfCreator(inputTemplate, outputPdf, headerTemplate, footerTemplate, datas)
        return result

    } catch (err) {
        console.log(err)

    }
};
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
export const NoteSales = async () => {
    try {
        const comId = GetEmpresaIdByUser()
        const currentSalesNote = await GetCurrentNoteSalesByUser()

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