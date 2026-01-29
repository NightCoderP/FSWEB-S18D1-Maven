CREATE TABLE IF NOT EXISTS public.ogrenci
(
    ogrno bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    ad character varying(45) COLLATE pg_catalog."default" NOT NULL,
    soyad character varying(45) COLLATE pg_catalog."default" NOT NULL,
    cinsiyet character varying(1) COLLATE pg_catalog."default" NOT NULL,
    sinif character varying(3) COLLATE pg_catalog."default",
    puan integer,
    dtarih character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT ogrenci_pkey PRIMARY KEY (ogrno)
);

CREATE TABLE public.islem
(
    islemno bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ogrno bigint NOT NULL,
    kitapno bigint NOT NULL,
    atarih character varying(20) NOT NULL,
    vtarih character varying(20),
    PRIMARY KEY (islemno)
);

CREATE TABLE public.kitap
(
    kitapno bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying(45) NOT NULL,
    puan integer NOT NULL,
    yazarno bigint NOT NULL,
    turno bigint NOT NULL,
    PRIMARY KEY (kitapno)
);

CREATE TABLE public.yazar
(
    yazarno bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying(45) NOT NULL,
    soyad character varying(45) NOT NULL,
    PRIMARY KEY (yazarno)
);

CREATE TABLE public.tur
(
    turno bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying(45) NOT NULL,
    PRIMARY KEY (turno)
);

ALTER TABLE IF EXISTS public.ogrenci
    OWNER to postgres;

ALTER TABLE IF EXISTS public.islem
    OWNER to postgres;

ALTER TABLE IF EXISTS public.kitap
    OWNER to postgres;

ALTER TABLE IF EXISTS public.yazar
    OWNER to postgres;

ALTER TABLE IF EXISTS public.tur
    OWNER to postgres;

INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Hülya', 'Yiğit', 'K', '10A', 0, '1990-04-08 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Niyazi', 'Sevinç', 'E', '9B', 0,'1990-11-11 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('İsmail', 'Sevinç', 'E', '10B', 0,'1990-04-17 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Kenan', 'Emin', 'E', '9A', 0,'1988-02-23 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Sema', 'Bakır', 'K', '9B', 0,'1990-04-07 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Deniz', 'Kara', 'E', '9C', 0,'1989-07-21 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Betül', 'Coşkun', 'K', '11A', 0,'1990-01-10 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Sema', 'Rüzgar', 'K', '9C', 0,'1989-11-14 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Fadime', 'Dönmez', 'K', '9A', 0,'1989-09-11 00:00:00');
INSERT INTO
public.ogrenci(ad, soyad, cinsiyet, sinif, puan, dtarih)
VALUES('Rıza', 'Koç', 'E', '10B', 0,'1990-01-26 00:00:00');

INSERT INTO public.tur(ad) VALUES('Dram');
INSERT INTO public.tur(ad) VALUES('Komedi');
INSERT INTO public.tur(ad) VALUES('Roman');
INSERT INTO public.tur(ad) VALUES('Hikaye');
INSERT INTO public.tur(ad) VALUES('Araştırma');

INSERT INTO yazar(ad, soyad)
VALUES('Leyla', 'Çelik');
INSERT INTO yazar(ad, soyad)
VALUES('Zeynep', 'Emin');
INSERT INTO yazar(ad, soyad)
VALUES('Ali', 'Yazar');
INSERT INTO yazar(ad, soyad)
VALUES('Deniz', 'Akpınar');
INSERT INTO yazar(ad, soyad)
VALUES('Mehmet', 'Çelik');

INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Abdülhamidin Kurtlarla Dansı', 22, 1, 1);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Ablamı Nereye Kaçırdılar', 27, 1, 2);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Anayurttan Anadoluya', 19, 2, 3);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Anneannem Gelin Oldu', 15, 2, 4);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Antik Acılar', 28, 3, 3);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Aşk Ve Öbür Cinler', 18, 3, 4);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Aşksız İnsanlar', 18, 4, 5);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Atuan Mezarları', 16, 4, 2);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Bahar İsyancıdır', 25, 5, 3);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Benim Üniversitelerim', 15, 5, 2);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Bir Gemide', 16, 1, 3);
INSERT INTO kitap(ad, puan, yazarno, turno)
VALUES('Bir Ses Böler Geceyi', 14, 3, 2);

INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(1, 1, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(1, 2, '2006-01-02 00:00:00', '2006-01-07 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(2, 3, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(4, 5, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(1, 3, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(4, 4, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(6, 5, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(7, 6, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(8, 7, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(9, 8, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(1, 10, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(1, 11, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(1, 12, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(10, 1, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(10, 4, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(8, 5, '2006-01-01 00:00:00', '2006-01-17 00:00:00');
INSERT INTO islem(ogrno, kitapno, atarih, vtarih)
VALUES(10, 10, '2006-01-01 00:00:00', '2006-01-17 00:00:00');