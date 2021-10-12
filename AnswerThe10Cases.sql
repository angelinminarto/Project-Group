
--NAMA =
--2301850550 - ANGELIN MINARTO
--2301857260 - YOHANES RAJABASA
--2301904036 - SAYYID AHMAD SIDQI
--2301871100 - TRIADI WICAKSANA

--START

--1.
SELECT  [StaffName] = s.[Name],
		[StaffPositionName] = sp.[Name],
		[Total Activity] = COUNT(s.ID)
FROM Staff s
	JOIN StaffPosition sp 
	ON s.StaffPositionID = sp.ID
	JOIN PurchaseTransaction pt 
	ON s.[ID] = pt.IDStaff
	JOIN ServicesTransaction st 
	ON s.[ID] = st.IDStaff
WHERE s.Salary BETWEEN 1000000 AND 4000000
		GROUP BY s.[Name] , sp.[Name]
	HAVING COUNT(s.ID) > 2

--2.
SELECT  [CustomerID] = C.[ID],
		[CustomerName] = C.[Name],
		[Pax Bought] = SUM(st.Pax)
FROM Customer C
	JOIN ServicesTransaction st 
	ON C.[ID] = st.CustomerID
WHERE C.Gender = 'M' AND 
	  DATEPART(MONTH,st.[Date]) BETWEEN 1 AND 6
		GROUP BY C.[ID], C.[Name]

--3.
SELECT  [IngredientName] = i.[Name],
		[Ingredient Bought] = SUM(Quantity),
		[Purchase Count] = COUNT(pt.ID),
		[Total Expenses] = SUM(Quantity)*Price
FROM Ingredient i
JOIN PurchaseTransactionDetail pd
ON pd.IngredientID = i.[ID]
JOIN PurchaseTransaction pt
ON pd.PurchaseTransactionID = pt.[ID]
WHERE	DATEPART(MONTH,PurchaseDate) %2 = 0
		AND DATEPART(DAY,PurchaseDate) BETWEEN 2 AND 5
GROUP BY i.[Name], Price

--4.
SELECT	[Staff First Name] = SUBSTRING(s.[Name], 1, CHARINDEX(' ', s.[Name])),
		[Transaction Count] = COUNT(s.[Name]),
		[Pax Sold] = SUM(Pax)
FROM Staff s
JOIN ServicesTransaction st
ON st.IDStaff = s.[ID]
WHERE	CAST(SUBSTRING(s.[ID],3,3) AS INT) %2 = 0 
		AND CAST(SUBSTRING(CustomerID,3,3) AS INT) %2 != 0
GROUP BY s.[Name]

--5.
SELECT
	'Vendor Name' = RIGHT(v.[Name], LEN(v.[Name]) - 3),
	'IngredientName' = i.[Name],
	'Ingredient Price' = 'Rp. ' + CAST(i.[Price] AS VARCHAR)
FROM PurchaseTransactionDetail ptd, PurchaseTransaction pt, Vendor v, Ingredient i,
	(
		SELECT 'AVGdient' = AVG(i.Price)
		FROM Ingredient i
	) AS AItable
WHERE ptd.PurchaseTransactionID = pt.[ID]
	AND v.ID = pt.VendorID
	AND i.ID = ptd.IngredientID
	AND i.Stock < 250 
	AND i.Price >= AItable.AVGdient

--6.
SELECT
	'CustomerName' = c.[Name],
	'TransactionDate' = CONVERT(VARCHAR, st.[Date], 107),
	'MenuName' = m.[Name],
	'MenuPrice' = m.Price,
	'Brief Description' =  CASE WHEN CHARINDEX(' ', m.[Description],CHARINDEX(' ',m.[Description],0)+1) > 0
						   THEN LEFT(m.[Description],CHARINDEX(' ', m.[Description],CHARINDEX(' ',m.[Description],0)+1))
						   ELSE m.[Description] END,
	'Pax' = st.Pax,
	'Total Price' = m.Price * st.Pax
FROM ServicesTransactionDetail std, ServicesTransaction st, Customer c, Menu m,
		(
			SELECT 'AVGmenu' = AVG(Price)
			FROM Menu
		) AS AVGMenu
WHERE st.ID = std.ServicesTransactionID
	AND c.ID = st.CustomerID 
	AND std.MenuID = m.ID
	AND St.Pax > 100 
	AND m.Price > AVGMenu.AVGmenu

--7.
SELECT
	'Staff Name' = UPPER(s.[Name]),
	'Purchase Date' = CONVERT(VARCHAR, pt.PurchaseDate, 107),
	'Quantity Bought' = CAST(pt.Quantity AS VARCHAR) + 'pcs'
FROM PurchaseTransactionDetail ptd, PurchaseTransaction pt, Staff s, Ingredient i, 
		(
			SELECT 'HargaMax' = MAX(Price)
			FROM Ingredient
		) AS MaxPrice
WHERE ptd.PurchaseTransactionID = pt.ID
	  AND pt.IDStaff = s.ID
	  AND i.ID = ptd.IngredientID
	  AND DATEPART(MONTH,pt.PurchaseDate) % 2 = 0 
	  AND i.Price < MaxPrice.HargaMax
ORDER BY pt.PurchaseDate

--8.
SELECT  [CustomerName] = c.[Name],
		Email = LEFT(Email,CHARINDEX('@',Email)-1),
		[Menu Name] = LOWER(m.[Name]),
		[Pax Bought] = SUM(Pax)
FROM Customer c, ServicesTransaction st, ServicesTransactionDetail sd, Menu m,
		(
				SELECT 'AVGPax' = AVG(Pax), ID
				FROM ServicesTransaction
				GROUP BY ID
		) AS AVGtable
WHERE st.CustomerID = c.ID
	AND sd.ServicesTransactionID = st.ID
	AND m.ID = sd.MenuID
	AND c.Gender = 'M'
	AND Pax >= AVGtable.AVGPax
GROUP BY c.[Name],c.Email,m.[Name]

--9.
GO
CREATE VIEW LoyalCustomerView
AS
SELECT  [CustomerName] = c.[Name],
		[Total Transaction] = COUNT(c.[ID]),
		[Total Pax Purchased] = SUM(Pax),
		[Total Price] = SUM(Pax*Price)
FROM Customer c
	JOIN ServicesTransaction st
	ON st.CustomerID = c.ID
	JOIN ServicesTransactionDetail sd
	ON sd.ServicesTransactionID = st.ID
	JOIN Menu m
	ON m.ID = sd.MenuID
WHERE c.Gender = 'F'
		GROUP BY c.[Name]
	HAVING COUNT(c.[ID]) > 2
GO
SELECT * FROM LoyalCustomerView

--10.
GO
CREATE VIEW VendorRecapView
AS
SELECT  [VendorName] = v.[Name],
		[Purchases Made] = COUNT(v.ID),
		[Ingredients Purchased] = SUM(Quantity)
FROM Vendor v
	JOIN PurchaseTransaction pt
	ON pt.VendorID = v.ID
	JOIN PurchaseTransactionDetail pd
	ON pd.PurchaseTransactionID = pt.ID
	JOIN Ingredient i
	ON i.ID = pd.IngredientID
WHERE Stock > 150
		GROUP BY v.[Name]
	HAVING COUNT(v.ID) > 1
GO
SELECT * FROM VendorRecapView

-- END