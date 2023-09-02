import express, { json } from 'express';
import {
    AddDetails, CloseNoteSales, CreateNoteSales, DeleteNoteSales, DeleteNoteSalesById,
    GetOrCreateNoteSales, GetSales, GetSalesById, RemoveDetails, saveDescount, setClient
} from '../../controller/Sales.js';
import { GetCurrentUserId } from '../../lib/utils.js';
var router = express.Router();
router.get('/sales', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await GetSales(currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/sales/CurrenNote', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await GetOrCreateNoteSales(currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/sales/:salesId', async function(req, res) {
    try {
        const { salesId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await DeleteNoteSalesById(salesId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
})
router.delete('/Sales/CurrenNote', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await DeleteNoteSales(currentUserId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.post('/Sales/CurrenNote', async function(req, res) {
    try {
        const { clientId } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await CreateNoteSales(clientId, currentUserId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.put('/Sales/CurrenNote', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await CloseNoteSales(currentUserId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});



router.post('/Sales/details', async function(req, res) {
    try {
        const { proId, count } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await AddDetails(proId, count, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Sales/details/:sadId', async function(req, res) {
    try {

        const { sadId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await RemoveDetails(sadId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.put('/Sales/client', async function(req, res) {
    try {
        const { clientId } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await setClient(clientId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Sales/:salId', async function(req, res) {
    try {
        const { salId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await GetSalesById(salId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.put('/Sales/saveDescount', async function(req, res) {
    try {
        const { percentage } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await saveDescount(percentage, currentUserId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;