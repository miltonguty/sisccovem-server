/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const  get = async ({ firstName, lastName, email, phone, pageSize, page }) => {
    const comId = GetEmpresaIdByUser()
    let filter = {
      skip: Number(page * pageSize),
      take: Number(pageSize),
      where: {
        cliComId: comId,
        cliDeleted: FALSE
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
    const clients = await prisma.clientsview.findMany(filter);
    const result = clients.map(item =>
    ({
      id: item.cliKey,
      firstName: item.cliFirstName,
      lastName: item.cliLastName,
      email: item.cliEmail,
      phone: item.cliPhone,
      deuda: item.deuda
    }))
    return result

  };
export const getById = async (key, ignoreDeleted = FALSE) => {


  let result = null
  if (key) {
    const comId = GetEmpresaIdByUser()
    let where = {}
    if (ignoreDeleted) {
      where = {
        cliKey: key,
        cliComId: comId
      }
    } else {
      where = {
        cliKey: key,
        cliComId: comId,
        cliDeleted: FALSE
      }
    }
    const Client = await prisma.clients.findFirst({
      where: where,
    });
    const notes = await prisma.salesview.findMany({
      where: {
        salCliId: Client.cliId,
        due: { gt: 0 }
      }
    })
    const notesdue = notes.map(item => {
      return {
        id: item.salId,
        date: item.salDate,
        salCliId: item.salCliId,
        total: item.total,
        totalDesc: item.totalDesc,
        totalWithDesc: item.totalWithDesc,
        TotalPayment: item.TotalPayment,
        due: item.due,
      }
    }

    )
    result = {
      id: Client.cliKey,
      firstName: Client.cliFirstName,
      lastName: Client.cliLastName,
      email: Client.cliEmail,
      phone: Client.cliPhone,
      notesDue: notesdue
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
  const clientResult = await getById(Client.CliKey)
  return clientResult;

};
export const update = async ({ id, firstName, lastName, email, phone }) => {
  const ClientUpdate = await prisma.clients.updateMany({
    where: { cliKey: id },
    data: {
      cliFirstName: firstName,
      cliLastName: lastName,
      cliEmail: email,
      cliPhone: phone
    },
  });
  const clientResult = await getById(ClientUpdate.CliKey)
  return clientResult
};
export const remove = async (cliKey) => {
  const comId = GetEmpresaIdByUser()
  const ClientDelete = await prisma.clients.updateMany({
    where: {
      cliKey: cliKey
    }, data: {
      cliDeleted: TRUE
    }
  });
  const clientResult = await getById(cliKey, TRUE)
  return clientResult;

};
