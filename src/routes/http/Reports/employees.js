import express, { json } from 'express';
import { EmployeesList } from '../../../controller/Reports/employees.js';

var router = express.Router();

router.get('/reports/employees', async function(req, res) {
    try {
        const result = await EmployeesList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});
export default router;