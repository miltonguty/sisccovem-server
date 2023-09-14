/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { v4 as uuidv4 } from 'uuid';
import { GetEmpresaIdByUser } from "../lib/utils.js";

export const get = async ({ name, description, pageSize, page }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      secDeleted: FALSE, secComId: comId
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
export const getById = async (secKey, currentUserId) => {
  const ignoreDeleted = FALSE
  const comId = await GetEmpresaIdByUser(currentUserId)
  if (secKey) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        secKey: secKey,
        secComId: comId
      }
    } else {
      where = {
        secKey: secKey,
        secDeleted: FALSE
      }
    }
    const sece = await prisma.sections.findFirst({
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
export const add = async ({ name, description }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const sece = await prisma.seces.create({
    data: {
      sedKey: uuidv4(),
      secName: name, secDescription: description, secComId: comId
    },
  });
  const seceResult = await getById(sece.secKey, currentUserId)
  return seceResult;

};
export const update = async ({ id, name, description }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const seceUpdate = await prisma.seces.updateMany({
    where: { secKey: id, secComId: comId },
    data: { secName: name, secDescription: description },
  });
  const seceResult = await getById(seceUpdate.secKey, currentUserId)
  return seceResult

};
export const remove = async (secKey, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)

  const seceDelete = await prisma.seces.updateMany({
    where: { secKey: secKey, secComId: comId }, data: {
      secDeleted: TRUE
    }
  });
  const seceResult = await getById(secKey, currentUserId)
  return seceResult

};
