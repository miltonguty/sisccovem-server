import express, { json } from 'express';
import { ProvidersList } from '../../../controller/Reports/providers.js';

var router = express.Router();

router.get('/reports/providers', async function(req, res) {
    try {
        const result = await ProvidersList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});

export default router;