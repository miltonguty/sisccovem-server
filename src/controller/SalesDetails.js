/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";

import { GetEmpresaIdByUser } from "../lib/utils.js";
import { GetCurrentNoteSalesByUser } from "./Sales.js";
import { v4 as uuidv4 } from 'uuid';

export const getById = async (sadKey, currentUserId) => {
  if (sadKey) {


    const SalesDetail = await prisma.salesdetails.findMany({
      where: { sadKey: sadKey }
    })

    if (SalesDetail.length >= 1) {
      const product = await prisma.products.findFirst({
        where: { proId: SalesDetail[0].sadProId }
      })
      const result = {
        id: SalesDetail[0].sadKey,
        prodId: product.proKey,
        description: SalesDetail[0].sadProdDescription,
        price: SalesDetail[0].sadProdPrice,
        count: SalesDetail[0].sadProdCount,
        subTotal: SalesDetail[0].sadSubTotal,
      }
      return result
    } else {
      return null
    }
  }
}
export const addUpdate = async (proKey, count, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const product = await prisma.products.findFirst({

    where: { proKey: proKey, proComId: comId },
  });
  let currentSalesNote = await GetCurrentNoteSalesByUser(currentUserId)

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
        sadKey: uuidv4(),
        sadProdId: Number(product.proId),
        sadProdKey: product.proKey,
        sadProdPrice: Number(product.proPriceSales),
        sadProdDescription: product.proDescription,
        sadProdCount: Number(count),
        sadUseId: Number(currentUserId),
        sadSalId: Number(currentSalesNote.id),
        sadSubTotal: (Number(product.proPriceSales) * Number(count)),
        salLastItem: TRUE
      },
    })
  }

  var detail = await getById(SalesDetailUpdate.sadKey, currentUserId)


  return detail

}
export const remove = async (sadKey, currentUserId) => {
  const SalesDetaiCount = await prisma.salesdetails.updateMany({
    where: { sadKey: sadKey },
    data: { sadDeleted: TRUE },
  });
  if (SalesDetaiCount.count >= 1) {
    const SalesDetailDelete = await getById(sadKey, currentUserId)
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
