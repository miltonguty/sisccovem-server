import express from 'express';
import { add, getPaymentsBySalesId, remove } from '../../controller/payments.js';
import { GetCurrentUserId } from '../../lib/utils.js';

var router = express.Router();
router.post('/payments', async function(req, res) {
    try {
        const { noteSalesId, mount } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add({ noteSalesId, mount }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.get('/payments/BySalesId/:salId', async function(req, res) {
    try {
        const { salId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getPaymentsBySalesId(salId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/payments/:payId', async function(req, res) {
    try {
        const { payId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(payId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;