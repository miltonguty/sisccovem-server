import express from 'express';
import { add, get, getById, remove, update } from '../../controller/Rutes.js';
import { SetFilterRutes } from '../../lib/Filters.js';

var router = express.Router();

router.get('/rutes', async function(req, res) {
    try {
        const filter = SetFilterRutes(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.post('/rutes', async function(req, res) {
    try {
        const { codigo, description } = req.body;
        const result = await add({ codigo, description });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/rutes/:id', async function(req, res) {
    try {

        const { id } = req.params;
        const { name, description } = req.body;
        const result = await update({ id, name, description });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/rutes/:rutId', async function(req, res) {
    try {
        const { rutId } = req.params;
        const result = await getById(rutId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/rutes/:rutId', async function(req, res) {
    try {
        const { rutId } = req.params;
        const result = await remove(rutId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;