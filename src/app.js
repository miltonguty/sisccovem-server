import express, { json } from 'express';
import cors from 'cors'

import ClientsRoute from './rutes/Clients'
import CompanysRoute from './rutes/Companys'
import EmployeesRoute from './rutes/Employees'
import ProductsRoute from './rutes/Products'
import PurchasesRoute from './rutes/Purchases'
import ReportsRoute from './rutes/reports'
import SuppliersRoute from './rutes/Suppliers'
import salesRoute from './rutes/sales'

const app = express();

app.use(json())

const PORT = process.env.PORT || 4000;
var allowedOrigins = ['http://localhost:3000',
    'http://yourapp.com'
];
app.use(cors({
    origin: function (origin, callback)
    {
        // allow requests with no origin 
        // (like mobile apps or curl requests)
        if (!origin) return callback(null, true);
        if (allowedOrigins.indexOf(origin) === -1)
        {
            var msg = 'The CORS policy for this site does not ' +
                'allow access from the specified Origin.';
            return callback(new Error(msg), false);
        }
        return callback(null, true);
    }
}));
app.use(express.static('public'));
app.get('/', async (req, res) =>
{
    res.json({ status: true, message: "**********************SISCCOVEM*************************" })
});
app.use('/api/', ClientsRoute);
app.use('/api/', CompanysRoute);
app.use('/api/', EmployeesRoute);
app.use('/api/', ProductsRoute);
app.use('/api/', PurchasesRoute);
app.use('/api/', ReportsRoute);
app.use('/api/', SuppliersRoute);
app.use('/api/', salesRoute);


app.listen(PORT, () => console.log(`App listening at port ${ PORT }`));