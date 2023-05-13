import express, { json } from 'express';
import cors from 'cors'

import routes from './routes/index.js'

const app = express();

app.use(json())

const PORT = process.env.PORT || 4000;
var allowedOrigins = ['http://localhost:3000',
    'http://yourapp.com'
];
app.use(cors({
    origin: function(origin, callback) {
        // allow requests with no origin 
        // (like mobile apps or curl requests)
        if (!origin) return callback(null, true);
        if (allowedOrigins.indexOf(origin) === -1) {
            var msg = 'The CORS policy for this site does not ' +
                'allow access from the specified Origin.';
            return callback(new Error(msg), false);
        }
        return callback(null, true);
    }
}));
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


app.listen(PORT, () => console.log(`App listening at port ${ PORT }`));