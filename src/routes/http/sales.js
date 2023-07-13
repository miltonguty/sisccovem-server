import express, { json } from 'express';
import { AddDetails, CloseNoteSales, GetOrCreateNoteSales, RemoveDetails, setClient } from '../../controller/Sales.js';
var router = express.Router();
router.get('/sales/CurrenNote', async function(req, res) {
    try {
        const result = await GetOrCreateNoteSales(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.post('/Sales/details', async function(req, res) {
    try {
        const { proId, count } = req.body
        const result = await AddDetails(proId, count);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Sales/details/:desId', async function(req, res) {
    try {

        const { sadId } = req.params;
        const result = await RemoveDetails(sadId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Sales/CloseNoteSales', async function(req, res) {
    try {
        const result = await CloseNoteSales(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Sales/client', async function(req, res) {
    try {
        const { clientId } = req.body
        const result = await setClient(clientId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Sales/:salId', async function(req, res) {
    try {
        //const result = await getById(req, res);
        res.status(200).json(null);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

export default router;