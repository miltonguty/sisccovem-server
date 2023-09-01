SELECT
  salId,
  salCreatedAt,
  salUpdatedAt,
  salDeleted,
  salDate,
  salLiteral,
  salComId,
  salCliId,
  salClose,
  salUseId,
  salKey,
  salDescuento,
  total = (
    SELECT
      isnull(sum(sadSubTotal), 0) AS totalNote
    FROM
      salesdetails
    WHERE
      sadSalId = sales.salId
      AND sadDeleted = 0
  ),
  totalDesc = (
    (
      salDescuento * (
        SELECT
          isnull(sum(sadSubTotal), 0) AS totalNote
        FROM
          salesdetails
        WHERE
          sadSalId = sales.salId
          AND sadDeleted = 0
      )
    ) / 100
  ),
  totalWithDesc = (
    SELECT
      isnull(sum(sadSubTotal), 0) AS totalNote
    FROM
      salesdetails
    WHERE
      sadSalId = sales.salId
      AND sadDeleted = 0
  ) - (
    (
      salDescuento * (
        SELECT
          isnull(sum(sadSubTotal), 0) AS totalNote
        FROM
          salesdetails
        WHERE
          sadSalId = sales.salId
          AND sadDeleted = 0
      )
    ) / 100
  ),
  totalPayment = (
    SELECT
      ISNULL(SUM(payMount), 0) AS Expr1
    FROM
      dbo.payments
    WHERE
      (paySalId = dbo.sales.salId)
  ),
  due = (
    (
      SELECT
        isnull(sum(sadSubTotal), 0) AS totalNote
      FROM
        salesdetails
      WHERE
        sadSalId = sales.salId
        AND sadDeleted = 0
    ) - (
      (
        salDescuento * (
          SELECT
            isnull(sum(sadSubTotal), 0) AS totalNote
          FROM
            salesdetails
          WHERE
            sadSalId = sales.salId
            AND sadDeleted = 0
        )
      ) / 100
    ) - (
      SELECT
        ISNULL(SUM(payMount), 0) AS Expr1
      FROM
        dbo.payments
      WHERE
        (paySalId = dbo.sales.salId)
    )
  ),
  clients.cliFirstName,
  cliLastName,
  cliKey,
  rutName
FROM
  dbo.sales
  JOIN clients ON sales.salCliId = cliId
  JOIN Rutes ON rutes.rutId = cliRutId;