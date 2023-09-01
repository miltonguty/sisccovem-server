import express, { json } from 'express';
import { UsersList } from '../../../controller/Reports/users.js';
var router = express.Router();

router.get('/reports/users', async function(req, res) {
    try {
        const result = await UsersList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;