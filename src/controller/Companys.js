/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
export const get = async (req, res) => {

  const { filter } = req.query;
  let filterObject = {}

  if (filter) {
    filterObject = {
      where: {
        comName: {
          contains: filter,
        },
      }
    }
  };

  const companys = await prisma.companys.findMany(filterObject);
  const result = companys.map(item =>
  ({
    id: item.comId,
    name: item.comName,
    phone: item.comPhone,
    address: item.comAddress
  }))
  return result;

};
export const getById = async (req, res) => {
  try {
    const { comId } = req.query;

    if (comId) {
      const company = await prisma.companys.findFirst({
        where: { comId: comId },
      });
      const result = {
        id: company.comId,
        name: company.comName,
        phone: company.comPhone,
        address: company.comAddress
      }
      res.status(200).json(result);

    } else {
      res.status(404).json({ error: "company id not provide" });
    }
  } catch (err) {
    res.status(404).json({ error: err });
  }
};
export const add = async (req, res) => {

  const { name, phone, address } = req.body;
  const company = await prisma.companys.create({
    data: { comName: name, comPhone: phone, comAddress: address },
  });
  return company;

};
export const update = async (req, res) => {
  try {
    const { id, name, phone, address } = req.body;
    const companyUpdate = await prisma.companys.update({
      where: { comId: id },
      data: { comName: name, comPhone: phone, comAddress: address },
    });
    res.status(200).json(companyUpdate);
  } catch (err) {
    res.status(404).json({ error: err });
  }
};
export const remove = async (req, res) => {
  try {
    const { comId } = req.query;
    const companyDelete = await prisma.companys.delete({
      where: { comId: comId },
    });
    res.status(200).json(companyDelete);
  } catch (err) {
    res.status(404).json({ error: err });
  }
};
