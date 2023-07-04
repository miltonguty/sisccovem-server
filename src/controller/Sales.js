/*** CONTROLLER*/
import createPdf from "../lib/PdfFiles.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser, GetCurrentUserId } from "../lib/utils.js";
export const NOTE_SALES_CLOSE = true;
export const NOTE_SALES_OPEN = false;
const GetCurrentNoteSalesByUser = async () => {
  const userId = GetCurrentUserId()
  const currentSales = await prisma.sales.findMany({
    where: {
      salDeleted: false,
      salClose: NOTE_SALES_OPEN,
      salUseId: Number(userId),
    },
    include: {
      salesdetails: true,
    },
  })
  let currentSalesNote = null
  if (currentSales.length >= 1) {
    const currentSale = currentSales[0]
    currentSalesNote = {
      id: currentSale.salId,
      date: currentSale.salDate,
      total: currentSale.salTotal,
      comId: currentSale.salComId,
      cliId: currentSale.salCliId,
      salesdetails: []
    }
    currentSale.salesdetails.map(detail => {
      if (!detail.sadDeleted) {
        currentSalesNote.salesdetails.push({
          id: detail.sadId,
          prodId: detail.sadProdId,
          price: detail.sadProdPrice,
          count: detail.sadProdCount,
          subTotal: detail.sadSubTotal,
          description: detail.sadProdDescription
        }
        )
      }
    })
  }
  return currentSalesNote;
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
export const GetOrCreateNoteSales = async (req, res) => {

  let currentSalesNote = await GetCurrentNoteSalesByUser()
  if (currentSalesNote == null) {
    const userId = GetCurrentUserId()
    const ComId = GetEmpresaIdByUser(userId)
    const { cliId } = req.body;
    const sales = await prisma.sales.create({
      data: { salComId: Number(ComId), salUseId: Number(userId), salLiteral: "cero", salCliId: Number(1) },
    });
    currentSalesNote = await GetCurrentNoteSalesByUser()
  }
  return { ...currentSalesNote };


}
export const AddDetails = async (req, res) => {

  const salesCreated = await CreateUpdateSalesDetails(req, res)
  /*const salesDetail = {
    id: SalesDetailCreated.sadId,
    prodId: SalesDetailCreated.sadProdId,
    price: SalesDetailCreated.sadProdPrice,
    count: SalesDetailCreated.sadProdCount,
    subTotal: SalesDetailCreated.sadSubTotal,
    description: SalesDetailCreated.sadProdDescription
  }
  */
  return salesCreated;

}
export const RemoveDetails = async (req, res) => {
  const { sadId } = req.body;
  let currentSalesNote = await GetCurrentNoteSalesByUser()
  const SalesDetailDelete = await prisma.salesdetails.update({
    where: { sadId: sadId, sadSalId: currentSalesNote.salId },
    data: { sadDeleted: true },
  });
  const salesDetail = {
    id: SalesDetailDelete.sadId,
    prodId: SalesDetailDelete.sadProdId,
    price: SalesDetailDelete.sadProdPrice,
    count: SalesDetailDelete.sadProdCount,
    subTotal: SalesDetailDelete.sadSubTotal,
    description: SalesDetailDelete.sadProdDescription
  }
  currentSalesNote = await GetCurrentNoteSalesByUser()
  return currentSalesNote;

};

export const CloseNoteSales = async (req, res) => {
  const currentSalesNote = await GetCurrentNoteSalesByUser()

  const SaleUpdate = await prisma.sales.update({
    where: { salId: currentSalesNote.id },
    data: { salClose: NOTE_SALES_CLOSE },
    include: {
      salesdetails: true,
    },
  });
  const file = await createPdf('NotedeVenta', 'output', SaleUpdate)
  res.sendFile("D:\DEV\sisccovem2\sisccovem-server\public\tmp\\output.pdf",)
  return { note: SaleUpdate, pathFile: file };

};
/*
export const remove = async (req, res) =>
{
  try
  {
    const { salId } = req.query;
    const currentSalesNote = await GetCurrentNoteSalesByUser()
    const salesDelete = await prisma.sales.update({
      where: { salId: currentSalesNote.salId },
      data: { salDeleted: true },
    });
    res.status(200).json({ Sales: salesDelete });
  } catch (err)
  {
    res.status(404).json({ error: err });
  }
};*/
const CreateUpdateSalesDetails = async (req, res) => {
  const { proId, count } = req.body;

  let currentSalesNote = await GetCurrentNoteSalesByUser()
  const userId = GetCurrentUserId()
  const SalesDetail = await prisma.salesdetails.findFirst({
    where: { sadProdId: String(proId), sadDeleted: false, sadSalId: currentSalesNote.id },
  });
  const product = await prisma.products.findFirst({
    where: { proId: proId },
  });
  await prisma.salesdetails.updateMany({
    where: { sadSalId: currentSalesNote.id },
    data: {
      salLastItem: false,
    }
  });
  let SalesDetailUpdate = {}
  if (SalesDetail) {
    SalesDetailUpdate = await prisma.salesdetails.update({
      where: { sadId: SalesDetail.sadId },
      data: { sadProdCount: Number(SalesDetail.sadProdCount) + Number(count), salLastItem: true },
    });

  } else {
    SalesDetailUpdate = await prisma.salesdetails.create({
      data: {
        sadProdId: String(proId),
        sadProdPrice: Number(product.proPriceSales),
        sadProdDescription: product.proDescription,
        sadProdCount: Number(count),
        sadUseId: Number(userId),
        sadSalId: Number(currentSalesNote.id),
        salLastItem: true
      },
    })
  }
  //const result = await prisma.$executeRaw(`update Sales set salTotal=(select sum(sadSubTotal) from salesdetails where sadSalId='${ currentSalesNote.id }') where salId='${ currentSalesNote.id }';`)
  currentSalesNote = await GetCurrentNoteSalesByUser()
  return currentSalesNote

}