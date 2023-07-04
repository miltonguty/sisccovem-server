import express, { json } from 'express';
import { add, get, getById, remove, update } from '../../controller/Company.js';
import { SetFilterCompany } from '../../lib/Filters.js';
var router = express.Router();
router.get('/companys', async function(req, res) {
    try {
        const filter = SetFilterCompany(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/companys', async function(req, res) {
    try {
        const { name, phone, address } = req.body
        const result = await add({ name, phone, address });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/companys/:id', async function(req, res) {
    try {
        const { id } = req.params
        const { name, phone, address } = req.body
        const result = await update({ id, name, phone, address });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/companys/:comId', async function(req, res) {
    try {
        const { comId } = req.params
        const result = await getById(comId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/companys/:comId', async function(req, res) {
    try {
        const result = await remove(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;