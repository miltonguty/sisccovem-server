/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const get = async (filter) => {

  const comId = GetEmpresaIdByUser()
  let filterObject = {
    where: {
      supComId: Number(comId)
    }
  }

  if (filter) {
    filterObject = {
      where: {
        supName: {
          contains: filter,
        },
        supComId: Number(comId)
      }
    }
  };

  const suppliers = await prisma.suppliers.findMany(filterObject);
  const result = suppliers.map(item =>
  ({
    id: item.supId,
    name: item.supName,
    phone: item.supPhone,
    address: item.supAddress,
    image: item.supImage,
    comId: item.supComId,
  }))
  return result;

};
export const getById = async (supId) => {
  const comId = GetEmpresaIdByUser()
  let result = null
  if (supId) {
    const supplier = await prisma.suppliers.findFirst({
      where: { supId: supId, supComId: comId },
    });
    result = {
      id: supplier.supId,
      name: supplier.supName,
      phone: supplier.supPhone,
      address: supplier.supAddress,
      image: supplier.supImage,
    }
  }
  return result;

};
export const add = async ({ name, phone, address, image }) => {
  const comId = GetEmpresaIdByUser()
  const supplier = await prisma.suppliers.create({
    data: { supName: name, supPhone: phone, supAddress: address, supImage: image, supComId: comId },
  });
  return supplier;

};
export const update = async ({ id, name, phone, address, image }) => {
  const supplierUpdate = await prisma.suppliers.update({
    where: { supId: id },
    data: { supName: name, supPhone: phone, supAddress: address, supImage: image },
  });
  return supplierUpdate;

};
export const remove = async (supId) => {
  const supplierDelete = await prisma.suppliers.delete({
    where: { supId: supId },
  });
  return supplierDelete;

};
