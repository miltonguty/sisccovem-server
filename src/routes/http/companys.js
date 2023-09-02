import express, { json } from 'express';
import { add, get, getById, remove, update } from '../../controller/Company.js';
import { SetFilterCompany } from '../../lib/Filters.js';
import { GetCurrentUserId } from '../../lib/utils.js';
var router = express.Router();
router.get('/companys', async function(req, res) {
    try {
        const filter = SetFilterCompany(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await get(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/companys', async function(req, res) {
    try {
        const { name, phone, address } = req.body
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add({ name, phone, address }, currentUserId);
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
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ id, name, phone, address }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/companys/:comId', async function(req, res) {
    try {
        const { comId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(comId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/companys/:comId', async function(req, res) {
    try {
        const { comId } = req.params
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(comId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;