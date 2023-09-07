SELECT
  `sace4948_system`.`products`.`proId` AS `proId`,
  `sace4948_system`.`products`.`procreatedAt` AS `procreatedAt`,
  `sace4948_system`.`products`.`proUpdatedAt` AS `proUpdatedAt`,
  `sace4948_system`.`products`.`proDeleted` AS `proDeleted`,
  `sace4948_system`.`products`.`proDescription` AS `proDescription`,
  `sace4948_system`.`products`.`proPriceSales` AS `proPriceSales`,
  `sace4948_system`.`products`.`proPricePurchase` AS `proPricePurchase`,
  `sace4948_system`.`products`.`proImage` AS `proImage`,
  `sace4948_system`.`products`.`proComId` AS `proComId`,
  `sace4948_system`.`products`.`proStock` AS `proStock`,
  `sace4948_system`.`products`.`proKey` AS `proKey`,
  `sace4948_system`.`products`.`proSecId` AS `proSecId`,
  `sace4948_system`.`sections`.`secId` AS `secId`,
  `sace4948_system`.`sections`.`secKey` AS `secKey`,
  `sace4948_system`.`sections`.`secCreatedAt` AS `secCreatedAt`,
  `sace4948_system`.`sections`.`secUpdateAt` AS `secUpdateAt`,
  `sace4948_system`.`sections`.`secDeleted` AS `secDeleted`,
  `sace4948_system`.`sections`.`secName` AS `secName`,
  `sace4948_system`.`sections`.`secDescription` AS `secDescription`,
  `sace4948_system`.`sections`.`secComId` AS `secComId`
FROM
  (
    `sace4948_system`.`products`
    JOIN `sace4948_system`.`sections` ON(
      `sace4948_system`.`products`.`proSecId` = `sace4948_system`.`sections`.`secId`
    )
  )