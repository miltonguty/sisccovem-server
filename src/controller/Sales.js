/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";

import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser, GetCurrentUserId } from "../lib/utils.js";
import { addUpdate, remove as removeDetailbyId } from "./SalesDetails.js";
import { v4 as uuidv4 } from 'uuid';
import { add } from "./payments.js";

export const NOTE_SALES_CLOSE = 1;

export const NOTE_SALES_OPEN = 0;

export const GetSales = async (currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  let sales = await prisma.salesview.findMany({
    where: { salDeleted: FALSE, salComId: comId },
    orderBy: [
      {
        salId: 'desc',
      }]
  })

  sales = sales.map(async (item) => {
    return {
      id: item.salId,
      total: (Number(item.salTotal)).toFixed(2),
      descuento: item.salDescuento,
      date: item.salDate,
      totalWithDesc: (Number(item.totalWithDesc)).toFixed(2),
      totalDesc: (Number(item.totalDesc)).toFixed(2),
      totalDesc: (Number(item.totalDesc)).toFixed(2),
      totalPayment: item.totalPayment,
      client: {
        firstName: item.cliFirstName,
        lastName: item.cliLastName,
        id: item.cliKey,
        rute: item.rutName
      }
    }
  })


  return sales
}

const GetCurrentSales = async (currentUserId) => {

  const comId = await GetEmpresaIdByUser(currentUserId)
  const currentSales = await prisma.sales.findMany({
    where: {
      salDeleted: FALSE,
      salClose: NOTE_SALES_OPEN,
      salUseId: Number(currentUserId),
      salComId: comId
    }
  })
  return currentSales[0]

}
export const GetSalesById = async (salId, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const currentSale = await prisma.salesview.findFirst({
    where: { salId: Number(salId), salComId: comId },
  })

  let salesNote = null
  if (currentSale != null) {

    const client = await prisma.clientsview.findFirst({ where: { cliId: currentSale.salCliId } })

    const salesDetails = await prisma.salesdetails.findMany({
      where: { sadSalId: Number(salId), sadDeleted: FALSE }
    })

    salesNote = {
      id: currentSale.salId,
      date: currentSale.salDate,
      totalPayment: currentSale.totalPayment,
      total: (Number(currentSale.total)).toFixed(2),
      descuento: currentSale.salDescuento,
      totalWithDesc: (Number(currentSale.totalWithDesc)).toFixed(2),
      totalDesc: (Number(currentSale.totalDesc)).toFixed(2),
      due: (Number(currentSale.due)).toFixed(2),
      client: {
        firstName: client.cliFirstName,
        lastName: client.cliLastName,
        id: client.cliKey,
        rute: client.rutName,
        deuda: client.deuda
      },
      salesdetails: []
    }

    salesDetails.map(async (detail) => {
      if (!detail.sadDeleted) {
        salesNote.salesdetails.push({
          id: detail.sadKey,
          prodId: detail.sadProKey,
          description: detail.sadProdDescription,
          price: (Number(detail.sadProdPrice)).toFixed(2),
          count: (Number(detail.sadProdCount)).toFixed(2),
          subTotal: (Number(detail.sadSubTotal)).toFixed(2),

        }
        )
      }
    })
    return salesNote;
  }
  return null
}
export const GetCurrentNoteSalesByUser = async (currentUserId) => {

  const currentSales = await GetCurrentSales(currentUserId)
  let noteSales = null
  if (currentSales) {
    noteSales = await GetSalesById(currentSales.salId, currentUserId)
  }


  return noteSales;
}
export const DeleteNoteSalesById = async (salId, currentUserId) => {

  const comId = await GetEmpresaIdByUser(currentUserId)

  const salesUpdated = await prisma.sales.updateMany({ where: { salId: Number(salId), salComId: comId }, data: { salDeleted: TRUE, salClose: TRUE, salUseId: currentUserId } })
  const salesDetailsUpdated = await prisma.salesdetails.updateMany({ where: { sadSalId: Number(salId) }, data: { sadDeleted: TRUE } })
  return GetSalesById(Number(salId))
}
export const DeleteNoteSales = async (currentUserId) => {

  const comId = await GetEmpresaIdByUser(currentUserId)
  const currentSales = await GetCurrentSales(currentUserId)
  const salesUpdated = await prisma.sales.updateMany({ where: { salId: currentSales.salId, salComId: ComId }, data: { salDeleted: TRUE, salClose: TRUE } })
  const salesDetailsUpdated = await prisma.salesdetails.updateMany({ where: { sadSalId: currentSales.salId }, data: { sadDeleted: TRUE } })
}
/*
export const Get = async (req, res) =>
{
  try
  {
    const { filter } = req.query;
    let filterObject = {}

    if (filter)
    {
      filterObject = {
        where: {
          salId: {
            contains: filter,
          },
        }
      }
    };

    const sales = await prisma.sales.findMany(filterObject);
    const result = sales.map(item =>
    ({
      id: item.salId,
      date: item.salDate,
      total: item.salTotal,
      comId: item.salComId
    }))
   res.status(200).json(result);
  } catch (err)
  {
    res.status(404).json({ error: err });
  }
};
export const GetById = async (req, res) =>
{
  try
  {
    const { salId } = req.query;
    const comId = GetEmpresaIdByUser(currentUserId)
    if (salId)
    {
      const Sale = await prisma.sales.findFirst({
        where: { salId: salId, salComId: comId },
      });
      const result = {
        id: Sale.salId,
        date: Sale.salDate,
        total: Sale.salTotal,
        comId: Sale.salComId
      }
     res.status(200).json(result);

    } else
    {
      res.status(404).json({ error: "Sale id not provide" });
    }
  } catch (err)
  {
    res.status(404).json({ error: err });
  }
};*/
export const CreateNoteSales = async (clikey, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const client = await prisma.clients.findFirst({
    where: { cliKey: clikey }
  })
  if (client != null) {
    const literal = "cero"
    const sales = await prisma.sales.create({
      data: {
        salKey: uuidv4(),
        salComId: Number(comId),
        salUseId: Number(currentUserId),
        salDescuento: Number(0),
        salLiteral: "cero",
        salCliId: Number(client.cliId)
      },
    });
    return await GetCurrentNoteSalesByUser(currentUserId)
  } else {
    return null
  }

}
export const GetOrCreateNoteSales = async (currentUserId) => {

  let currentSalesNote = await GetCurrentNoteSalesByUser(currentUserId)

  return { ...currentSalesNote };


}
export const AddDetails = async (proKey, count, currentUserId) => {
  const salesCreated = await addUpdate(proKey, count, currentUserId)
  return GetCurrentNoteSalesByUser(currentUserId);
}
export const RemoveDetails = async (sadKey, currentUserId) => {
  const SalesDetail = await removeDetailbyId(sadKey, currentUserId)
  return SalesDetail

};

export const CloseNoteSales = async (amountCanceled, currentUserId) => {
  const currentSalesNote = await GetCurrentNoteSalesByUser(currentUserId)
  const comId = await GetEmpresaIdByUser(currentUserId)
  const SaleUpdate = await prisma.sales.updateMany({
    where: { salId: currentSalesNote.id, salComId: comId },
    data: { salClose: NOTE_SALES_CLOSE, salUseId: currentUserId }
  });
  const payment = await add({ noteSalesId: currentSalesNote.id, mount: amountCanceled }, currentUserId)
  return await GetSalesById(currentSalesNote.id, currentUserId)
};

export const setClient = async (clientId, currentUserId) => {
  let currentSalesNote = await GetCurrentNoteSalesByUser(currentUserId)
  const comId = await GetEmpresaIdByUser(currentUserId)
  const client = await prisma.clientsview.findFirst({ where: { cliKey: clientId, cliComId: comId } })
  const sales = await prisma.sales.updateMany({
    where: { salId: currentSalesNote.id, salComId: comId },
    data: {
      salCliId: Number(client.cliId),
      salUseId: currentUserId
    }
  })


  return {
    id: client.cliKey,
    firstName: client.cliFirstName,
    lastName: client.cliLastName,
    rute: client.rutName,
    deuda: client.deuda
  }
}
export const saveDescount = async (percentage = 0, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const currentSale = await GetCurrentSales(currentUserId)
  const currentSales = await prisma.sales.update({
    where: {
      salId: currentSale.salId
    }, data: {
      salDescuento: Number(percentage),
      salUseId: currentUserId
    }
  })
  let noteSales = null
  if (currentSales) {
    noteSales = {
      id: currentSales.salId,
      total: (Number(currentSales.salTotal)).toFixed(2),
      descuento: currentSales.salDescuento,
      totalWithDesc: (Number(currentSales.totalWithDesc)).toFixed(2),
      totalDesc: (Number(currentSales.totalDesc)).toFixed(2)

    }
  }
  return noteSales
}

