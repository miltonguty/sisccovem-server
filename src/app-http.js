import express from 'express'
import routes from './routes/http/index.js'
import bodyParser from 'body-parser'
import { Authorization } from './sessions.js'
import path from 'path'

export const appHttp = (app) => {

    app.use(express.static('public'))
    app.use(bodyParser.json())



    //    app.use(session())
    app.use('/api/', routes.sessionRoute) //Login

    app.use('/api/', Authorization)

    app.use('/api/', routes.ClientsRoute)
    app.use('/api/', routes.EmpresasRoute)
    app.use('/api/', routes.EmployeesRoute)
    app.use('/api/', routes.ProductsRoute)
    app.use('/api/', routes.PurchasesRoute)
    app.use('/api/', routes.ProvidersRoute)
    app.use('/api/', routes.salesRoute)
    app.use('/api/', routes.sectionsRoute)

    app.use('/api/', routes.userRoute)
    app.use('/api/', routes.activesRoute)
    app.use('/api/', routes.paymentsRoute)
    app.use('/report/', routes.RptClientsRoute)
    app.use('/report/', routes.RptEmployeesRoute)
    app.use('/report/', routes.RptProductsRoute)
    app.use('/report/', routes.RptProvidersRoute)
    app.use('/report/', routes.RptPurchasesRoute)
    app.use('/report/', routes.RptSalesRoute)
    app.use('/report/', routes.RptUserRoute)
    app.use('/report/', routes.RptactivesRoute)
    // Todas las peticiones GET que no hayamos manejado en las líneas anteriores retornaran nuestro app React





}
