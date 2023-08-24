import express from 'express';
import { add, get, getById, remove, update } from '../../controller/Secctions.js';
import { SetFilterSections } from '../../lib/Filters.js';

var router = express.Router();

router.get('/Secctions', async function(req, res) {
    try {
        const filter = SetFilterSections(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.post('/Secctions', async function(req, res) {
    try {
        const { codigo, description } = req.body;
        const result = await add({ codigo, description });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Secctions/:id', async function(req, res) {
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
router.get('/Secctions/:secId', async function(req, res) {
    try {
        const { secId } = req.params;
        const result = await getById(secId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Secctions/:secId', async function(req, res) {
    try {
        const { secId } = req.params;
        const result = await remove(secId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;