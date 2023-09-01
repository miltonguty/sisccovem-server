/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";

import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser, GetCurrentUserId } from "../lib/utils.js";
import { addUpdate, remove as removeDetailbyId } from "./SalesDetails.js";

export const NOTE_SALES_CLOSE = 1;

export const NOTE_SALES_OPEN = 0;

export const GetSales = async () => {
  const userId = GetCurrentUserId()
  const comId = GetEmpresaIdByUser(userId)
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
      totalWithDesc: (Number(item.salTotalWithDesc)).toFixed(2),
      totalDesc: (Number(item.salTotalDesc)).toFixed(2),
      TotalPayment: item.TotalPayment,
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

const GetCurrentSales = async () => {
  const userId = GetCurrentUserId()
  const currentSales = await prisma.sales.findMany({
    where: {
      salDeleted: FALSE,
      salClose: NOTE_SALES_OPEN,
      salUseId: Number(userId),
    }
  })
  return currentSales[0]

}
export const GetSalesById = async (salId) => {
  const currentSale = await prisma.salesview.findFirst({
    where: { salId: Number(salId) },
  })

  let salesNote = null
  if (currentSale != null) {

    const client = await prisma.clients.findFirst({ where: { cliId: currentSale.salCliId }, include: { Rutes: true } })
    const salesDetails = await prisma.salesdetails.findMany({
      where: { sadSalId: Number(salId), sadDeleted: FALSE },
      include: {
        products: true
      },
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
        rute: client.Rutes.rutName
      },
      salesdetails: []
    }

    salesDetails.map(detail => {
      if (!detail.sadDeleted) {
        salesNote.salesdetails.push({
          id: detail.sadKey,
          prodId: detail.products.proKey,
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
export const GetCurrentNoteSalesByUser = async () => {
  const userId = GetCurrentUserId()
  const currentSales = await GetCurrentSales()
  let noteSales = null
  if (currentSales) {
    noteSales = await GetSalesById(currentSales.salId)
  }


  return noteSales;
}
export const DeleteNoteSalesById = async (salId) => {
  const userId = GetCurrentUserId()
  const ComId = GetEmpresaIdByUser(userId)

  const salesUpdated = await prisma.sales.updateMany({ where: { salId: Number(salId) }, data: { salDeleted: TRUE, salClose: TRUE } })
  const salesDetailsUpdated = await prisma.salesdetails.updateMany({ where: { sadSalId: Number(salId) }, data: { sadDeleted: TRUE } })
  return GetSalesById(Number(salId))
}
export const DeleteNoteSales = async () => {
  const userId = GetCurrentUserId()
  const ComId = GetEmpresaIdByUser(userId)
  const currentSales = await GetCurrentSales()
  const salesUpdated = await prisma.sales.updateMany({ where: { salId: currentSales.salId }, data: { salDeleted: TRUE, salClose: TRUE } })
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
    const comId = GetEmpresaIdByUser()
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
export const CreateNoteSales = async (clikey) => {
  const userId = GetCurrentUserId()
  const ComId = GetEmpresaIdByUser(userId)
  const client = await prisma.clients.findFirst({
    where: { cliKey: clikey }
  })
  if (client != null) {
    const literal = "cero"
    /*const rawSQL = `call inserSales(${ Number(ComId) },${ Number(userId) }, "${ literal }",${ Number(client.cliId) })`;
    const result = await prisma.$executeRaw (rawSQL)*/

    const sales = await prisma.sales.create({
      data: {
        salComId: Number(ComId),
        salUseId: Number(userId),
        salDescuento: Number(0),
        salTotalDesc: 0,
        salTotalWithDesc: 0,
        salLiteral: "cero",
        salCliId: Number(client.cliId)
      },
    });
    return await GetCurrentNoteSalesByUser()
  } else {
    return null
  }

}
export const GetOrCreateNoteSales = async (req, res) => {

  let currentSalesNote = await GetCurrentNoteSalesByUser()

  return { ...currentSalesNote };


}
export const AddDetails = async (proKey, count) => {
  const salesCreated = await addUpdate(proKey, count)
  return GetCurrentNoteSalesByUser();
}
export const RemoveDetails = async (sadKey) => {
  const SalesDetail = await removeDetailbyId(sadKey)
  return SalesDetail

};

export const CloseNoteSales = async () => {
  const currentSalesNote = await GetCurrentNoteSalesByUser()

  const SaleUpdate = await prisma.sales.update({
    where: { salId: currentSalesNote.id },
    data: { salClose: NOTE_SALES_CLOSE }
  });
  return await GetSalesById(currentSalesNote.id)

  /*
  const file = await createPdf('NotedeVenta', 'output', SaleUpdate)
  res.sendFile("D:\DEV\sisccovem2\sisccovem-server\public\tmp\\output.pdf",)
  return { note: SaleUpdate, pathFile: file };*/

};
export const setClient = async (clientId) => {
  let currentSalesNote = await GetCurrentNoteSalesByUser()
  const client = await prisma.clients.findFirst({ where: { cliKey: clientId } })
  const sales = await prisma.sales.update({
    where: { salId: currentSalesNote.id },
    data: {
      salCliId: Number(client.cliId)
    }
  })


  return {
    id: client.cliKey,
    firstName: client.cliFirstName,
    lastName: client.cliLastName
  }
}
export const saveDescount = async (percentage = 0) => {
  const userId = GetCurrentUserId()
  const currentSale = await GetCurrentSales()
  const currentSales = await prisma.sales.update({
    where: {
      salId: currentSale.salId,
    }, data: {
      salDescuento: Number(percentage)
    }
  })
  let noteSales = null
  if (currentSales) {
    noteSales = {
      id: currentSales.salId,
      total: (Number(currentSales.salTotal)).toFixed(2),
      descuento: currentSales.salDescuento,
      totalWithDesc: (Number(currentSales.salTotalWithDesc)).toFixed(2),
      totalDesc: (Number(currentSales.salTotalDesc)).toFixed(2)

    }
  }
  return noteSales
}

