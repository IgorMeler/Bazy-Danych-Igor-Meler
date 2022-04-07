USE firma;
GO

CREATE DATABASE firma;


CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy (
	id_pracownika INTEGER PRIMARY KEY NOT NULL, 
	imie VARCHAR(30) NOT NULL, 
	nazwisko VARCHAR(30) NOT NULL, 
	adres VARCHAR(50) NOT NULL, 
	telefon CHAR(9) NOT NULL
	);

CREATE TABLE rozliczenia.godziny (
	id_godziny INTEGER PRIMARY KEY NOT NULL, 
	"data" DATE NOT NULL,
	liczba_godzin INTEGER NOT NULL,
	id_pracownika INTEGER FOREIGN KEY REFERENCES rozliczenia.pracownicy(id_pracownika) NOT NULL
	);

CREATE TABLE rozliczenia.premie (
	id_premii INTEGER PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(15) NOT NULL,
	kwota MONEY NOT NULL
	);

CREATE TABLE rozliczenia.pensje (
	id_pensji INTEGER PRIMARY KEY NOT NULL,
	stanowisko VARCHAR (30) NOT NULL,
	kwota MONEY NOT NULL,
	id_premii INTEGER FOREIGN KEY REFERENCES rozliczenia.premie(id_premii) NOT NULL
	);


	INSERT INTO rozliczenia.pracownicy VALUES (1, 'Jan', 'Kowalski', 'Kraków', '123456789');
	INSERT INTO rozliczenia.pracownicy VALUES (2, 'Anna', 'Nowak', 'Warszawa', '837192750');
	INSERT INTO rozliczenia.pracownicy VALUES (3, 'Piotr', 'Wiœniewski', 'Pu³awy', '471028544');
	INSERT INTO rozliczenia.pracownicy VALUES (4, 'Maria', 'Wójcik', 'Poznañ', '481729371');
	INSERT INTO rozliczenia.pracownicy VALUES (5, 'Agnieszka', 'Kowalczyk', 'Gdañsk', '303719271');
	INSERT INTO rozliczenia.pracownicy VALUES (6, 'Krzysztof', 'Kamiñski', 'Krosno', '489172918');
	INSERT INTO rozliczenia.pracownicy VALUES (7, 'Tomasz', 'Lewandowski', 'Lublin', '391729263');
	INSERT INTO rozliczenia.pracownicy VALUES (8, 'Micha³', 'Iksiñski', 'Szczecin', '381027491');
	INSERT INTO rozliczenia.pracownicy VALUES (9, 'Ewa', 'Zieliñska', 'Bydgoszcz', '381829471');
	INSERT INTO rozliczenia.pracownicy VALUES (10, 'Zuzanna', 'Szymañska', 'Katowice', '927184725');


	INSERT INTO rozliczenia.godziny VALUES (1, '2022-04-06', 5, 5);
	INSERT INTO rozliczenia.godziny VALUES (2, '2022-04-07', 6, 6);
	INSERT INTO rozliczenia.godziny VALUES (3, '2022-04-08', 5, 4);
	INSERT INTO rozliczenia.godziny VALUES (4, '2022-04-09', 7, 7);
	INSERT INTO rozliczenia.godziny VALUES (5, '2022-04-12', 8, 3);
	INSERT INTO rozliczenia.godziny VALUES (6, '2022-04-10', 5, 8);
	INSERT INTO rozliczenia.godziny VALUES (7, '2022-04-11', 8, 2);
	INSERT INTO rozliczenia.godziny VALUES (8, '2022-04-14' , 4, 1);
	INSERT INTO rozliczenia.godziny VALUES (9, '2022-04-16', 6, 9);
	INSERT INTO rozliczenia.godziny VALUES (10, '2022-04-15', 8, 10);


	INSERT INTO rozliczenia.premie VALUES (1, 'regulaminowa', 320.50);
	INSERT INTO rozliczenia.premie VALUES (2, 'regulaminowa', 345.00);
	INSERT INTO rozliczenia.premie VALUES (3, 'regulaminowa', 360.00);
	INSERT INTO rozliczenia.premie VALUES (4, 'regulaminowa', 380.00);
	INSERT INTO rozliczenia.premie VALUES (5, 'regulaminowa', 420.00);
	INSERT INTO rozliczenia.premie VALUES (6, 'regulaminowa', 400.00);
	INSERT INTO rozliczenia.premie VALUES (7, 'regulaminowa', 440.50);
	INSERT INTO rozliczenia.premie VALUES (8, 'regulaminowa', 460.00);
	INSERT INTO rozliczenia.premie VALUES (9, 'regulaminowa', 480.00);
	INSERT INTO rozliczenia.premie VALUES (10, 'regulaminowa', 500.00);


	INSERT INTO rozliczenia.pensje VALUES (1, 'analityk', 4500, 5);
	INSERT INTO rozliczenia.pensje VALUES (2, 'sta¿ysta', 3000, 1);
	INSERT INTO rozliczenia.pensje VALUES (3, 'programista', 4600, 3);
	INSERT INTO rozliczenia.pensje VALUES (4, 'ksiêgowy', 4000, 6);
	INSERT INTO rozliczenia.pensje VALUES (5, 'HR', 3600, 7);
	INSERT INTO rozliczenia.pensje VALUES (6, 'analityk', 3900, 8);
	INSERT INTO rozliczenia.pensje VALUES (7, 'programista', 3800, 10);
	INSERT INTO rozliczenia.pensje VALUES (8, 'ksiêgowy', 4400, 9);
	INSERT INTO rozliczenia.pensje VALUES (9, 'analityk', 4500, 4);
	INSERT INTO rozliczenia.pensje VALUES (10, 'programista', 4300, 2);


	SELECT * FROM rozliczenia.pracownicy;

	SELECT * FROM rozliczenia.godziny;

	SELECT * FROM rozliczenia.premie;

	SELECT * FROM rozliczenia.pensje;



	SELECT nazwisko, adres FROM rozliczenia.pracownicy;



	SELECT DatePart("w",[data]) AS dzieñ_tygodnia, DatePart("m",[data]) AS miesi¹c, "data"  FROM rozliczenia.godziny;

	ALTER TABLE rozliczenia.godziny ADD dzieñ_tygodnia AS DatePart("w",[data]);
	ALTER TABLE rozliczenia.godziny ADD miesi¹c AS DatePart("m",[data]);

	--ALTER TABLE pensje RENAME COLUMN kwota TO kwota_brutto;

	EXEC sp_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN';

	SELECT (kwota_brutto - (kwota_brutto*0.19)) AS kwota_netto, kwota_brutto FROM rozliczenia.pensje;

	ALTER TABLE rozliczenia.pensje ADD kwota_netto MONEY;

	UPDATE rozliczenia.pensje
	SET kwota_netto = (kwota_brutto - (kwota_brutto*0.19));

	--ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (kwota_brutto - (kwota_brutto*0.19));

