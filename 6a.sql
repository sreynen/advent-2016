SELECT CONCAT(
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 1, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 2, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 3, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 4, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 5, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 6, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 7, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
  ,
  (SELECT i FROM (SELECT a.i, COUNT(0) AS i_count FROM (SELECT SUBSTRING(value, 8, 1) AS i FROM input) a GROUP BY a.i) b ORDER BY b.i_count DESC LIMIT 1)
) AS output;
