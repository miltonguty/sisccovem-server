/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { v4 as uuidv4 } from 'uuid';
export const get = async ({ name, description, pageSize, page }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      rutDeleted: FALSE, rutComId: comId
    }
  }
  const orConditions = []
  if (name) {
    orConditions.push(
      {
        rutName: {
          contains: name,
        }
      })
  }

  if (description) {
    orConditions.push(
      {
        rutDescription: {
          contains: description,
        }
      })
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }

  const rutes = await prisma.rutes.findMany(filter);
  const result = rutes.map(item =>
  ({
    id: item.rutKey,
    name: item.rutName,
    description: item.rutDescription,

  }))
  return result;

};
export const getById = async (rutKey, currentUserId) => {
  const ignoreDeleted = FALSE
  const comId = await GetEmpresaIdByUser(currentUserId)
  if (rutKey) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        rutKey: rutKey,
        rutComId: comId
      }
    } else {
      where = {
        rutKey: rutKey,
        rutDeleted: FALSE,
        rutComId: comId
      }
    }
    const rute = await prisma.rutes.findFirst({
      where: where
    });
    const result = {
      id: rute.rutKey,
      name: rute.rutName,
      description: rute.rutDescription,

    }
    return result

  } else {
    return null
  }
}
export const add = async ({ name, description }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const rute = await prisma.rutes.create({
    data: {
      rutKey: uuidv4(),
      rutName: name, rutDescription: description, rutComId: comId
    },
  });
  const ruteResult = await getById(rute.rutKey, currentUserId)
  return ruteResult;

};
export const update = async ({ id, name, description }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const ruteUpdate = await prisma.rutes.updateMany({
    where: { rutKey: id, rutComId: comId },
    data: { rutName: name, rutDescription: description },
  });
  const ruteResult = await getById(ruteUpdate.rutKey, currentUserId)
  return ruteResult

};
export const remove = async (rutKey, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)

  const ruteDelete = await prisma.rutes.updateMany({
    where: { rutKey: rutKey, rutComId: comId }, data: {
      rutDeleted: TRUE
    }
  });
  const ruteResult = await getById(rutKey, currentUserId)
  return ruteResult

};
