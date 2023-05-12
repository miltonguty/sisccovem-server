/*** CONTROLLER*/
import prisma from "../lib/prisma";
import { GetCurrentUserId } from "../lib/utils";

export const get = async (req, res) => {
  try {
    const { filter } = req.query;
    const userId = GetCurrentUserId()
    let filterObject = {
      where: {
        sadUseId: userId,
        sadSalId: null,
        sadDeleted: false,
      }
    }

    if (filter) {
      filterObject = {
        where: {
          sadDeleted: false,
          sadCounter: {
            contains: filter,
          },

        }
      }
    };

    const salesdetails = await prisma.salesdetails.findMany(filterObject);
    const result = salesdetails.map(item =>
    ({
      id: item.sadId,
      Counter: item.sadCounter,
      ProdId: item.sadProdId,
      Prodprice: item.sadProdprice,
      ProdCount: item.sadProdCount,
      ProdSubTotal: item.sadProdSubTotal,
      ProdDescription: item.sadProdDescription

    }))
    res.status(200).json(result);
  } catch (err) {
    console.log(err)
    res.status(404).json({ error: err });
  }
};

export const getById = async (req, res) => {
  try {
    const { pudId } = req.query;
    if (pudId) {
      const SalesDetail = await prisma.salesdetails.findFirst({
        where: { pudId: pudId },
      });
      const result = {
        id: SalesDetail.sadId,
        counter: SalesDetail.sadCounter,
        proId: SalesDetail.sadProdId,
        price: SalesDetail.sadProdprice,
        count: SalesDetail.sadProdCount,
        subTotal: SalesDetail.sadProdSubTotal,
      }
      res.status(200).json(result);

    } else {
      res.status(404).json({ error: "SalesDetail id not provide" });
    }
  } catch (err) {
    console.log(err)
    res.status(404).json({ error: err });
  }
};
export const add = async (req, res) => {
  try {
    const SalesDetailCreated = await CreateUpdatesalesdetails(req, res)
    res.status(200).json(SalesDetailCreated);
  } catch (err) {
    console.log(err)
    res.status(404).json({ error: err });
  }
};
export const update = async (req, res) => {
  try {
    const SalesDetailUpdate = await CreateUpdatesalesdetails(req, res)
    res.status(200).json(SalesDetailUpdate);
  } catch (err) {
    console.log(err)
    res.status(404).json({ error: err });
  }
};
export const remove = async (req, res) => {
  try {
    const { sadId } = req.query;
    const SalesDetailDelete = await prisma.salesdetails.update({
      where: { sadId: sadId },
      data: { sadDeleted: true },
    });
    res.status(200).json(SalesDetailDelete);
  } catch (err) {
    console.log(err)
    res.status(404).json({ error: err });
  }
};

const CreateUpdatesalesdetails = async (req, res) => {
  const { id, proId, count } = req.body;
  const userId = GetCurrentUserId()
  const SalesDetail = await prisma.salesdetails.findFirst({
    where: { sadProdId: proId, sadUseId: userId, sadDeleted: false, sadSalId: null },
  });
  const product = await prisma.Products.findFirst({
    where: { proId: proId },
  });
  let SalesDetailUpdate = {}
  if (SalesDetail) {
    SalesDetailUpdate = await prisma.salesdetails.update({
      where: { sadId: SalesDetail.sadId },
      data: { sadProdCount: Number(SalesDetail.sadProdCount) + Number(count) },
    });

  } else {

    SalesDetailUpdate = await prisma.salesdetails.create({
      data: {
        sadProdId: proId,
        sadProdprice: 7,
        sadProdDescription: product.proDescription,
        sadProdCount: count,
        sadUseId: userId
      },
    })
  }

}