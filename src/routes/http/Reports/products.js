import express, { json } from 'express';
import { GetCurrentUserId } from '../../../lib/utils.js';

var router = express.Router();

router.get('/reports/products', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ProductsList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});

export default router;