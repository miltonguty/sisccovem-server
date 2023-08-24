/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
export const get = async ({ name, description, pageSize, page }) => {

  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      rutDeleted: FALSE
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
export const getById = async (rutKey, ignoreDeleted = FALSE) => {
  if (rutKey) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        rutKey: rutKey
      }
    } else {
      where = {
        rutKey: rutKey,
        rutDeleted: FALSE
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
export const add = async ({ name, description }) => {

  const rute = await prisma.rutes.create({
    data: { rutName: name, rutDescription: description },
  });
  const ruteResult = await getById(rute.rutKey)
  return ruteResult;

};
export const update = async ({ id, name, description }) => {

  const ruteUpdate = await prisma.rutes.updateMany({
    where: { rutKey: id },
    data: { rutName: name, rutDescription: description },
  });
  const ruteResult = await getById(ruteUpdate.rutKey)
  return ruteResult

};
export const remove = async (rutKey) => {


  const ruteDelete = await prisma.rutes.updateMany({
    where: { rutKey: rutKey }, data: {
      rutDeleted: TRUE
    }
  });
  const ruteResult = await getById(rutKey, TRUE)
  return ruteResult

};
