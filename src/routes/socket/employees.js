import { SOCKET_KEY } from '../../constants.js';
import { add, get, getById, remove } from '../../controller/Epmployees.js';

const EpmployeeEvents = (io) => {
    io.on(SOCKET_KEY.EMPLOYEE.GET_EMPLOYEES, async (filter) => {

        const result = await get(filter);
        io.emit(SOCKET_KEY.EMPLOYEE.GET_EMPLOYEES, result)
    })
    io.on(SOCKET_KEY.EMPLOYEE.CREATE_EMPLOYEE, async (employee) => {
        const result = await add(employee);
        io.emit(SOCKET_KEY.EMPLOYEE.CREATE_EMPLOYEE, result)
    })
    io.on(SOCKET_KEY.EMPLOYEE.UPDATE_EMPLOYEE, async (id, employee) => {
        const result = await update(req, res);
        io.emit(SOCKET_KEY.EMPLOYEE.UPDATE_EMPLOYEE, result)
    })
    io.on(SOCKET_KEY.EMPLOYEE.GET_EMPLOYEE_BY_ID, async (id) => {
        const result = await getById(id);
    })
    io.on("DeleteEpmployee", async (id) => {
        const result = await remove(id);
    })
}
export default EpmployeeEvents
