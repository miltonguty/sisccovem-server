import express, { json } from 'express';
import { add, get, getById, remove } from '../../controller/Products.js';
import { SetFilterProduct } from '../../lib/Filters.js';
import { GetCurrentUserId } from '../../lib/utils.js';
var router = express.Router();
router.get('/Products', async function(req, res) {
    try {

        const filter = SetFilterProduct(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await get(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Products', async function(req, res) {
    try {
        const { description, priceSales, pricePurchase, image, sectionId } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add({ description, priceSales, pricePurchase, image, sectionId }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Products', async function(req, res) {
    try {
        const { id, description, priceSales, pricePurchase, image, supId, stock } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ id, description, priceSales, pricePurchase, image, supId, stock }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Products/:proId', async function(req, res) {
    try {
        const { proId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(proId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Products/:proId', async function(req, res) {
    try {
        const { proId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(proId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;