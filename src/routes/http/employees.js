import express, { json } from 'express';
import { add, get, getById, remove, update } from '../../controller/Employees.js';
import { SetFilterEmployee } from '../../lib/Filters.js';
var router = express.Router();
router.get('/Employees', async function(req, res) {
    try {
        const filter = SetFilterEmployee(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Employees', async function(req, res) {
    try {
        const { firstName, lastName, email, phone, salary } = req.body;
        const result = await add({ firstName, lastName, email, phone, salary });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Employees/:id', async function(req, res) {
    try {
        const { id } = req.params
        const { firstName, lastName, email, phone, salary } = req.body;
        const result = await update({ id, firstName, lastName, email, phone, salary });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Employees/:empId', async function(req, res) {
    try {
        const { empId } = req.params
        const result = await getById(empId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Employees/:empId', async function(req, res) {
    try {
        const { empId } = req.params
        const result = await remove(empId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;