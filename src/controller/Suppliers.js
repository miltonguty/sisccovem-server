/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetCompanyIdByUser } from "../lib/utils.js";
export const get = async (req, res) => {

  const { filter } = req.query;
  const comId = GetCompanyIdByUser()
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
export const getById = async (req, res) => {
  const comId = GetCompanyIdByUser()
  const { supId } = req.query;
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
export const add = async (req, res) => {
  const comId = GetCompanyIdByUser()
  const { name, phone, address, image } = req.body;
  const supplier = await prisma.suppliers.create({
    data: { supName: name, supPhone: phone, supAddress: address, supImage: image, supComId: comId },
  });
  return supplier;

};
export const update = async (req, res) => {
  const { id, name, phone, address, image } = req.body;
  const supplierUpdate = await prisma.suppliers.update({
    where: { supId: id },
    data: { supName: name, supPhone: phone, supAddress: address, supImage: image },
  });
  return supplierUpdate;

};
export const remove = async (req, res) => {
  const { supId } = req.query;
  const supplierDelete = await prisma.suppliers.delete({
    where: { supId: supId },
  });
  return supplierDelete;

};
