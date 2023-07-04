import express from 'express'
import routes from './routes/http/index.js'
import bodyParser from 'body-parser'
export const appHttp = (app) => {

    app.use(express.static('public'));
    app.use(bodyParser.json())
   

    app.get('/', async (req, res) => {
        res.json({ status: true, message: "**********************SISCCOVEM*************************" })
    });

    //    app.use(session())
    app.use('/api/', routes.ClientsRoute);
    app.use('/api/', routes.ClientsRoute);
    app.use('/api/', routes.EmpresasRoute);
    app.use('/api/', routes.EmployeesRoute);
    app.use('/api/', routes.ProductsRoute);
    app.use('/api/', routes.PurchasesRoute);
    app.use('/api/', routes.ReportsRoute);
    app.use('/api/', routes.SuppliersRoute);
    app.use('/api/', routes.salesRoute);



}
