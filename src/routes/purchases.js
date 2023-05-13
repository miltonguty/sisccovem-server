import express, { json } from 'express';
import { add, get, getById, remove } from '../controller/Purchases.js';
var router = express.Router();
router.get('/Purchases', async function(req, res) {
    try {
        const result = await get(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Purchases', async function(req, res) {
    try {
        const result = await add(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Purchases', async function(req, res) {
    try {
        const result = await update(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Purchases/:purId', async function(req, res) {
    try {
        const result = await getById(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Purchases/:purId', async function(req, res) {
    try {
        const result = await remove(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;