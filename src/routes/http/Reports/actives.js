import express, { json } from 'express';
import { ActivesAssigned, ActivesList, ActivesNoAssigned } from '../../../controller/Reports/actives.js';
import { GetCurrentUserId } from '../../../lib/utils.js';

var router = express.Router();

router.get('/reports/actives/assigned', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ActivesAssigned(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/actives/NoAssigned', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ActivesNoAssigned(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
router.get('/reports/actives', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await ActivesList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});

export default router;