/*** CONTROLLER*/
import prisma from "../lib/prisma";
import { GetCompanyIdByUser } from "../lib/utils";
export const get = async (req, res) => {
  const { filter } = req.query;
  let filterObject = {}
  const comId = GetCompanyIdByUser()
  if (filter) {
    filterObject = {
      where: {
        cliFirstName: {
          contains: filter,
        },
        cliLastName: {
          contains: filter,
        },
        cliComId: comId
      }
    }
  };

  const clients = await prisma.clients.findMany(filterObject);
  const result = clients.map(item =>
  ({
    id: item.cliId,
    name: item.cliFirstName + " " + item.cliLastName,
    firstName: item.cliFirstName,
    lastName: item.cliLastName,
    email: item.cliEmail,
    phone: item.cliPhone,
    comId: item.cliComId,
  }))
  return { clients }

};
export const getById = async (req, res) => {

  const { cliId } = req.query;
  const result = null
  if (cliId) {
    const comId = GetCompanyIdByUser()
    const Client = await prisma.clients.findFirst({
      where: {
        cliId: cliId,
        cliComId: comId
      },
    });
    result = {
      id: Client.cliId,
      name: item.cliFirstName + " " + item.cliLastName,
      firstName: item.cliFirstName,
      lastName: item.cliLastName,
      email: Client.cliEmail,
      phone: Client.cliPhone,
      comId: Client.cliComId,
    }
  }
  return result;


};
export const add = async (req, res) => {

  const { firstName, lastName, email, phone } = req.body;
  const comId = GetCompanyIdByUser()
  const Client = await prisma.clients.create({
    data: {
      cliFirstName: firstName, cliLastName: lastName, cliEmail: email,
      cliPhone: phone, cliComId: comId
    },
  });
  return Client;

};
export const update = async (req, res) => {
  try {
    const { id, firstName, lastName, email, phone } = req.body;
    const ClientUpdate = await prisma.clients.update({
      where: { cliId: id },
      data: {
        cliFirstName: firstName, cliLastName: lastName, cliEmail: email,
        cliPhone: phone
      },
    });
    res.status(200).json(ClientUpdate);
  } catch (err) {
    res.status(404).json({ error: err });
  }
};
export const remove = async (req, res) => {

  const { cliId } = req.query;
  const ClientDelete = await prisma.clients.delete({
    where: { cliId: cliId },
  });
  return ClientDelete;

};
