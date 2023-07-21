/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";

import { GetCurrentUserId } from "../lib/utils.js";
import { GetCurrentNoteSalesByUser } from "./Sales.js";


export const getById = async (sadKey) => {
  if (sadKey) {


    const SalesDetail = await prisma.salesdetails.findMany({
      where: { sadKey: sadKey },
      include: {
        products: true
      }
    });
    if (SalesDetail.length >= 1) {
      const result = {
        id: SalesDetail[0].sadKey,
        prodId: SalesDetail[0].products.proKey,
        description: SalesDetail[0].products.proDescription,
        price: SalesDetail[0].products.proPriceSales,
        count: SalesDetail[0].sadProdCount,
        subTotal: SalesDetail[0].sadSubTotal,
      }
      return result
    } else {
      return null
    }
  }
}
export const addUpdate = async (proKey, count) => {

  const product = await prisma.products.findFirst({
    where: { proKey: proKey },
  });
  let currentSalesNote = await GetCurrentNoteSalesByUser()
  const userId = GetCurrentUserId()
  const SalesDetail = await prisma.salesdetails.findFirst({
    where: {
      sadProdId: product.proId,
      sadDeleted: FALSE,
      sadSalId: currentSalesNote.id
    },
  });

  await prisma.salesdetails.updateMany({
    where: { sadSalId: currentSalesNote.id },
    data: {
      salLastItem: FALSE,
    }
  });
  let SalesDetailUpdate = {}
  if (SalesDetail) {
    SalesDetailUpdate = await prisma.salesdetails.update({
      where: { sadId: SalesDetail.sadId },
      data: {
        sadProdCount: Number(SalesDetail.sadProdCount) + Number(count),
        sadSubTotal: (Number(product.proPriceSales) * (Number(SalesDetail.sadProdCount) + Number(count))),
        salLastItem: TRUE
      },
    });

  } else {
    SalesDetailUpdate = await prisma.salesdetails.create({
      data: {
        sadProdId: Number(product.proId),
        sadProdPrice: Number(product.proPriceSales),
        sadProdDescription: product.proDescription,
        sadProdCount: Number(count),
        sadUseId: Number(userId),
        sadSalId: Number(currentSalesNote.id),
        sadSubTotal: (Number(product.proPriceSales) * Number(count)),
        salLastItem: TRUE
      },
    })
  }

  var detail = await getById(SalesDetailUpdate.sadKey)


  return detail

}
export const remove = async (sadKey) => {
  const SalesDetaiCount = await prisma.salesdetails.updateMany({
    where: { sadKey: sadKey },
    data: { sadDeleted: TRUE },
  });
  if (SalesDetaiCount.count >= 1) {
    const SalesDetailDelete = await getById(sadKey)
    const salesDetail = {
      id: SalesDetailDelete.id,
      prodId: SalesDetailDelete.prodId,
      description: SalesDetailDelete.description,
      price: SalesDetailDelete.price,
      count: SalesDetailDelete.count,
      subTotal: SalesDetailDelete.subTotal,

    }
    return salesDetail;
  } else {
    return null
  }

}
