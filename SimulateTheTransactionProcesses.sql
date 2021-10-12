
--NAMA =
--2301850550 - ANGELIN MINARTO
--2301857260 - YOHANES RAJABASA
--2301904036 - SAYYID AHMAD SIDQI
--2301871100 - TRIADI WICAKSANA

--START

USE CateringDelVia
--CASE 1 -> SIMULASI TRANSAKSI BELI BARANG UNTUK STOCK PERUSAHAAN
	/*
		Akhir - akhir ini, perusahaan catering yang bernama DelVia berencana untuk menambah dua buah menu baru yaitu mie goreng telur 
		dan mie rebus telur. Namun setelah dilakukan pengecekan terhadap stock bahan makanan yang tersedia, ternyata catering DelVia 
		tidak memiliki persediaan mie goreng dan mie rebus sama sekali.

		Oleh karena itu, pada hari ini(6 Des 2020), catering DelVia berencana untuk membeli mie rebus dan mie goreng yang berjumlah masing - masing 
		40 bungkus kepada PT. Indira (VE003) sebagai vendor penyedia bahan makanan.
	*/

	--SIMULASI TRANSAKSI

	--1
	--Perusahaan catering DelVia menambahkan item mie goreng (ID013) dan mie rebus (ID014) ke dalam ranjang pembelian seharga masing - masing
	--9K dan 11K
	INSERT INTO Ingredient
	VALUES('ID013','Mie Goreng',40,9000), ('ID014','Mie Rebus',40,11000)

	--2
	--Catering DelVia melakukan pembayaran terhadap barang yang dibeli
	GO
	INSERT INTO PurchaseTransaction
	VALUES('PU023','2020-12-06',40,'ST010','VE003'), ('PU024','2020-12-06',40,'ST010','VE003')

	GO
	INSERT INTO PurchaseTransactionDetail
	VALUES('PU023','ID013'), ('PU024','ID014')

	--3
	--Catering DelVia menambah menu baru yaitu
		-- * Mie Goreng Telur (ME011) -> 15000
		-- * Mie Rebus Telur (ME012) -> 12000
	--kedalam daftar menu
	GO
	INSERT INTO Menu
	VALUES('ME011','Mie Goreng Telur','Di Goreng',15000), ('ME012','Mie Rebus Telur','Di Rebus',12000)

--CASE 2 -> SIMULASI TRANSAKSI JUAL KEPADA CUSTOMER
	/*
		Seorang customer bernama Rizky (CU009) sedang menikmati liburan natal 2020 dan tahun baru 2021.
		Namun liburan ini sangat berbeda karena terpaksa dilakukan dirumah akibata pandemmi.
		Oleh karena itu, Rizky melakukan hobi yang sangat digemarinya untuk menghilangkan rasa bosan.

		Suatu hari ketika Rizky sedang beraktivitas di rumah, saudaranya yang berasal dari kota lain
		mendadak menghubungi Rizky dan mengatakan bahwa mereka sedang di kota dimana Rizky tinggal
		dan akan tiba ke rumah Rizky dalam waktu 2 jam lagi.

		Lantas hal tersebut membuat Rizky kaget karena ia belum sempat melakukan prepare makanan
		untuk dijamu kepada saudaranya yang akan datang. Akhirnya Rizky menghubungi salah satu
		perusahaan catering yang bernama DelVia untuk memesan makanan.

		Rizky memesan mie goreng sebanyak 10 pax. Namun, karena Rizky merupakan pelanggan lama di
		Catering DelVia, maka Rizky berkesempatan untuk mendapatkan tipe reservasi VIP II yang salah satu
		keuntungannya adalah mendapat prioritas pesanan yang cepat
	*/

	--SIMULASI TRANSAKSI

	--1
	--Memasukan data pembelian ke riwayat Services Transaction
	INSERT INTO ServicesTransaction
	VALUES('TR014','TRK1', 'Jl. Curiz no.9', 'ST010', 'CU009', 10, '2020-12-26')

	--2
	--Memasukan data menu yang dibeli
	GO
	INSERT INTO ServicesTransactionDetail
	VALUES('TR014','ME012')

--END

--NB
	--Harap menjalankan simulasi transaksi pada case 1 terlebih dahulu baru ke case 2

--PENJELASAN RESERVATION TYPE UNTUK SIMULASI PADA CASE 2
	/*
		TRK1	->	VIP II
		TRM2	->	VIP I
		TRO3	->	GOLD II
		TRG4	->	GOLD I
		TRP5	->	BRONZE II
		TRS6	->	BRONZE I
		TRW7	->	SILVER II
		TRK8	->	SILVER I
		TRJ9	->	STANDART II
		TRO10	->	STANDART I
	*/