import express, { json } from 'express';
import { add, get, getById, remove, addDetails } from '../../controller/Purchases.js';
import { SetFilterPurchase } from '../../lib/Filters.js';
import { GetCurrentUserId } from '../../lib/utils.js';
var router = express.Router();
router.get('/Purchases', async function(req, res) {
    try {
        const filter = SetFilterPurchase(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Purchases/details', async function(req, res) {
    try {
        const { purchaseId, prodId, price, description, count } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await addDetails({ purchaseId, prodId, price, description, count }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Purchases', async function(req, res) {
    try {
        const { providerId } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add(providerId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Purchases/:purId', async function(req, res) {
    try {
        const { purId } = req.params;
        const { providerId } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ purId, providerId }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Purchases/:purId', async function(req, res) {
    try {
        const { purId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(purId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Purchases/:purId', async function(req, res) {
    try {
        const { purId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(purId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;