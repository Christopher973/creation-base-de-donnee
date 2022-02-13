--*************************** CLIENT 1 ***************************
INSERT INTO CLIENT
	VALUES('000100', 'mme', 'Aztakes', 'Hélène', 'Av de Ranguel', '31000', 'Toulouse', '0600000000', NULL, NULL, NULL, 45);

INSERT INTO PAIEMENT
	VALUES('000001', 'Chèque');

INSERT INTO COMMANDE
	VALUES('000001', '000100', '000001', '09/08/2021', 0.0, 'Domicile', 2.0);

INSERT INTO ARTICLE
	VALUES('471147', NULL, 'Linge de lit chalet Drap 240x300', 14.95);
INSERT INTO ARTICLE
	VALUES('471159', NULL, 'Linge de lit chalet Drap Housse', 17.45);
INSERT INTO ARTICLE
	VALUES('471162', NULL, 'Linge de lit chalet Taie Traversin', 11.45);

INSERT INTO APPARTENIR
	VALUES('000001', '471147', 1);
INSERT INTO APPARTENIR
	VALUES('000001', '471159', 1);
INSERT INTO APPARTENIR
	VALUES('000001', '471162', 1);

INSERT INTO LIVRAISON
	VALUES('000001', '000001');
--****************************************************************


--*************************** CLIENT 2 ***************************
INSERT INTO CLIENT
	VALUES('000200', 'mm', 'Assein', 'Marc', 'Rue du chêne', '31000', 'Toulouse', '0600000006', NULL, '01/12/2001', 'marc@orange.fr', 105);

INSERT INTO PAIEMENT
	VALUES('000002', 'Carte');
INSERT INTO CARTE_BANCAIRE
	VALUES('0001000100010001', '000002', 'Assein', '0124', '001', 'c', 'Carte');

INSERT INTO COMMANDE
	VALUES('000002', '000200', '000002', '09/08/2021', 15.0, 'PointRelais', 0.0);

INSERT INTO ARTICLE
	VALUES('905968', NULL, 'Drap de bain 100x150 gris perle', 24.67);
INSERT INTO ARTICLE
	VALUES('905784', NULL, 'Tapis de bain 60x100 gris perle', 17.17);

INSERT INTO APPARTENIR
	VALUES('000002', '905968', 3);
INSERT INTO APPARTENIR
	VALUES('000002', '905784', 1);

INSERT INTO LIVRAISON
	VALUES('000002', '000002');

INSERT INTO RELAIS
	VALUES('000002', '52035', 'Intermarché Contact', 'Avenue de revel', '81700', 'Puylaurens');
--****************************************************************


--*************************** CLIENT 3 ***************************
INSERT INTO CLIENT
	VALUES('000300', 'mme', 'Terrieur', 'Alex', 'Rue de la caille', '81000', 'Albi', '0500000000', '0600000060', NULL, NULL, 10);

INSERT INTO PAIEMENT
	VALUES('000003', 'Chèque');

INSERT INTO COMMANDE
	VALUES('000003', '000300', '000003', '09/08/2021', 50.00, 'Express', 9.90);

INSERT INTO ARTICLE
    VALUES('950728', NULL, 'Couette dodo 240x220', 129.90);
INSERT INTO ARTICLE
    VALUES('950614', NULL, 'Oreiller ergonomique 60x60', 29.90);

INSERT INTO APPARTENIR
	VALUES('000003', '950728', 1);
INSERT INTO APPARTENIR
	VALUES('000003', '950614', 2);

INSERT INTO LIVRAISON
	VALUES('000003', '000003');
--****************************************************************


--*************************** CLIENT 4 ***************************
INSERT INTO PAIEMENT
	VALUES('000004', 'Chèque');

INSERT INTO COMMANDE
	VALUES('000004', '000200', '000004', '09/08/2021', 100.00, 'PointRelais', 0.0);

INSERT INTO APPARTENIR
	VALUES('000004', '950728', 3);

INSERT INTO LIVRAISON
	VALUES('000004', '000004');
INSERT INTO RELAIS
	VALUES('000004', '52035', 'Intermarché Contact', 'Avenue de revel', '81700', 'Puylaurens');
--****************************************************************

COMMIT;