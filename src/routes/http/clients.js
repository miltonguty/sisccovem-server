import express from 'express';
import { add, get, getById, remove, update } from '../../controller/Clients.js';
import { SetFilterClients } from '../../lib/Filters.js';

var router = express.Router();

router.get('/clients',  async function(req, res) {
    try {
        const filter = SetFilterClients(req.query)
        const result = await get(filter);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/clients', async function(req, res) {
    try {
        const { firstName, lastName, email, phone } = req.body;
        const result = await add({ firstName, lastName, email, phone });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/clients/:id', async function(req, res) {
    try {
        const { id } = req.params;
        const { firstName, lastName, email, phone } = req.body;
        const result = await update({ id, firstName, lastName, email, phone });
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/clients/:cliId', async function(req, res) {
    try {
        const { cliId } = req.params;
        const result = await getById(cliId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/clients/:cliId', async function(req, res) {
    try {
        const { cliId } = req.params;
        const result = await remove(cliId);
        res.status(200).json(result);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;