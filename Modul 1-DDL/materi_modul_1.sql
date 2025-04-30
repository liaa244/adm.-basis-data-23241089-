-- Nama : Aulia yulianti
-- NIM : 23241089
-- Kelas : C
-- Modul : Modul 1 Data Definition Langauge

-- Mebuat Database
CREATE DATABASE pti_mart;

-- Menggunakan DATABASE
USE pti_mart;

-- Membuat Tabel
CREATE TABLE pelanggan(
 id_pelanggan int PRIMARY KEY NOT NULL,
 nama_pelanggan VARCHAR(50),
 alamat VARCHAR(100),
 kota VARCHAR (20),
 no_tlp VARCHAR (15)
);

CREATE TABLE produk(
 id_produk int PRIMARY KEY NOT NULL,
 nama_produk VARCHAR (50),
 kategori VARCHAR (20),
 harga int (17),
 stok int (10)
); 
 
-- membuat tabel dengan foreign key
CREATE TABLE transaksi(
 id_transaksi int PRIMARY KEY NOT NULL,
 tgl_transaksi DATE,
 id_produk int,
 id_pelanggan int,
 qty int,
 total_harga int,
 FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
 FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
 );
 
-- mengisi data dalam tabel
INSERT INTO pelanggan(
id_pelanggan, nama_pelanggan, alamat, kota, no_tlp
)VALUES
(333,"Aulia", "JL pademare No.555", "Taliwang", "08266600"),
(334,"Nida", "Jl selaparamg No.666", "Gontar", "134168251"),
(335,"Willy", "Jl maja pahit No.777", "Gomong", "246168247198"),
(335,"Diah", "Jl selaparang No.888", "Taliwang","157251638"),
(337,"Kinan", "Jl pemuda No.197", "Selaparang","164186382");


INSERT INTO produk(
id_produk, nama_produk, kategori, harga, stok
)VALUES
(000,"gacoan", "makanan", "2000", "2"),
(001,"kopi", "minuman", "3000", "11"),
(002,"dodol", "minuman", "2000", "10"),
(003,"rujak", "makanan", "3000", "5"),
(004,"coklat", "makanan", "2000", "6");

-- cek apakah data ada 
SELECT * FROM pelanggan;
SELECT * FROM produk;

-- mengisi data pada tabel yang ada foreign key
INSERT INTO transaksi
 set id_transaksi = 2543,
	 tgl_transaksi = "2025-08-11",
     id_produk = (
     SELECT id_produk FROM produk
     WHERE id_produk = 000),
     id_pelanggan = (333
     SELECT id_pelanggan FROM pelanggan
     WHERE id_pelanggan = 000),
     qty = 1,
     total_harga = (
     SELECT harga FROM produk
     WHERE id_produk = 000) * qty;
     
SELECT * FROM transaksi;
     
 
 