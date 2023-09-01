import express, { json } from 'express';
import { rptNoteSalesById } from '../../../controller/Reports/sales.js';

var router = express.Router();

router.get('/reports/sales/NoteSales/:salesId', async function(req, res) {
    try {
        const { salesId } = req.params
        const result = await rptNoteSalesById(salesId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;