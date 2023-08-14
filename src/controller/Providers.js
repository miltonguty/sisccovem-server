/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const get = async ({ name, phone, address, pageSize, page }) => {

  const comId = GetEmpresaIdByUser()
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      prvComId: comId,
      prvDeleted: FALSE
    }
  }
  const orConditions = []
  if (name) {
    orConditions.push(
      {
        prvName: {
          contains: name,
        }
      })
  }
  if (phone) {
    orConditions.push(
      {
        prvPhone: {
          contains: phone,
        }
      })
  }
  if (address) {
    orConditions.push(
      {
        prvaddress: {
          contains: address,
        }
      })
  }
  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }
  const providers = await prisma.providers.findMany(filter);
  const result = providers.map(item =>
  ({
    id: item.prvKey,
    name: item.prvName,
    phone: item.prvPhone,
    address: item.prvAddress,
    image: item.prvImage,
    comId: item.prvComId,
  }))
  return result;

};
export const getById = async (key, ignoreDeleted = FALSE) => {
  const comId = GetEmpresaIdByUser()
  let result = null
  if (key) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        prvKey: key,
        prvComId: comId
      }
    } else {
      where = {
        prvKey: key,
        prvComId: comId,
        prvDeleted: FALSE
      }
    }
    const prvplier = await prisma.providers.findFirst({
      where: where,
    });
    result = {
      id: prvplier.prvKey,
      name: prvplier.prvName,
      phone: prvplier.prvPhone,
      address: prvplier.prvAddress,
      image: prvplier.prvImage,
    }
  }
  return result;

};
export const add = async ({ name, phone, address, image }) => {
  const comId = GetEmpresaIdByUser()
  const prvplier = await prisma.providers.create({
    data: { prvName: name, prvPhone: phone, prvAddress: address, prvImage: image, prvComId: comId },
  });
  const providerResult = await getById(prvplier.prvKey)
  return providerResult;

};
export const update = async ({ prvId, name, phone, address, image }) => {
  const prvplierUpdate = await prisma.providers.updateMany({
    where: { prvKey: prvId },
    data: { prvName: name, prvPhone: phone, prvAddress: address, prvImage: image },
  });
  const providerResult = await getById(prvplierUpdate.prvKey)
  return providerResult;

};
export const remove = async (prvKey) => {
  const providerDelete = await prisma.providers.updateMany({
    where: {
      prvKey: prvKey
    },
    data: { prvDeleted: TRUE }
  });
  const providerResult = await getById(prvKey, TRUE)
  return providerResult;

};
