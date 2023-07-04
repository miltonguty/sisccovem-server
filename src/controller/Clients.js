/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const
  get = async ({ firstName, lastName, email, phone, pageSize, page }) => {
    const comId = GetEmpresaIdByUser()
    let filter = {
      skip: Number(page * pageSize),
      take: Number(pageSize),
      where: {
        cliComId: comId,
        cliDeleted: 0
      }
    }
    const orConditions = []
    if (firstName) {
      orConditions.push(
        {
          cliFirstName: {
            contains: firstName,
          }
        })
    }

    if (lastName) {
      orConditions.push(
        {
          cliLastName: {
            contains: lastName,
          }
        })
    }
    if (email) {
      orConditions.push(
        {
          cliEmail: {
            contains: email,
          }
        }
      )
    }
    if (phone) {
      orConditions.push(
        {
          cliPhone: {
            contains: phone,
          }
        })
    }
    if (orConditions.length > 0) {
      filter.where.OR = orConditions
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
    const comId = GetEmpresaIdByUser()
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


  const comId = GetEmpresaIdByUser()
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
    where: { cliId: Number(id) },
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
  const comId = GetEmpresaIdByUser()
  const ClientDelete = await prisma.clients.update({
    where: {
      cliId: Number(id)      
    }, data: {
      cliDeleted: 1
    }
  });
  return ClientDelete;

};
