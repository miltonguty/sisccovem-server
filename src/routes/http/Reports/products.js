import express, { json } from 'express';
import { GetCurrentUserId } from '../../../lib/utils.js';
import { ProductsList } from '../../../controller/Reports/products.js';

var router = express.Router();

router.get('/pdf/:sessionId/products', async function(req, res) {
    try {
        const { sessionId } = req.params
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ProductsList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});

export default router;