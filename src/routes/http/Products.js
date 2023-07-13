import express, { json } from 'express';
import { add, get, getById, remove } from '../../controller/Products.js';
import { SetFilterProduct } from '../../lib/Filters.js';
var router = express.Router();
router.get('/Products', async function(req, res) {
    try {
        const { description } = req.params
        const filter = SetFilterProduct({ description })
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Products', async function(req, res) {
    try {
        const { description, priceSales, pricePurchase, image, supId } = req.body;
        const result = await add({ description, priceSales, pricePurchase, image, supId });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Products', async function(req, res) {
    try {
        const { id, description, priceSales, pricePurchase, image, supId, stock } = req.body;
        const result = await update({ id, description, priceSales, pricePurchase, image, supId, stock });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Products/:proId', async function(req, res) {
    try {
        const result = await getById(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Products/:proId', async function(req, res) {
    try {
        const { proId } = req.params
        const result = await remove(proId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;