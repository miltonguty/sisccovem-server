import express, { json } from 'express';
import {
    AddDetails, CreateNoteSales, DeleteNoteSalesById,
    GetSales, GetSalesById, RemoveDetails
} from '../../controller/Sales.js';
import { GetCurrentUserId, GetEmpresaIdByUser } from '../../lib/utils.js';
import { add } from '../../controller/payments.js';
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
router.get('/sales/:salesId', async function(req, res) {
    try {
        const { salesId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const comId = await GetEmpresaIdByUser(currentUserId)
        const result = await GetSalesById(salesId, currentUserId, comId);
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

router.post('/Sales', async function(req, res) {
    try {
        const { note } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const comId = await GetEmpresaIdByUser(currentUserId)
        const result = await CreateNoteSales(note, currentUserId, comId)
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





export default router;