import express, { json } from 'express';
import { PurchasesList } from '../../../controller/Reports/purchases.js';

var router = express.Router();
router.get('/reports/Purchases', async function(req, res) {
    try {
        const result = await PurchasesList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;