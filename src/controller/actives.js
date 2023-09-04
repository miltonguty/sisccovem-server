/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
import { v4 as uuidv4 } from 'uuid';

export const get = async ({ codigo, description, cliId, maintenice, pageSize, page }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
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
export const getById = async (key, currentUserId) => {

  const ignoreDeleted = FALSE
  let result = null
  if (key) {
    const comId = await GetEmpresaIdByUser(currentUserId)
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
export const add = async (active, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const act = await prisma.actives.create({
    data: {
      actKey: uuidv4(),
      actCodigo: active.codigo,
      actDescription: active.description,
      actComId: comId
    },
  });
  const activeResult = await getById(act.actKey, currentUserId)
  return activeResult;

};
export const update = async ({ id, codigo, description }, currentUserId) => {
  const activeUpdate = await prisma.actives.updateMany({
    where: { actKey: id },
    data: {
      actCodigo: codigo,
      actDescription: description
    },
  });
  const activeResult = await getById(activeUpdate.actKey, currentUserId)
  return activeResult
};
export const remove = async (actKey, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const activeDelete = await prisma.actives.updateMany({
    where: {
      actKey: actKey
    }, data: {
      actDeleted: TRUE
    }
  });
  const activeResult = await getById(actKey, currentUserId)
  return activeResult;

};
export const asignItem = async ({ clientId = null, activeId }, currentUserId) => {
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

  return getById(activeId, currentUserId)
}
export const getActivesFree = async ({ codigo, description, cliId, maintenice, pageSize, page }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
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