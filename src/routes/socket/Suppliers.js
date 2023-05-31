import { add, get, getById, remove } from '../../controller/Suppliers.js';
const supplierEvents = (io) => {
    io.on("GetSuppliers", async (filter) => {

        const result = await get(filter);
        io.emit("GetSuppliers", result)
    })
    io.on("CreateSuppliers", async (supplier) => {
        const result = await add(supplier);
        io.emit("GetSuppliers", result)
    })
    io.on("EditSuppliers", async (id, supplier) => {
        const result = await update(req, res);
        io.emit("GetSuppliers", result)
    })
    io.on("GetsupplierById", async (id) => {
        const result = await getById(id);
    })
    io.on("Deletesupplier", async (id) => {
        const result = await remove(id);
    })
}
export default supplierEvents
