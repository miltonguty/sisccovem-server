import express from 'express'
import routes from './routes/http/index.js'
import bodyParser from 'body-parser'
import { Authorization } from './sessions.js'
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

    app.use('/api/', routes.userRoute)
    app.use('/api/', routes.activesRoute)
    app.use('/api/', routes.paymentsRoute)
    app.use('/pdf', routes.RptClientsRoute)
    app.use('/pdf', routes.RptEmployeesRoute)
    app.use('/pdf', routes.RptProductsRoute)
    app.use('/pdf', routes.RptProvidersRoute)
    app.use('/pdf', routes.RptPurchasesRoute)
    app.use('/pdf', routes.RptSalesRoute)
    app.use('/pdf', routes.RptUserRoute)
    app.use('/pdf', routes.RptactivesRoute)
    app.get('/*', async (req, res) => {

        res.json({ status: true, message: "**********************SISCCOVEM*************************" })
    })





}
