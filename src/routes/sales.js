import express, { json } from 'express';
import { AddDetails, CloseNoteSales,  GetOrCreateNoteSales, RemoveDetails } from '../controller/Sales.js';
var router = express.Router();
router.get('/Sales', async function(req, res) {
    try {
        const result = await GetOrCreateNoteSales(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Sales', async function(req, res) {
    try {
        const result = await AddDetails(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Sales', async function(req, res) {
    try {
        const result = await RemoveDetails(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Sales', async function(req, res) {
    try {
        const result = await CloseNoteSales(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Sales/:salId', async function(req, res) {
    try {
        const result = await getById(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

export default router;