import express from 'express';
import { login } from '../../controller/Users.js';

var router = express.Router();

router.post('/Login', async function(req, res) {
    try {
        const { userName, password } = req.body
        const userResult = await login(userName, password)

        res.status(200).json(userResult);
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;