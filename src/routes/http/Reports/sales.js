import express, { json } from 'express';
import { rptNoteSalesById } from '../../../controller/Reports/sales.js';
import { GetCurrentUserId } from '../../../lib/utils.js';

var router = express.Router();

router.get('/pdf/:sessionId/sales/NoteSales/:salesId', async function(req, res) {
    try {
        const { sessionId, salesId } = req.params
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await rptNoteSalesById(salesId, currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;