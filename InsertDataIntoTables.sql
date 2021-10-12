
--NAMA =
--2301850550 - ANGELIN MINARTO
--2301857260 - YOHANES RAJABASA
--2301904036 - SAYYID AHMAD SIDQI
--2301871100 - TRIADI WICAKSANA

--START

INSERT INTO StaffPosition
VALUES('SP001','CEO'),('SP002','Supervisor'),('SP003','Marketing'),('SP004','Treasure')
INSERT INTO StaffPosition
VALUES('SP005','Head Chef'),('SP006','Secretary'),('SP007','Promotion'),('SP009','Chef')
INSERT INTO StaffPosition
VALUES('SP008','Inventory Manager'),('SP010','Cashier')
SELECT * FROM StaffPosition

INSERT INTO Staff
VALUES('ST001','SP001','Veronika Angel','F','stva01@gmail.com','081234567891','5000000')
INSERT INTO Staff
VALUES('ST002','SP002','Yohanes Sitorus','M','stys02@yahoo.com','081987654321','4000000')
INSERT INTO Staff
VALUES('ST003','SP003','Veve Angel','F','stva03@gmail.com','082143658791','2000000')
INSERT INTO Staff
VALUES('ST004','SP004','Sitorus Yohan','M','stsy04@yahoo.com','081324576891','500000')
INSERT INTO Staff
VALUES('ST005','SP005','Johanes Juanto','M','stjj05@yahoo.com','089182736451','1000000')
INSERT INTO Staff
VALUES('ST006','SP006','Saras Lina','F','stsl06@gmail.com','081123456789','1000000')
INSERT INTO Staff
VALUES('ST007','SP007','Yunita Yobed','F','styy07@gmail.com','089912345678','900000')
INSERT INTO Staff
VALUES('ST008','SP008','Angel Lim','F','stal08@gmail.com','082213456789','500000')
INSERT INTO Staff
VALUES('ST009','SP009','Angelica Lim','F','stal09@gmail.com','084352617891','800000')
INSERT INTO Staff
VALUES('ST010','SP010','Lim Sam','M','stls10@yahoo.com','087899123456','500000')
SELECT * FROM Staff

INSERT INTO Customer
VALUES('CU001','Susan','087700112234','Jl. Cusan no.1','F','susan@gmail.com'),('CU002','Nabila','086588770098','Jl. Cuban no.2','F','nabila@gmail.com'),('CU003','Hafis','081222278907','Jl. Cuhas no.3','M','hafis@yahoo.com')
INSERT INTO Customer
VALUES('CU004','Naufal','085466738291','Jl. Cunau no.4','M','naufal@yahoo.com'),('CU005','Michael','081346667989','Jl. Cumihel no.5','M','michael@yahoo.com'),('CU006','Brian','088223746283','Jl. Cubrin no.6','M','brian@yahoo.com')
INSERT INTO Customer
VALUES('CU007','Bryan','087464244474','Jl. Cubrya no.7','M','bryan@yahoo.com'),('CU008','Veve','089988866677','Jl. Cuvev no.8','F','veve@gmail.com'),('CU009','Rizki','087888863526','Jl. Curiz no.9','M','rizki@yahoo.com')
INSERT INTO Customer
VALUES('CU010','Yohanes','087234566728','Jl. Cuyon no.10','M','yohanes@yahoo.com')
SELECT * FROM Customer

INSERT INTO Menu
VALUES('ME001','French Fries','Di Goreng',10000),('ME002','Nasi Goreng','Di Goreng',35000),('ME003','Bihun Goreng','Di Goreng',30000)
INSERT INTO Menu
VALUES('ME004','Nasi Tim','Di Tim/Kukus',45000),('ME005','Roti Bakar','Di Bakar',15000),('ME006','Pisang Bakar','Di Bakar',15000),('ME007','Roti Goreng','Di Goreng',10000)
INSERT INTO Menu
VALUES('ME008','Nasi Bakar','Di Bakar',24500)
INSERT INTO Menu
VALUES('ME009','Soto Ayam','Kuah Kaldu',20000),('ME010','Gulai Ayam','Kuah Santan',25000)
SELECT * FROM Menu

INSERT INTO Vendor
VALUES('VE001','PT.Ruben','088890007892','Jl. Veben no.1'),('VE002','PT.Setiawan','087122345783','Jl. Vesen no.2'),('VE003','PT.Indira','089373245647','Jl. Venra no.3'),('VE004','PT.Josephine','081212121289','Jl. Vepin no.4')
INSERT INTO Vendor
VALUES('VE005','PT.Piyu','082121212678','Jl. Veiyu no.5'),('VE006','PT.Putih','087777777889','Jl. Vetih no.6'),('VE007','PT.Mawar','082301560726','Jl. Vewar no.7')
INSERT INTO Vendor
VALUES('VE008','PT.Mita','082444489027','Jl. Veta no.8'),('VE009','PT.Mitha','081126273501','Jl. Vetha no.9'),('VE010','PT.Rita','087826452271','Jl. Veita no.10')
SELECT * FROM Vendor

INSERT INTO Ingredient
VALUES('ID001','Ayam','108',800000),('ID002','Bawang Goreng','122',22000),('ID003','Tomat','112',15000),('ID004','Nasi Putih','114',140000),('ID005','Daging Sapi','124',240000)
INSERT INTO Ingredient
VALUES('ID006','Roti','120',26000),('ID007','Pisang','124',24700),('ID008','Bihun','110',18000),('ID009','Kentang','116',160000),('ID010','Minyak','130',300000)
INSERT INTO Ingredient
VALUES('ID011','Bawang Putih','200',800000)
SELECT * FROM Ingredient

INSERT INTO PurchaseTransaction
VALUES('PU001','2019/09/15',18,'ST001','VE001')
INSERT INTO PurchaseTransaction
VALUES('PU002','2019/02/19',16,'ST002','VE002'),('PU003','2019/01/23',36,'ST003','VE003')
INSERT INTO PurchaseTransaction
VALUES('PU004','2019/08/02',28,'ST004','VE004'),('PU005','2019/09/25',16,'ST005','VE005')
INSERT INTO PurchaseTransaction
VALUES('PU006','2019/06/02',18,'ST006','VE006'),('PU007','2019/05/25',8,'ST007','VE007')
INSERT INTO PurchaseTransaction
VALUES('PU008','2020/06/26',28,'ST008','VE008'),('PU009','2020/08/28',24,'ST009','VE009')
INSERT INTO PurchaseTransaction
VALUES('PU010','2020/09/29',12,'ST010','VE010')
INSERT INTO PurchaseTransaction
VALUES('PU011','2019/09/05',18,'ST003','VE001')
INSERT INTO PurchaseTransaction
VALUES('PU012','2019/09/25',18,'ST003','VE001')
INSERT INTO PurchaseTransaction
VALUES('PU013','2019/09/05',18,'ST003','VE001')
INSERT INTO PurchaseTransaction
VALUES('PU014','2019/02/19',16,'ST002','VE002')
INSERT INTO PurchaseTransaction
VALUES('PU015','2019/02/19',16,'ST002','VE002')
SELECT * FROM PurchaseTransaction

INSERT INTO ServicesTransaction
VALUES('TR001','TRK1','Jl. Kenanga no.1','ST001','CU001',18,'2020/01/15'),('TR002','TRM2','Jl. Mawar  no.2','ST002','CU002',112,'2020/01/20')
INSERT INTO ServicesTransaction
VALUES('TR003','TRO3','Jl. Orion no.3','ST003','CU003',110,'2020/02/25'),('TR004','TRG4','Jl. Garlic no.4','ST004','CU004',14,'2020/02/28')
INSERT INTO ServicesTransaction
VALUES('TR005','TRP5','Jl. Pepper no.5','ST005','CU005',16,'2020/03/15'),('TR006','TRS6','Jl. Salt no.6','ST006','CU006',18,'2020/03/22')
INSERT INTO ServicesTransaction
VALUES('TR007','TRW7','Jl. Wagyu no.7','ST007','CU007',114,'2020/04/24'),('TR008','TRK8','Jl. Korean no.8','ST008','CU008',116,'2020/04/28')
INSERT INTO ServicesTransaction
VALUES('TR009','TRJ9','Jl. Japan no.9','ST009','CU009',14,'2020/05/26'),('TR010','TRO10','Jl. Original no.10','ST010','CU010',16,'2020/05/28')
INSERT INTO ServicesTransaction
VALUES('TR011','TRK1','Jl. Kenanga no.1','ST001','CU002',18,'2020/01/14')
INSERT INTO ServicesTransaction
VALUES('TR012','TRK1','Jl. Kenanga no.1','ST002','CU001',18,'2020/01/25')
INSERT INTO ServicesTransaction
VALUES('TR013','TRK1','Jl. Kenanga no.1','ST002','CU001',18,'2019/02/28')
INSERT INTO ServicesTransaction
VALUES('TR014','TRO3','Jl. Orion no.3','ST003','CU003',110,'2020/02/05')
INSERT INTO ServicesTransaction
VALUES('TR015','TRO3','Jl. Orion no.3','ST003','CU003',110,'2020/02/20')
SELECT * FROM ServicesTransaction

INSERT INTO PurchaseTransactionDetail
VALUES('PU001','ID001'),('PU002','ID002'),('PU003','ID003'),('PU004','ID004'),('PU005','ID005'),('PU006','ID006'),('PU007','ID007'),('PU008','ID008'),('PU009','ID009'),('PU010','ID010')
INSERT INTO PurchaseTransactionDetail
VALUES('PU011','ID011')
INSERT INTO PurchaseTransactionDetail
VALUES('PU012','ID011')
INSERT INTO PurchaseTransactionDetail
VALUES('PU013','ID002')
INSERT INTO PurchaseTransactionDetail
VALUES('PU014','ID002')
INSERT INTO PurchaseTransactionDetail
VALUES('PU015','ID002')
INSERT INTO PurchaseTransactionDetail
VALUES('PU013','ID002')
INSERT INTO PurchaseTransactionDetail
VALUES('PU014','ID002')
INSERT INTO PurchaseTransactionDetail
VALUES('PU015','ID002')
INSERT INTO PurchaseTransactionDetail
VALUES('PU002','ID008')
INSERT INTO PurchaseTransactionDetail
VALUES('PU004','ID006')
INSERT INTO PurchaseTransactionDetail
VALUES('PU006','ID008')
INSERT INTO PurchaseTransactionDetail
VALUES('PU015','ID006')
INSERT INTO PurchaseTransactionDetail
VALUES('PU012','ID008')
INSERT INTO PurchaseTransactionDetail
VALUES('PU008','ID006')
INSERT INTO PurchaseTransactionDetail
VALUES('PU010','ID008')
SELECT * FROM PurchaseTransactionDetail

INSERT INTO ServicesTransactionDetail
VALUES('TR001','ME001'),('TR002','ME002'),('TR003','ME003'),('TR004','ME004'),('TR005','ME005'),('TR006','ME006'),('TR007','ME007'),('TR008','ME008'),('TR009','ME009'),('TR010','ME010')
INSERT INTO ServicesTransactionDetail
VALUES('TR011','ME001')
INSERT INTO ServicesTransactionDetail
VALUES('TR012','ME001')
INSERT INTO ServicesTransactionDetail
VALUES('TR013','ME001')
INSERT INTO ServicesTransactionDetail
VALUES('TR014','ME002'),('TR015','ME002'),('TR011','ME002'),('TR012','ME003'),('TR013','ME003'),('TR014','ME003')
INSERT INTO ServicesTransactionDetail
VALUES('TR015','ME004'),('TR011','ME004'),('TR012','ME004'),('TR013','ME005'),('TR014','ME005')
INSERT INTO ServicesTransactionDetail
VALUES('TR015','ME005')
SELECT * FROM ServicesTransactionDetail

--END