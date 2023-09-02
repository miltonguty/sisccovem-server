import express from 'express';
import { add, asignItem, get, getActivesFree, getById, remove, update } from '../../controller/actives.js';
import { SetFilterActives } from '../../lib/Filters.js';
import { GetSessionById } from '../../sessions.js';
import { GetCurrentUserId } from '../../lib/utils.js';

var router = express.Router();

router.get('/actives', async function(req, res) {
    try {
        const filter = SetFilterActives(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await get(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get("/actives/itemsFree", async function(req, res) {
    try {
        const filter = SetFilterActives(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getActivesFree(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

})
router.put('/actives/asingItem', async function(req, res) {
    try {
        const { clientId, activeId } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await asignItem({ clientId, activeId }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/actives', async function(req, res) {
    try {
        const { codigo, description } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add({ codigo, description }, currentUserId);
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
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ id, codigo, description }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/actives/:actId', async function(req, res) {
    try {
        const { actId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(actId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/actives/:actId', async function(req, res) {
    try {
        const { actId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(actId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;