/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
import { v4 as uuidv4 } from 'uuid';
export const get = async ({ firstName, lastName, email, phone, pageSize, page }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
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
export const getById = async (key, currentUserId) => {

  const ignoreDeleted = FALSE
  let result = null
  if (key) {
    const comId = await GetEmpresaIdByUser(currentUserId)
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
    const client = await prisma.clientsview.findFirst({
      where: where,
    });
    const notes = await prisma.salesview.findMany({
      where: {
        salCliId: client.cliId,
        hasDeuda: 1  // !=0
      }
    })
    const notesdue = notes.map(item => {
      return {
        id: item.salId,
        date: item.salDate,
        salCliId: item.salCliId,
        total: String(item.total),
        totalDesc: String(item.totalDesc),
        totalWithDesc: String(item.totalWithDesc),
        totalPayment: String(item.totalPayment),
        due: String(item.due),
      }
    }

    )
    result = {
      id: client.cliKey,
      firstName: client.cliFirstName,
      lastName: client.cliLastName,
      email: client.cliEmail,
      phone: client.cliPhone,
      rute: client.rutName,
      deuda: client.deuda,
      notesDue: notesdue
    }
  }
  return result;


};
export const add = async (client, currentUserId) => {


  const comId = await GetEmpresaIdByUser(currentUserId)
  const Client = await prisma.clients.create({
    data: {
      cliKey: uuidv4(),
      cliFirstName: client.firstName,
      cliLastName: client.lastName,
      cliEmail: client.email,
      cliPhone: client.phone,
      cliComId: comId
    },
  });
  const clientResult = await getById(Client.CliKey, currentUserId)
  return clientResult;

};
export const update = async ({ id, firstName, lastName, email, phone }, currentUserId) => {
  const ClientUpdate = await prisma.clients.updateMany({
    where: { cliKey: id },
    data: {
      cliFirstName: firstName,
      cliLastName: lastName,
      cliEmail: email,
      cliPhone: phone
    },
  });
  const clientResult = await getById(ClientUpdate.CliKey, currentUserId)
  return clientResult
};
export const remove = async (cliKey, currentUserId) => {
  const comId = GetEmpresaIdByUser(currentUserId)
  const ClientDelete = await prisma.clients.updateMany({
    where: {
      cliKey: cliKey
    }, data: {
      cliDeleted: TRUE
    }
  });
  const clientResult = await getById(cliKey, currentUserId)
  return clientResult;

};
