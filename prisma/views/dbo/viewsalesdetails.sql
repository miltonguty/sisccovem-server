SELECT
  sadId,
  sadKey,
  sadSubTotal,
  salLastItem,
  sadSalId,
  sadUseId,
  sadProdCount,
  sadProdPrice,
  sadProdDescription,
  sadProdId,
  proKey,
  sadDeleted
FROM
  salesdetails
  JOIN products ON sadProdId = proId;