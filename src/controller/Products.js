/*** CONTROLLER*/
import { TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const get = async ({ description }) => {


  const comId =GetEmpresaIdByUser()
  let filter = {
    where: {
      proComId: Number(comId)
    }
  }
  const orConditions = []
  if (description) {
    orConditions.push(
      {
        proDescription: {
          contains: description,
        }
      })
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }



  const products = await prisma.products.findMany(filter);
  const result = products.map(item =>
  ({
    id: item.proKey,
    description: item.proDescription,
    priceSales: item.proPriceSales,
    pricePurchase: item.proPricePurchase,
    image: item.proImage,
    proId: item.proproId,
    stock: item.proStock,
  }))
  return result

};
export const getById = async (proKey) => {

  const comId = GetEmpresaIdByUser()
  let result = null
  if (proKey) {
    const Product = await prisma.products.findFirst({
      where: {
        proKey: proKey,
        proComId: Number(comId)
      },
    });
    result = {
      id: Product.proKey,
      description: Product.proDescription,
      priceSales: Product.proPriceSales,
      pricePurchase: Product.proPricePurchase,
      image: Product.proImage,
      stock: Product.proStock,

    }
  }
  return result;

};
export const add = async ({ description, priceSales, pricePurchase, image, supId }) => {
  const comId = GetEmpresaIdByUser()

  const Product = await prisma.products.create({
    data: {
      proDescription: description,
      proPriceSales: Number(priceSales),
      proPricePurchase: Number(pricePurchase),
      proImage: image,
      proComId: Number(comId),
      proStock: 0
    },
  });
  return Product;

};
export const update = async ({ id, description, priceSales, pricePurchase, image, supId, stock }) => {


  const ProductUpdate = await prisma.products.updateMany({
    where: { proKey: id },
    data: {
      proDescription: description,
      proPriceSales: Number(priceSales),
      proPricePurchase: Number(pricePurchase),
      proImage: image,
      proStock: Number(stock)
    },
  });
  return ProductUpdate;

};
export const remove = async (proKey) => {

  const comId = GetEmpresaIdByUser()
  const ProductDelete = await prisma.products.updateMany({
    where: { proKey: proKey, proComId: Number(comId) },
    data: { proDeleted: TRUE }
  });
  return ProductDelete;

};
