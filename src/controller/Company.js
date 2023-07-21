/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
export const get = async ({ name, phone, address, pageSize, page }) => {

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
export const getById = async (comKey) => {
  if (comKey) {
    const company = await prisma.companys.findFirst({
      where: { comKey: Number(comKey) },
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
export const add = async ({ name, phone, address }) => {

  const company = await prisma.companys.create({
    data: { comName: name, comPhone: phone, comAddress: address },
  });
  return company;

};
export const update = async ({ id, name, phone, address }) => {

  const companyUpdate = await prisma.companys.updateMany({
    where: { comKey: id },
    data: { comName: name, comPhone: phone, comAddress: address },
  });
  return companyUpdate

};
export const remove = async (comKey) => {


  const companyDelete = await prisma.companys.updateMany({
    where: { comKey: comKey }, data: {
      comDeleted: TRUE
    }
  });
  return companyDelete

};
