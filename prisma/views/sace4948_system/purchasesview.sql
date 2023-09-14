SELECT
  `sace4948_system`.`purchases`.`purId` AS `purId`,
  `sace4948_system`.`purchases`.`purCreatedAt` AS `purCreatedAt`,
  `sace4948_system`.`purchases`.`purUpdatedAt` AS `purUpdatedAt`,
  `sace4948_system`.`purchases`.`purDeleted` AS `purDeleted`,
  `sace4948_system`.`purchases`.`purDate` AS `purDate`,
  `sace4948_system`.`purchases`.`purTotal` AS `purTotal`,
  `sace4948_system`.`purchases`.`purComId` AS `purComId`,
  `sace4948_system`.`purchases`.`purClose` AS `purClose`,
  `sace4948_system`.`purchases`.`purUseId` AS `purUseId`,
  `sace4948_system`.`purchases`.`purPrvId` AS `purPrvId`,
  `sace4948_system`.`purchases`.`purKey` AS `purKey`,
  `sace4948_system`.`purchases`.`purNumber` AS `purNumber`,
(
    SELECT
      sum(
        `sace4948_system`.`purchasesdetails`.`pudSubTotal`
      ) AS `total`
    FROM
      `sace4948_system`.`purchasesdetails`
    WHERE
      (
        `sace4948_system`.`purchasesdetails`.`pudPurId` = `sace4948_system`.`purchases`.`purId`
      )
  ) AS `total`
FROM
  `sace4948_system`.`purchases`