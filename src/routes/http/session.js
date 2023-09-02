import express from 'express';
import { login } from '../../controller/Users.js';
import { AddSession } from '../../sessions.js';

var router = express.Router();

router.post('/Login', async function(req, res) {
    try {
        const { userName, password } = req.body
        const userResult = await login(userName, password)
        if (userResult) {
            const IdSession = AddSession({ userId: userResult.id, companyId: userResult.company.id, userName, password })

            res.status(200).json({ tokenSession: IdSession, ...userResult });
        }
        else {
            res.status(200).json(null);
        }
    } catch (err) {
        console.log(err)
        res.status(404).json({ error: err });
    }

});
export default router;