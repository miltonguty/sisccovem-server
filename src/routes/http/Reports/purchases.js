import express, { json } from 'express';
import { NotePurchase, PurchasesList } from '../../../controller/Reports/purchases.js';
import { GetCurrentUserId } from '../../../lib/utils.js';

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
router.get('/reports/purchases/NotePurchase/:purId', async function(req, res) {
    try {
        const { purId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await NotePurchase(purId,currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;