import express from 'express';
import { add, getPaymentsBySalesId, remove } from '../../controller/payments.js';

var router = express.Router();
router.post('/payments', async function(req, res) {
    try {
        const { noteSalesId, mount } = req.body;
        const result = await add( {noteSalesId, mount });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.get('/payments/BySalesId/:salId', async function(req, res) {
    try {
        const { salId } = req.params;
        const result = await getPaymentsBySalesId(salId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/payments/:payId', async function(req, res) {
    try {
        const { payId } = req.params;
        const result = await remove(payId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;