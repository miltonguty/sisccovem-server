import express, { json } from 'express';
import { ProvidersList } from '../../../controller/Reports/providers.js';
import { GetCurrentUserId } from '../../../lib/utils.js';

var router = express.Router();

router.get('/reports/providers', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ProvidersList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});

export default router;