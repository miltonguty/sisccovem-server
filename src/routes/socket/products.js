import { add, get, getById, remove } from '../../controller/Productss.js';
const ProductsEvents = (io) => {
    io.on("GetProducts", async (filter) => {

        const result = await get(filter);
        io.emit("GetProducts", result)
    })
    io.on("CreateProducts", async (product) => {
        const result = await add(product);
        io.emit("GetProducts", result)
    })
    io.on("EditProducts", async (id, product) => {
        const result = await update(req, res);
        io.emit("GetProducts", result)
    })
    io.on("GetProductsById", async (id) => {
        const result = await getById(id);
    })
    io.on("DeleteProducts", async (id) => {
        const result = await remove(id);
    })
}
export default ProductsEvents
