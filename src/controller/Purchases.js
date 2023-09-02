/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser, GetCurrentUserId } from "../lib/utils.js";
export const get = async ({ number, pageSize, page }, currentUserId) => {
  const comId = GetEmpresaIdByUser(currentUserId)
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    orderBy: [
      {
        purId: 'desc',
      }
    ],
    where: {
      purComId: comId,
      purDeleted: FALSE
    }
  }
  const orConditions = []
  if (number) {
    orConditions.push(
      {
        purNumber: {
          contains: number,
        }
      })
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }
  const purchases = await prisma.purchases.findMany(filter);
  const result = purchases.map(item =>
  ({
    id: item.purId,
    purDate: item.purDate,
    purTotal: item.purTotal,
    comId: item.purComId
  }))
  return result;

};
export const getById = async (purId, currentUserId) => {
  const comId = GetEmpresaIdByUser(currentUserId)

  let result = null
  if (purId) {
    const Purchase = await prisma.purchases.findFirst({
      where: { purId: Number(purId), purDeleted: FALSE, purComId: comId },
      include: {
        purchasesdetails: { where: { pudDeleted: FALSE } },
        providers: true
      }
    });
    const purchasesdetails = Purchase.purchasesdetails.map(item => {
      return {
        id: item.pudKey,
        deleted: item.pudDeleted,
        counter: item.pudCounter,
        prodId: item.pudProdId,
        description: item.pudProdDescription,
        count: item.pudProdCount,
        purId: item.pudPurId,
        price: item.pudProdPrice,
        subTotal: item.pudSubTotal,

      }
    })
    result = {
      id: Purchase.purId,
      date: Purchase.purDate,
      total: Purchase.purTotal,
      comId: Purchase.purComId,
      provider: {
        id: Purchase.providers.prvKey,
        name: Purchase.providers.prvName,
        phone: Purchase.providers.prvPhone,
        address: Purchase.providers.prvAddress
      },
      details: purchasesdetails
    }
  }
  return result;

};
export const add = async (providerId, currentUserId) => {

  const comId = GetEmpresaIdByUser(currentUserId)
  const provider = await prisma.providers.findMany({
    where: { prvKey: providerId },
  });
  let purchase = null
  if (provider.length > 0) {
    purchase = await prisma.purchases.create({
      data: { purComId: ComId, purPrvId: provider[0].prvId },
    });
    purchase = {
      date: purchase.purDate,
      id: purchase.purId,
      number: purchase.purNumber,
      prvId: provider.prvKey,
      total: purchase.purTotal
    }
  }

  return purchase;
};
export const update = async ({ purPrvId }, currentUserId) => {
  const comId = GetEmpresaIdByUser(currentUserId)
  const PurchaseUpdate = await prisma.purchases.update({
    where: { purId: id, purComId: comId },
    data: {
      purComId: ComId,
      purPrvId: purPrvId
    },
  });
  return PurchaseUpdate

};
export const remove = async (purId, currentUserId) => {
  const comId = GetEmpresaIdByUser(currentUserId)
  const PurchaseDelete = await prisma.purchases.update({
    where: { purId: purId, purComId: comId },
    data: { purDeleted: TRUE },
  });

  return PurchaseDelete

};
export const addDetails = async ({ purchaseId, prodId, price, description, count }, currentUserId) => {

  const comId = GetEmpresaIdByUser(currentUserId)
  const product = await prisma.products.findFirst({ where: { proKey: prodId, proComId: comId } })
  const purchasesdetails = await prisma.purchasesdetails.create({
    data: {
      pudPurId: Number(purchaseId),
      pudUseId: userId,
      pudProdId: Number(product.proId),
      pudProdPrice: Number(price),
      pudProdDescription: description,
      pudProdCount: Number(count)
    },
  });

  const purchase = await getById(purchaseId)
  return purchase;
};
