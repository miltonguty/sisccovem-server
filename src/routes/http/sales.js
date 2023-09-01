import express, { json } from 'express';
import { AddDetails, CloseNoteSales, CreateNoteSales, DeleteNoteSales, DeleteNoteSalesById, GetOrCreateNoteSales, GetSales, GetSalesById, RemoveDetails, saveDescount, setClient } from '../../controller/Sales.js';
var router = express.Router();
router.get('/sales', async function(req, res) {
    try {
        const result = await GetSales();
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/sales/CurrenNote', async function(req, res) {
    try {
        const result = await GetOrCreateNoteSales(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/sales/:salesId', async function(req, res) {
    try {
        const { salesId } = req.params
        const result = await DeleteNoteSalesById(salesId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
})
router.delete('/Sales/CurrenNote', async function(req, res) {
    try {
        const result = await DeleteNoteSales()
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.post('/Sales/CurrenNote', async function(req, res) {
    try {
        const { clientId } = req.body
        const result = await CreateNoteSales(clientId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.put('/Sales/CurrenNote', async function(req, res) {
    try {
        const result = await CloseNoteSales()
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
router.delete('/Sales/details/:sadId', async function(req, res) {
    try {

        const { sadId } = req.params;
        const result = await RemoveDetails(sadId);
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
        const { salId } = req.params
        const result = await GetSalesById(salId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.put('/Sales/saveDescount', async function(req, res) {
    try {
        const { percentage } = req.body
        const result = await saveDescount(percentage)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;