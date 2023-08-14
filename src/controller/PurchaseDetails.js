/*** CONTROLLER*/
import { FALSE } from "../constants";
import prisma from "../lib/prisma";
import { GetCurrentUserId } from "../lib/utils";

export const get = async (req, res) => {

  const userId = GetCurrentUserId()
  const { filter } = req.query;
  let filterObject = {
    where: {
      pudUseId: userId,
      pudPurId: null,
      pudDeleted: FALSE
    }
  }

  if (filter) {
    filterObject = {
      where: {
        pudDeleted: FALSE,
        pudCounter: {
          contains: filter,
          pudUseId: userId,
          pudPurId: null
        },
      }
    }
  };

  const purchasesdetails = await prisma.purchasesdetails.findMany(filterObject);
  const result = purchasesdetails.map(item =>
  ({
    id: item.pudId,
    Counter: item.pudCounter,
    ProdId: item.pudProdId,
    ProdDescription: item.pudProdDescription,
    ProdPrice: item.pudProdPrice,
    ProdCount: item.pudProdCount,
    ProdSubTotal: item.pudProdSubTotal,

  }))
  return result;

};

export const getById = async (req, res) => {
  const { pudId } = req.query;
  let result = null
  if (pudId) {


    const PurchasesDetail = await prisma.purchasesdetails.findFirst({
      where: { pudId: pudId },
    });
    result = {
      id: PurchasesDetail.pudId,
      counter: PurchasesDetail.pudCounter,
      proId: PurchasesDetail.pudProdId,
      price: PurchasesDetail.pudProdprice,
      count: PurchasesDetail.pudProdCount,
      subTotal: PurchasesDetail.pudProdSubTotal,
    }
  }
  return result;


};
export const add = async (req, res) => {
  const PurchasesDetailCreated = await CreateUpdatePurchaseDetails(req, res)
  return PurchasesDetailCreated;

};
export const update = async (req, res) => {
  const PurchasesDetailUpdate = await CreateUpdatePurchaseDetails(req, res)
  return PurchasesDetailUpdate;

};
export const updatePriceCount = async (req, res) => {



  const { pudId } = req.query;
  const { price, count, } = req.body;
  const PurchasesDetailUpdate = await prisma.purchasesdetails.update({
    where: { pudId: pudId },
    data: {
      pudProdCount: Number(count), pudProdPrice: price
    },
  });

  return PurchasesDetailUpdate;

};
export const remove = async (req, res) => {
  const { pudId } = req.query;

  const PurchasesDetailDelete = await prisma.purchasesdetails.delete({
    where: { pudId: pudId },
  });
  return PurchasesDetailDelete;

};

const CreateUpdatePurchaseDetails = async (req, res) => {
  const userId = GetCurrentUserId()
  const { id, proId, count, } = req.body;
  const PurchasesDetail = await prisma.purchasesdetails.findFirst({
    where: { pudProdId: proId, pudUseId: userId, pudDeleted: FALSE },
  });
  const product = await prisma.Products.findFirst({
    where: { proId: proId },
  });

  let PurchasesDetailUpdate = {}
  if (PurchasesDetail) {
    PurchasesDetailUpdate = await prisma.purchasesdetails.update({
      where: { pudId: PurchasesDetail.pudId },
      data: {
        pudProdCount: Number(PurchasesDetail.pudProdCount) + Number(count)
      },
    });

  } else {
    PurchasesDetailUpdate = await prisma.purchasesdetails.create({
      data: {
        pudProdId: proId,
        pudProdPrice: product.proPricePurchase,
        pudProdCount: count,
        pudUseId: userId,
        pudProdDescription: product.proDescription
      },
    })
  }

}