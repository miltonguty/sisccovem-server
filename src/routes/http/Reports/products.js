import express, { json } from 'express';

var router = express.Router();

router.get('/reports/products', async function(req, res) {
    try {
        const result = await ProductsList();
        res.sendFile(result.filename);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }
});

export default router;