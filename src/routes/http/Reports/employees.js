import express, { json } from 'express';
import { EmployeesList } from '../../../controller/Reports/employees.js';
import { GetCurrentUserId } from '../../../lib/utils.js';

var router = express.Router();

router.get('/pdf/:sessionId/employees', async function(req, res) {
    try {
        const { sessionId } = req.params
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await EmployeesList(currentUserId);
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;