/*** CONTROLLER*/
import prisma from "../lib/prisma";
import { GetCompanyIdByUser } from "../lib/utils";
export const get = async (req, res) =>
{

  const { filter } = req.query;
  const comId = GetCompanyIdByUser()
  let filterObject = {
    where: {
      proComId: Number(comId)
    }
  }

  if (filter)
  {
    filterObject = {
      where: {
        proDescription: {
          contains: filter,
        },
      }
    }
  };

  const products = await prisma.products.findMany(filterObject);
  const result = products.map(item =>
  ({
    id: item.proId,
    description: item.proDescription,
    priceSales: item.proPriceSales,
    pricePurchase: item.proPricePurchase,
    image: item.proImage,
    supId: item.proSupId,
    proId: item.proproId,
    stock: item.proStock,
  }))
  return result;

};
export const getById = async (req, res) =>
{
  const { proId } = req.query;
  const comId = GetCompanyIdByUser()
  let result = null
  if (proId)
  {
    const Product = await prisma.products.findFirst({
      where: {
        proId: proId,
        proComId: Number(comId)
      },
    });
    result = {
      id: Product.proId,
      description: Product.proDescription,
      priceSales: Product.proPriceSales,
      pricePurchase: Product.proPricePurchase,
      image: Product.proImage,
      supId: Product.proSupId,
      stock: Product.proStock,

    }
  }
  return result;

};
export const add = async (req, res) =>
{
  const comId = GetCompanyIdByUser()
  const { description, priceSales, pricePurchase, image, supId } = req.body;
  const Product = await prisma.products.create({
    data: {
      proDescription: description,
      proPriceSales: Number(priceSales),
      proPricePurchase: Number(pricePurchase),
      proImage: image,
      proSupId: Number(supId),
      proComId: Number(comId),
      proStock: 0
    },
  });
  return Product;

};
export const update = async (req, res) =>
{

  const { id, description, priceSales, pricePurchase, image, supId, stock } = req.body;
  const ProductUpdate = await prisma.products.update({
    where: { proId: id },
    data: {
      proDescription: description,
      proPriceSales: Number(priceSales),
      proPricePurchase: Number(pricePurchase),
      proImage: image,
      proSupId: Number(supId),
      proStock: Number(stock)
    },
  });
  return ProductUpdate;

};
export const remove = async (req, res) =>
{
  const { proId } = req.query;
  const comId = GetCompanyIdByUser()
  const ProductDelete = await prisma.products.update({
    where: { proId: Number(proId), proComId: Number(comId) },
    data: { proDeleted: true }
  });
  return ProductDelete;

};
