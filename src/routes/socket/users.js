import { add, get, getById, remove } from '../../controller/Users.js';
const UserEvents = (io) => {
    io.on("GetUsers", async (filter) => {
        const result = await get(filter);
        io.emit("GetUsers", result)
    })
    io.on("CreateUsers", async (User) => {
        const result = await add(User);
        io.emit("GetUsers", result)
    })
    io.on("EditUsers", async (id, User) => {
        const result = await update(req, res);
        io.emit("GetUsers", result)
    })
    io.on("GetUserById", async (id) => {
        const result = await getById(id);
    })
    io.on("DeleteUser", async (id) => {
        const result = await remove(id);
    })
}
export default UserEvents
