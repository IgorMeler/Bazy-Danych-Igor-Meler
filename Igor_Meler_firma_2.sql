USE firma_zad_5;
GO

CREATE DATABASE firma_zad_5;


CREATE SCHEMA ksiegowosc;

	
	--EXEC sp_addextendedproperty


	COMMENT ON TABLE ksiegowosc.pracownicy
   IS 'Dane pracownikow';


CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika INTEGER PRIMARY KEY NOT NULL, 
	imie VARCHAR(30) NOT NULL, 
	nazwisko VARCHAR(30) NOT NULL, 
	adres VARCHAR(50) NOT NULL, 
	telefon CHAR(9) NOT NULL
	);

	COMMENT ON TABLE ksiegowosc.godziny
   IS 'Dane dotyczace godzin pracy';

CREATE TABLE ksiegowosc.godziny (
	id_godziny INTEGER PRIMARY KEY NOT NULL, 
	"data" DATE NOT NULL,
	liczba_godzin INTEGER NOT NULL,
	id_pracownika INTEGER FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika) NOT NULL
	);

	COMMENT ON TABLE ksiegowosc.premie
   IS 'Dane dotyczace premii pracownikow';

CREATE TABLE ksiegowosc.premie (
	id_premii INTEGER PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(15) NOT NULL,
	kwota MONEY NOT NULL
	);

	COMMENT ON TABLE ksiegowosc.pensje
   IS 'Dane dotyczace pensji pracownikow';

CREATE TABLE ksiegowosc.pensje (
	id_pensji INTEGER PRIMARY KEY NOT NULL,
	stanowisko VARCHAR (30) NOT NULL,
	kwota MONEY NOT NULL
	);

	COMMENT ON TABLE ksiegowosc.pensje
   IS 'Dane dotyczace wynagrodzen pracownikow';

CREATE TABLE ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INTEGER PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	id_pracownika INTEGER FOREIGN KEY REFERENCES ksiegowosc.pracownicy(id_pracownika) NOT NULL,
	id__godziny INTEGER FOREIGN KEY REFERENCES ksiegowosc.godziny(id_godziny) NOT NULL,
	id_pensji INTEGER FOREIGN KEY REFERENCES ksiegowosc.pensje(id_pensji) NOT NULL,
	id_premii INTEGER FOREIGN KEY REFERENCES ksiegowosc.premie(id_premii)
	)


	INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Jan', 'Kowalski', 'Kraków', '123456789');
	INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Anna', 'Nowak', 'Warszawa', '837192750');
	INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Piotr', 'Wiœniewski', 'Pu³awy', '471028544');
	INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Maria', 'Wójcik', 'Poznañ', '481729371');
	INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Agnieszka', 'Kowalczyk', 'Gdañsk', '303719271');
	INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Krzysztof', 'Kamiñski', 'Krosno', '489172918');
	INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Tomasz', 'Lewandowski', 'Lublin', '391729263');
	INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Micha³', 'Iksiñski', 'Szczecin', '381027491');
	INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Ewa', 'Zieliñska', 'Bydgoszcz', '381829471');
	INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Zuzanna', 'Szymañska', 'Katowice', '927184725');


	INSERT INTO ksiegowosc.godziny VALUES (1, '2022-04-06', 100, 5);
	INSERT INTO ksiegowosc.godziny VALUES (2, '2022-04-07', 140, 6);
	INSERT INTO ksiegowosc.godziny VALUES (3, '2022-04-08', 80, 4);
	INSERT INTO ksiegowosc.godziny VALUES (4, '2022-04-09', 120, 7);
	INSERT INTO ksiegowosc.godziny VALUES (5, '2022-04-12', 160, 3);
	INSERT INTO ksiegowosc.godziny VALUES (6, '2022-04-10', 180, 8);
	INSERT INTO ksiegowosc.godziny VALUES (7, '2022-04-11', 190, 2);
	INSERT INTO ksiegowosc.godziny VALUES (8, '2022-04-14', 200, 1);
	INSERT INTO ksiegowosc.godziny VALUES (9, '2022-04-16', 130, 9);
	INSERT INTO ksiegowosc.godziny VALUES (10, '2022-04-15', 120, 10);


	INSERT INTO ksiegowosc.premie VALUES (1, 'regulaminowa', 320.50);
	INSERT INTO ksiegowosc.premie VALUES (2, 'regulaminowa', 345.00);
	INSERT INTO ksiegowosc.premie VALUES (3, 'regulaminowa', 360.00);
	INSERT INTO ksiegowosc.premie VALUES (4, 'regulaminowa', 380.00);
	INSERT INTO ksiegowosc.premie VALUES (5, 'regulaminowa', 420.00);
	INSERT INTO ksiegowosc.premie VALUES (6, 'regulaminowa', 400.00);
	INSERT INTO ksiegowosc.premie VALUES (7, 'regulaminowa', 440.50);
	INSERT INTO ksiegowosc.premie VALUES (8, 'regulaminowa', 460.00);
	INSERT INTO ksiegowosc.premie VALUES (9, 'regulaminowa', 480.00);
	INSERT INTO ksiegowosc.premie VALUES (10, 'regulaminowa', 500.00);


	INSERT INTO ksiegowosc.pensje VALUES (1, 'analityk', 4500);
	INSERT INTO ksiegowosc.pensje VALUES (2, 'sta¿ysta', 3000);
	INSERT INTO ksiegowosc.pensje VALUES (3, 'programista', 4600);
	INSERT INTO ksiegowosc.pensje VALUES (4, 'ksiêgowy', 4000);
	INSERT INTO ksiegowosc.pensje VALUES (5, 'HR', 3600);
	INSERT INTO ksiegowosc.pensje VALUES (6, 'analityk', 3900);
	INSERT INTO ksiegowosc.pensje VALUES (7, 'programista', 3800);
	INSERT INTO ksiegowosc.pensje VALUES (8, 'ksiêgowy', 4400);
	INSERT INTO ksiegowosc.pensje VALUES (9, 'analityk', 4500);
	INSERT INTO ksiegowosc.pensje VALUES (10, 'programista', 4300);


	INSERT INTO ksiegowosc.wynagrodzenie VALUES (1, '2022-04-06', 2, 5, 7, 3);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (2, '2022-04-07', 8, 3, 6, 6);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (3, '2022-04-08', 3, 4, 2, NULL);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (4, '2022-04-09', 6, 2, 1, 4);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (5, '2022-04-12', 7, 8, 5, 10);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (6, '2022-04-10', 4, 7, 4, NULL);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (7, '2022-04-11', 1, 1, 3, NULL); 
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (8, '2022-04-14', 10, 6, 8, 4);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (9, '2022-04-16', 5, 9, 9, 9);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES (10, '2022-04-15', 9, 10, 10, NULL);



	SELECT * FROM ksiegowosc.pracownicy;

	SELECT * FROM ksiegowosc.godziny;

	SELECT * FROM ksiegowosc.premie;

	SELECT * FROM ksiegowosc.pensje;

	SELECT * FROM ksiegowosc.wynagrodzenie;



	--A)
	SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

	--B)
	SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji 
	WHERE kwota > 1000;

	--C)
	SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji 
	WHERE kwota > 4000 AND wynagrodzenie.id_premii IS NULL;

	--D)
	SELECT id_pracownika FROM ksiegowosc.pracownicy 
	WHERE pracownicy.imie LIKE 'J%';

	--E)
	SELECT id_pracownika FROM ksiegowosc.pracownicy 
	WHERE pracownicy.imie LIKE '%a' AND pracownicy.nazwisko LIKE '%n%';

	--F)
	SELECT imie, nazwisko, (liczba_godzin - 160) AS liczba_nadgodzin FROM ksiegowosc.pracownicy 
	INNER JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika
	WHERE liczba_godzin > 160;

	--G)
	SELECT imie, nazwisko FROM ((ksiegowosc.pracownicy 
	INNER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika) 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji) 
	WHERE pensje.kwota > 3000 AND pensje.kwota < 4000;

	--H)
	SELECT imie, nazwisko, (liczba_godzin - 160) AS liczba_nadgodzin FROM ((ksiegowosc.pracownicy 
	INNER JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika)
	INNER JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika)
	WHERE liczba_godzin > 160 AND wynagrodzenie.id_premii IS NULL;

	--I)
	SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji 
	ORDER BY pensje.kwota;
	
	--J)
	SELECT id_pracownika FROM ((ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji)
	INNER JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii)
	ORDER BY pensje.kwota, premie.kwota DESC;

	--K)
	SELECT COUNT(id_pracownika) AS liczba_pracownikow, stanowisko FROM ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
	GROUP BY stanowisko;

	--L)
	SELECT MIN(kwota) AS minimalna, MAX(kwota) AS maksymalna, AVG(kwota) AS srednia FROM ksiegowosc.pensje 
	WHERE stanowisko = 'analityk';

	--M)
	SELECT SUM(pensje.kwota) + SUM(premie.kwota) AS suma_wynagrodzen FROM ((ksiegowosc.wynagrodzenie 
	FULL JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji)
	FULL JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii);

	--N)
	SELECT SUM(pensje.kwota) + SUM(premie.kwota) AS suma_wynagrodzenia, stanowisko FROM ((ksiegowosc.wynagrodzenie 
	FULL JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii)
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji)
	GROUP BY stanowisko;

	--O)
	SELECT COUNT(id_premii) AS liczba_premii, stanowisko FROM ksiegowosc.wynagrodzenie 
	INNER JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
	GROUP BY stanowisko;
	
	--P)
	DELETE pracownicy FROM ((ksiegowosc.pracownicy
	INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika)
	INNER JOIN ksiegowosc.pensje ON pensje.id_pensji = wynagrodzenie.id_pensji)
	WHERE pensje.kwota < 1200;



