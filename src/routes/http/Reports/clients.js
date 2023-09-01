import express, { json } from 'express';
import { ClientsList } from '../../../controller/Reports/clients.js';

var router = express.Router();
router.get('/reports/clients', async function(req, res) {
    try {
        const result = await ClientsList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;