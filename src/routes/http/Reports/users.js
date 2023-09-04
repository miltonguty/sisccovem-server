import express, { json } from 'express';
import { UsersList } from '../../../controller/Reports/users.js';
import { GetCurrentUserId } from '../../../lib/utils.js';
var router = express.Router();

router.get('/reports/users', async function(req, res) {
    try {
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await UsersList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;