/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
export const get = async ({ name, phone, address, pageSize, page }, currentUserId) => {

  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      comDeleted: FALSE
    }
  }
  const orConditions = []
  if (name) {
    orConditions.push(
      {
        comName: {
          contains: name,
        }
      })
  }

  if (phone) {
    orConditions.push(
      {
        comPhone: {
          contains: phone,
        }
      })
  }
  if (address) {
    orConditions.push(
      {
        comAddress: {
          contains: address,
        }
      }
    )
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }

  const companys = await prisma.companys.findMany(filter);
  const result = companys.map(item =>
  ({
    id: item.comKey,
    name: item.comName,
    phone: item.comPhone,
    address: item.comAddress
  }))
  return result;

};
export const getById = async (comKey, ignoreDeleted = FALSE, currentUserId) => {
  if (comKey) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        comKey: comKey
      }
    } else {
      where = {
        comKey: comKey,
        comDeleted: FALSE
      }
    }
    const company = await prisma.companys.findFirst({
      where: where
    });
    const result = {
      id: company.comKey,
      name: company.comName,
      phone: company.comPhone,
      address: company.comAddress
    }
    return result

  } else {
    return null
  }
}
export const add = async ({ name, phone, address }, currentUserId) => {

  const company = await prisma.companys.create({
    data: { comName: name, comPhone: phone, comAddress: address },
  });
  const companyResult = await getById(company.ComKey, currentUserId)
  return companyResult;

};
export const update = async ({ id, name, phone, address }, currentUserId) => {

  const companyUpdate = await prisma.companys.updateMany({
    where: { comKey: id },
    data: { comName: name, comPhone: phone, comAddress: address },
  });
  const companyResult = await getById(companyUpdate.ComKey, currentUserId)
  return companyResult

};
export const remove = async (comKey, currentUserId) => {


  const companyDelete = await prisma.companys.updateMany({
    where: { comKey: comKey }, data: {
      comDeleted: TRUE
    }
  });
  const companyResult = await getById(comKey, TRUE, currentUserId)
  return companyResult

};
