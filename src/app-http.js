import express from 'express'
import routes from './routes/http/index.js'
export const appHttp = (app, session) => {
    app.use(express.static('public'));

    app.get('/', async (req, res) => {
        res.json({ status: true, message: "**********************SISCCOVEM*************************" })
    });


    app.use('/api/', routes.ClientsRoute);
    app.use('/api/', routes.CompanysRoute);
    app.use('/api/', routes.EmployeesRoute);
    app.use('/api/', routes.ProductsRoute);
    app.use('/api/', routes.PurchasesRoute);
    app.use('/api/', routes.ReportsRoute);
    app.use('/api/', routes.SuppliersRoute);
    app.use('/api/', routes.salesRoute);



}
