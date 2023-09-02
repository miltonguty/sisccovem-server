import express from 'express';
import { add, get, getById, remove, update } from '../../controller/Rutes.js';
import { SetFilterRutes } from '../../lib/Filters.js';
import { GetCurrentUserId } from '../../lib/utils.js';

var router = express.Router();

router.get('/rutes', async function(req, res) {
    try {
        const filter = SetFilterRutes(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await get(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});

router.post('/rutes', async function(req, res) {
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
router.put('/rutes/:id', async function(req, res) {
    try {

        const { id } = req.params;
        const { name, description } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ id, name, description }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/rutes/:rutId', async function(req, res) {
    try {
        const { rutId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(rutId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/rutes/:rutId', async function(req, res) {
    try {
        const { rutId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(rutId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;