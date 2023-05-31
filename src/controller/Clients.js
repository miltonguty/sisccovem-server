/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetCompanyIdByUser } from "../lib/utils.js";
export const get = async ({ firstName, lastName }) => {
  const comId = GetCompanyIdByUser()
  let filter = {
    where: {
      cliComId: comId,
      cliDeleted: 0
    }
  }
  if (firstName) {
    filter.where.cliFirstName = {
      contains: firstName,
    }
  }
  if (lastName) {
    filter.where.cliLastName = {
      contains: lastName,
    }
  }
  console.log(filter)
  const clients = await prisma.clients.findMany(filter);
  const result = clients.map(item =>
  ({
    id: item.cliId,
    firstName: item.cliFirstName,
    lastName: item.cliLastName,
    email: item.cliEmail,
    phone: item.cliPhone
  }))
  return result

};
export const getById = async (id) => {


  let result = null
  if (id) {
    const comId = GetCompanyIdByUser()
    const Client = await prisma.clients.findFirst({
      where: {
        cliId: Number(id),
        cliComId: comId
      },
    });
    result = {
      id: Client.cliId,
      firstName: Client.cliFirstName,
      lastName: Client.cliLastName,
      email: Client.cliEmail,
      phone: Client.cliPhone
    }
  }
  return result;


};
export const add = async (client) => {


  const comId = GetCompanyIdByUser()
  const Client = await prisma.clients.create({
    data: {
      cliFirstName: client.firstName,
      cliLastName: client.lastName,
      cliEmail: client.email,
      cliPhone: client.phone,
      cliComId: comId
    },
  });
  return Client;

};
export const update = async ({ id, firstName, lastName, email, phone }) => {
  const ClientUpdate = await prisma.clients.update({
    where: { cliId: id },
    data: {
      cliFirstName: firstName,
      cliLastName: lastName,
      cliEmail: email,
      cliPhone: phone
    },
  });
  return ClientUpdate
};
export const remove = async (id) => {


  const ClientDelete = await prisma.clients.update({
    where: { cliId: id }, data: {
      cliDeleted: 1
    }
  });
  return ClientDelete;

};
