SELECT
  cliId,
  cliCreatedAt,
  cliUpdatedAt,
  cliDeleted,
  cliFirstName,
  cliLastName,
  cliEmail,
  cliPhone,
  cliComId,
  cliKey,
  cliRutId,
  (
    SELECT
      ISNULL(SUM(salTotalWithDesc), 0) AS deuda
    FROM
      dbo.sales
    WHERE
      (salCliId = dbo.clients.cliId)
  ) AS deuda
FROM
  dbo.clients;