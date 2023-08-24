import express, { json } from 'express';
import { ActivesAssigned, ActivesList, ActivesNoAssigned, ClientsList, EmployeesList, NoteSales, ProductsList } from '../../controller/Reports.js';
var router = express.Router();
router.get('/reports/clients', async function(req, res) {
    try {
        const result = await ClientsList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/NoteSales', async function(req, res) {
    try {
        const result = await NoteSales();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/products', async function(req, res) {
    try {
        const result = await ProductsList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/actives/assigned', async function(req, res) {
    try {
        const result = await ActivesAssigned();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/actives/NoAssigned', async function(req, res) {
    try {
        const result = await ActivesNoAssigned();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/actives', async function(req, res) {
    try {
        const result = await ActivesList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/employees', async function(req, res) {
    try {
        const result = await EmployeesList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;