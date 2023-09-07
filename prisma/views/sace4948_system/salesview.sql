SELECT
  `sace4948_system`.`sales`.`salId` AS `salId`,
  `sace4948_system`.`sales`.`salCreatedAt` AS `salCreatedAt`,
  `sace4948_system`.`sales`.`salUpdatedAt` AS `salUpdatedAt`,
  `sace4948_system`.`sales`.`salDeleted` AS `salDeleted`,
  `sace4948_system`.`sales`.`salDate` AS `salDate`,
  `sace4948_system`.`sales`.`salLiteral` AS `salLiteral`,
  `sace4948_system`.`sales`.`salComId` AS `salComId`,
  `sace4948_system`.`sales`.`salCliId` AS `salCliId`,
  `sace4948_system`.`sales`.`salClose` AS `salClose`,
  `sace4948_system`.`sales`.`salUseId` AS `salUseId`,
  `sace4948_system`.`sales`.`salKey` AS `salKey`,
  `sace4948_system`.`sales`.`salDescuento` AS `salDescuento`,
(
    SELECT
      `GETTOTALNOTESALES`(`sace4948_system`.`sales`.`salId`)
  ) AS `total`,
(
    SELECT
      `GETTOTALDESCUENTO`(`sace4948_system`.`sales`.`salId`)
  ) AS `totalDesc`,
(
    SELECT
      `TOTALWITHDESC`(`sace4948_system`.`sales`.`salId`)
  ) AS `totalWithDesc`,
(
    SELECT
      `GETTOTALPAYMENT`(`sace4948_system`.`sales`.`salId`)
  ) AS `totalPayment`,
(
    SELECT
      `GETTOTALDUEBYSALID`(`sace4948_system`.`sales`.`salId`)
  ) AS `due`,
  `sace4948_system`.`clients`.`cliFirstName` AS `cliFirstName`,
  `sace4948_system`.`clients`.`cliLastName` AS `cliLastName`,
  `sace4948_system`.`clients`.`cliKey` AS `cliKey`,
  `sace4948_system`.`rutes`.`rutName` AS `rutName`,
  IF(
    (
      SELECT
        `GETTOTALDUEBYSALID`(`sace4948_system`.`sales`.`salId`) <> 0
    ),
    1,
    0
  ) AS `hasDeuda`
FROM
  (
    (
      `sace4948_system`.`sales`
      JOIN `sace4948_system`.`clients` ON(
        `sace4948_system`.`sales`.`salCliId` = `sace4948_system`.`clients`.`cliId`
      )
    )
    JOIN `sace4948_system`.`rutes` ON(
      `sace4948_system`.`rutes`.`rutId` = `sace4948_system`.`clients`.`cliRutId`
    )
  )