import express, { json } from 'express';
import { add, get, getById, remove } from '../controller/Products';
var router = express.Router();
router.get('/Products', async function (req, res)
{
    try
    {
        const result = await get(req, res);
        res.status(200).json(result);
    } catch (err)
    {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.post('/Products', async function (req, res)
{
    try
    {
        const result = await add(req, res);
        res.status(200).json(result);
    } catch (err)
    {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.put('/Products', async function (req, res)
{
    try
    {
        const result = await update(req, res);
        res.status(200).json(result);
    } catch (err)
    {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.get('/Products/:proId', async function (req, res)
{
    try
    {
        const result = await getById(req, res);
        res.status(200).json(result);
    } catch (err)
    {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
router.delete('/Products/:proId', async function (req, res)
{
    try
    {
        const result = await remove(req, res);
        res.status(200).json(result);
    } catch (err)
    {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
module.exports = router;