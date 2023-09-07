/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
import { v4 as uuidv4 } from 'uuid';
export const get = async ({ description }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
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
  const products = await prisma.productsview.findMany(filter);
  const result = products.map(product =>
  ({
    id: product.proKey,
    description: product.proDescription,
    priceSales: product.proPriceSales,
    pricePurchase: product.proPricePurchase,
    image: product.proImage,
    stock: product.proStock,
    sectionKey: product.secKey,
    section: product.secName
  }))
  return result

};
export const getById = async (key, currentUserId) => {
  const ignoreDeleted = FALSE
  const comId = await GetEmpresaIdByUser(currentUserId)
  let result = null
  if (key) {
    let where = {}
    if (ignoreDeleted) {
      where = {
        proKey: key,
        proComId: comId
      }
    } else {
      where = {
        proKey: key,
        proComId: comId,
        proDeleted: FALSE
      }
    }
    const product = await prisma.productsview.findFirst({
      where: where
    });
    result = {
      id: product.proKey,
      description: product.proDescription,
      priceSales: product.proPriceSales,
      pricePurchase: product.proPricePurchase,
      image: product.proImage,
      stock: product.proStock,
      sectionKey: product.secKey,
      section: product.secName
    }
  }
  return result;

};
export const add = async ({ description, priceSales, pricePurchase, image, sectionId }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)
  const section = await prisma.sections.findFirst({ where: { secKey: sectionId } })
  const Product = await prisma.products.create({
    data: {
      proKey: uuidv4(),
      proDescription: description,
      proPriceSales: Number(priceSales),
      proPricePurchase: Number(pricePurchase),
      proImage: image,
      proComId: Number(comId),
      proStock: 0,
      proSecId: section.secId
    },
  });
  const productResult = await getById(Product.proKey, currentUserId)
  return productResult;

};
export const update = async ({ id, description, priceSales, pricePurchase, image, sectionId, stock }, currentUserId) => {
  const comId = await GetEmpresaIdByUser(currentUserId)

  const ProductUpdate = await prisma.products.updateMany({
    where: { proKey: id, proComId: comId },
    data: {
      proDescription: description,
      proPriceSales: Number(priceSales),
      proPricePurchase: Number(pricePurchase),
      proImage: image,
      proStock: Number(stock),
      proSecId: Number(sectionId)
    },
  });
  const productResult = await getById(ProductUpdate.proKey, currentUserId)
  return productResult

};
export const remove = async (proKey, currentUserId) => {

  const comId = await GetEmpresaIdByUser(currentUserId)
  const ProductDelete = await prisma.products.updateMany({
    where: { proKey: proKey, proComId: Number(comId) },
    data: { proDeleted: TRUE }
  });
  const productResult = await getById(proKey, currentUserId)
  return productResult;

};
