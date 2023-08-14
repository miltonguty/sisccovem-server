/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
import { getById as getClientById } from "./Clients.js"
export const get = async ({ codigo, description, cliId, maintenice, pageSize, page }) => {
  const comId = GetEmpresaIdByUser()
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    include: {
      clients: true
    },
    where: {
      actComId: comId,
      actDeleted: FALSE
    }
  }
  const orConditions = []
  if (codigo) {
    orConditions.push(
      {
        actCodigo: {
          contains: codigo,
        }
      })
  }

  if (description) {
    orConditions.push(
      {
        actDescription: {
          contains: description,
        }
      })
  }
  if (cliId) {
    const client = await prisma.clients.findFirst({ where: { cliKey: cliId } })
    let clientId = 0
    if (client) {
      clientId = client.cliId
    }
    orConditions.push(
      {
        actCliId: clientId,

      })
  }
  if (maintenice) {
    orConditions.push(
      {
        actMaintenice: {
          contains: maintenice,
        }
      })
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }
  const actives = await prisma.actives.findMany(filter);
  const result = actives.map(item =>
  ({

    id: item.actKey,
    codigo: item.actCodigo,
    description: item.actDescription,
    inMaintenice: item.actMaintenice ? "En Manteniemieto" : "",
    cliId: item?.clients?.cliKey
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
        actKey: key,
        actComId: comId
      }
    } else {
      where = {
        actKey: key,
        actComId: comId,
        actDeleted: FALSE
      }
    }
    const active = await prisma.actives.findFirst({
      where: where,
      include: {
        clients: true
      }
    });
    result = {
      id: active.actKey,
      codigo: active.actCodigo,
      description: active.actDescription,
      inMaintenice: active.actMaintenice ? "En Mantenimiento" : "",
      cliId: active?.clients?.cliKey
    }
  }
  return result;


};
export const add = async (active) => {


  const comId = GetEmpresaIdByUser()
  const act = await prisma.actives.create({
    data: {
      actCodigo: active.codigo,
      actDescription: active.description,
      actComId: comId
    },
  });
  const activeResult = await getById(act.actKey)
  return activeResult;

};
export const update = async ({ id, codigo, description }) => {
  const activeUpdate = await prisma.actives.updateMany({
    where: { actKey: id },
    data: {
      actCodigo: codigo,
      actDescription: description
    },
  });
  const activeResult = await getById(activeUpdate.actKey)
  return activeResult
};
export const remove = async (actKey) => {
  const comId = GetEmpresaIdByUser()
  const activeDelete = await prisma.actives.updateMany({
    where: {
      actKey: actKey
    }, data: {
      actDeleted: TRUE
    }
  });
  const activeResult = await getById(actKey, TRUE)
  return activeResult;

};
export const asignItem = async ({ clientId = null, activeId }) => {
  let cliId = clientId
  if (clientId) {
    const client = await prisma.clients.findFirst({
      where: { cliKey: clientId }
    })
    cliId = client.cliId
  }

  const active = await prisma.actives.updateMany({
    where: { actKey: activeId },
    data: {
      actCliId: cliId,
    },
  })

  return getById(activeId)
}
export const getActivesFree = async ({ codigo, description, cliId, maintenice, pageSize, page }) => {
  const comId = GetEmpresaIdByUser()
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    include: {
      clients: true
    },
    where: {
      actComId: comId,
      actDeleted: FALSE,
      actCliId: null
    }
  }
  const orConditions = []
  if (codigo) {
    orConditions.push(
      {
        actCodigo: {
          contains: codigo,
        }
      })
  }

  if (description) {
    orConditions.push(
      {
        actDescription: {
          contains: description,
        }
      })
  }
  if (maintenice) {
    orConditions.push(
      {
        actMaintenice: {
          contains: maintenice,
        }
      })
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }

  const actives = await prisma.actives.findMany(filter);
  const result = actives.map(item =>
  ({

    id: item.actKey,
    codigo: item.actCodigo,
    description: item.actDescription,
    inMaintenice: item.actMaintenice ? "En Manteniemieto" : "",
    cliId: item?.clients?.cliKey
  }))
  return result

};