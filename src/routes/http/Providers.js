import express, { json } from 'express';
import { add, get, getById, remove, update } from '../../controller/Providers.js';
import { SetFilterProviders } from '../../lib/Filters.js';
import { GetCurrentUserId } from '../../lib/utils.js';
var router = express.Router();
router.get('/Providers', async function(req, res) {
    try {
        const filter = SetFilterProviders(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await get(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Providers', async function(req, res) {
    try {
        const { name, phone, address, image } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add({ name, phone, address, image }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Providers/:prvId', async function(req, res) {
    try {
        const { prvId } = req.params
        const { name, phone, address, image } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ prvId, name, phone, address, image }, currentUserId);

        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Providers/:prvId', async function(req, res) {
    try {
        const { prvId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(prvId, currentUserId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Providers/:prvId', async function(req, res) {
    try {
        const { prvId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(prvId, currentUserId)
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;