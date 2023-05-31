import { add, get, getById, remove } from '../../controller/Purchasess.js';
const PurchasesEvents = (io) => {
    io.on("GetPurchases", async (filter) => {

        const result = await get(filter);
        io.emit("GetPurchases", result)
    })
    io.on("CreatePurchases", async (purchase) => {
        const result = await add(purchase);
        io.emit("GetPurchases", result)
    })
    io.on("EditPurchases", async (id, purchase) => {
        const result = await update(req, res);
        io.emit("GetPurchases", result)
    })
    io.on("GetPurchasesById", async (id) => {
        const result = await getById(id);
    })
    io.on("DeletePurchases", async (id) => {
        const result = await remove(id);
    })
}
export default PurchasesEvents
