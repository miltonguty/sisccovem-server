import express from 'express';
import { add, asignItem, get, getActivesFree, getById, remove, update } from '../../controller/actives.js';
import { SetFilterActives } from '../../lib/Filters.js';

var router = express.Router();

router.get('/actives', async function(req, res) {
    try {
        const filter = SetFilterActives(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get("/actives/itemsFree", async function(req, res) {
    try {
        const filter = SetFilterActives(req.query)
        const result = await getActivesFree(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

})
router.put('/actives/asingItem', async function(req, res) {
    try {
        const { clientId, activeId } = req.body;

        const result = await asignItem({ clientId, activeId });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/actives', async function(req, res) {
    try {
        const { codigo, description } = req.body;
        const result = await add({ codigo, description });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/actives/:id', async function(req, res) {
    try {

        const { id } = req.params;
        const { codigo, description } = req.body;
        const result = await update({ id, codigo, description });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/actives/:actId', async function(req, res) {
    try {
        const { actId } = req.params;
        const result = await getById(actId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/actives/:actId', async function(req, res) {
    try {
        const { actId } = req.params;
        const result = await remove(actId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;