import express, { json } from 'express';
var router = express.Router();
router.get('/reports', function(req, res) {
    res.send('reports GET');
});
router.get('/reports/sales/:id', function(req, res) {
    res.send('reports GET');
});
router.get('/reports/sales/:id', function(req, res) {
    res.send('reports GET');
});
export default router;