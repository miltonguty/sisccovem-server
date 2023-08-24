/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
export const get = async ({ name, description, pageSize, page }) => {

  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      secDeleted: FALSE
    }
  }
  const orConditions = []
  if (name) {
    orConditions.push(
      {
        secName: {
          contains: name,
        }
      })
  }

  if (description) {
    orConditions.push(
      {
        comDescription: {
          contains: description,
        }
      })
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }

  const seces = await prisma.sections.findMany(filter);
  const result = seces.map(item =>
  ({
    id: item.secKey,
    name: item.secName,
    description: item.secDescription,

  }))
  return result;

};
export const getById = async (secKey, ignoreDeleted = FALSE) => {
  if (secKey) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        secKey: secKey
      }
    } else {
      where = {
        secKey: secKey,
        secDeleted: FALSE
      }
    }
    const sece = await prisma.seces.findFirst({
      where: where
    });
    const result = {
      id: sece.secKey,
      name: sece.secName,
      description: sece.comDescription,

    }
    return result

  } else {
    return null
  }
}
export const add = async ({ name, description }) => {

  const sece = await prisma.seces.create({
    data: { secName: name, secDescription: description },
  });
  const seceResult = await getById(sece.secKey)
  return seceResult;

};
export const update = async ({ id, name, description }) => {

  const seceUpdate = await prisma.seces.updateMany({
    where: { secKey: id },
    data: { secName: name, secDescription: description },
  });
  const seceResult = await getById(seceUpdate.secKey)
  return seceResult

};
export const remove = async (secKey) => {


  const seceDelete = await prisma.seces.updateMany({
    where: { secKey: secKey }, data: {
      secDeleted: TRUE
    }
  });
  const seceResult = await getById(secKey, TRUE)
  return seceResult

};
