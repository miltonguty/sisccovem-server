/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetCompanyIdByUser, GetCurrentUserId } from "../lib/utils.js";
export const get = async (req, res) => {

  const { filter } = req.query;
  let filterObject = {}

  if (filter) {
    filterObject = {
      where: {
        purId: {
          contains: filter,
        },
      }
    }
  };

  const purchases = await prisma.purchases.findMany(filterObject);
  const result = purchases.map(item =>
  ({
    id: item.purId,
    purDate: item.purDate,
    purTotal: item.purTotal,
    comId: item.purComId
  }))
  return result;

};
export const getById = async (req, res) => {

  const { purId } = req.query;
  let result = null
  if (purId) {
    const Purchase = await prisma.purchases.findFirst({
      where: { purId: purId },
    });
    result = {
      id: Purchase.purId,
      date: Purchase.purDate,
      total: Purchase.purTotal,
      comId: Purchase.purComId
    }
  }
  return result;

};
export const add = async (req, res) => {

  const userId = GetCurrentUserId()
  const ComId = GetCompanyIdByUser(userId)

  const Purchase = await prisma.purchases.create({
    data: { purComId: ComId },
  });

  let purchaseDetailsupdated = await prisma.purchasesDetails.updateMany({
    where: { pudUseId: userId, pudPurId: null },
    data: { pudPurId: Purchase.purId }
  }
  )

  return Purchase;

};
export const update = async (req, res) => {
  const { id, ComId } = req.body;
  const PurchaseUpdate = await prisma.purchases.update({
    where: { purId: id },
    data: { purComId: ComId },
  });
  return PurchaseUpdate

};
export const remove = async (req, res) => {
  const { purId } = req.query;
  const PurchaseDelete = await prisma.purchases.update({
    where: { purId: purId },
    data: { purDeleted: true },
  });
  const purchasesDetailsDelete = await prisma.purchasesDetails.update({
    where: { pudId: purId },
    data: { pudDeleted: true },
  });
  return { purchase: PurchaseDelete, purchaseDetails: purchasesDetailsDelete };

};
