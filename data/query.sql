SELECT
  *,
  CAST(female as float) / CAST(male as FLOAT) as ratio
FROM
  (
    SELECT
      `Geographic name` as `name`,
      `Median amount (2015 constant dollars) - 2015` as female
    FROM
      data/provincial.csv
    WHERE
      Sex = "Females"
      AND `Income source` = "Total income"
  ) NATURAL JOIN (
    SELECT
      `Geographic name` as `name`,
      `Median amount (2015 constant dollars) - 2015` as male
    FROM
      data/provincial.csv
    WHERE
      Sex = "Males"
      AND `Income source` = "Total income"
  )
WHERE
  name != "Canada"