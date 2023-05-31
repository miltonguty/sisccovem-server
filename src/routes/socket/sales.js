import { add, get, getById, remove } from '../../controller/Sales.js';
const SalesEvents = (io) => {
    io.on("GetSales", async (filter) => {

        const result = await get(filter);
        io.emit("GetSales", result)
    })
    io.on("CreateSales", async (sales) => {
        const result = await add(sales);
        io.emit("GetSales", result)
    })
    io.on("EditSales", async (id, sales) => {
        const result = await update(req, res);
        io.emit("GetSales", result)
    })
    io.on("GetSalesById", async (id) => {
        const result = await getById(id);
    })
    io.on("DeleteSales", async (id) => {
        const result = await remove(id);
    })
}
export default SalesEvents
