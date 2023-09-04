SELECT
  `sace4948_system`.`clients`.`cliId` AS `cliId`,
  `sace4948_system`.`clients`.`cliCreatedAt` AS `cliCreatedAt`,
  `sace4948_system`.`clients`.`cliUpdatedAt` AS `cliUpdatedAt`,
  `sace4948_system`.`clients`.`cliDeleted` AS `cliDeleted`,
  `sace4948_system`.`clients`.`cliFirstName` AS `cliFirstName`,
  `sace4948_system`.`clients`.`cliLastName` AS `cliLastName`,
  `sace4948_system`.`clients`.`cliEmail` AS `cliEmail`,
  `sace4948_system`.`clients`.`cliPhone` AS `cliPhone`,
  `sace4948_system`.`clients`.`cliComId` AS `cliComId`,
  `sace4948_system`.`clients`.`cliKey` AS `cliKey`,
  `sace4948_system`.`clients`.`cliRutId` AS `cliRutId`,
(
    SELECT
      `GETTOTALWITHDUE`(`sace4948_system`.`clients`.`cliId`)
  ) AS `deuda`
FROM
  `sace4948_system`.`clients`