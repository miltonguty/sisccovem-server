import express from 'express';
import { add, get, getById, remove, update } from '../../controller/Users.js';
import { SetFilterUsers } from '../../lib/Filters.js';

var router = express.Router();

router.get('/users', async function(req, res) {
    try {
        const filter = SetFilterUsers(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/users', async function(req, res) {
    try {
        const { userName, email } = req.body;
        const result = await add({ userName, email });
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
        const result = await update({ id, userName, email });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/users/:useId', async function(req, res) {
    try {
        const { useId } = req.params;
        const result = await getById(useId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/users/:useId', async function(req, res) {
    try {
        const { useId } = req.params;
        const result = await remove(useId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;