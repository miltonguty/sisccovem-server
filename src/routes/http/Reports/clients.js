import express, { json } from 'express';
import { ClientsList } from '../../../controller/Reports/clients.js';
import { GetCurrentUserId } from '../../../lib/utils.js';

var router = express.Router();
router.get('/pdf/:sessionId/clients', async function(req, res) {
    try {
        const { sessionId } = req.params
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ClientsList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;