import express from 'express';
import { add, get, getById, remove, update } from '../../controller/Users.js';
import { SetFilterUsers } from '../../lib/Filters.js';
import { GetCurrentUserId } from '../../lib/utils.js';
import { FALSE } from '../../constants.js';

var router = express.Router();

router.get('/users', async function(req, res) {
    try {
        const filter = SetFilterUsers(req.query)
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await get(filter, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/users', async function(req, res) {
    try {
        const { userName, email, company } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await add({ userName, email, company }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/users/:id', async function(req, res) {
    try {
        const { id } = req.params;
        const { userName, email } = req.body;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await update({ id, userName, email }, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/users/:useId', async function(req, res) {
    try {
        const { useId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await getById(useId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/users/:useId', async function(req, res) {
    try {
        const { useId } = req.params;
        const sessionId = req.headers.authorization
        const currentUserId = GetCurrentUserId(sessionId)
        const result = await remove(useId, currentUserId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;