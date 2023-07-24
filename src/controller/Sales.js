/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import createPdf from "../lib/PdfFiles.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser, GetCurrentUserId } from "../lib/utils.js";
import { getById } from "./Clients.js";
import { addUpdate, remove as removeDetailbyId } from "./SalesDetails.js";
export const NOTE_SALES_CLOSE = 1;
export const NOTE_SALES_OPEN = 0;
export const GetSalesById = async (salId) => {
  const currentSale = await prisma.sales.findFirst({
    where: { salId: salId }, include: {
      salesdetails: {
        include: {
          products: true
        }
      },
    },

  }
  )
  let salesNote = null
  if (currentSale != null) {
    const client = await prisma.clients.findFirst({ where: { cliId: currentSale.salCliId } })
    salesNote = {
      id: currentSale.salId,
      total: currentSale.salTotal,
      client: {
        firstName: client.cliFirstName,
        lastName: client.cliLastName,
        id: client.cliKey
      },
      salesdetails: []
    }
    currentSale.salesdetails.map(detail => {
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
  const currentSales = await prisma.sales.findMany({
    where: {
      salDeleted: FALSE,
      salClose: NOTE_SALES_OPEN,
      salUseId: Number(userId),
    }
  })
  let noteSales = null
  if (currentSales.length > 0) {
    noteSales = await GetSalesById(currentSales[0].salId)
  }


  return noteSales;
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
    const sales = await prisma.sales.create({
      data: { salComId: Number(ComId), salUseId: Number(userId), salLiteral: "cero", salCliId: Number(client.cliId) },
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
  return salesCreated;

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
  await prisma.sales.GetSalesById(currentSalesNote.id)
  return
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
