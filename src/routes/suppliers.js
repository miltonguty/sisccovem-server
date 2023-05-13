import express, { json } from 'express';
import { add, get, getById, remove } from '../controller/Suppliers.js';
var router = express.Router();
router.get('/Suppliers', async function(req, res) {
    try {
        const result = await get(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Suppliers', async function(req, res) {
    try {
        const result = await add(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Suppliers', async function(req, res) {
    try {
        const result = await update(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Suppliers/:supId', async function(req, res) {
    try {
        const result = await getById(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Suppliers/:supId', async function(req, res) {
    try {
        const result = await remove(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;