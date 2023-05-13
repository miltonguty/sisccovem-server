import express, { json } from 'express';
import { add, get, getById, remove } from '../controller/Companys.js';
var router = express.Router();
router.get('/companys', async function(req, res) {
    try {
        const result = await get(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/companys', async function(req, res) {
    try {
        const result = await add(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/companys', async function(req, res) {
    try {
        const result = await update(req, res);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/companys/:comId', async function(req, res) {
    try {
        const result = await getById(req, res);
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