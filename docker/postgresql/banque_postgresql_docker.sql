SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.utilisateur (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(120) NOT NULL,
  nom VARCHAR(120),
  prenom VARCHAR(120),
  sex INTEGER,
  derniereConnectionDate DATE,
  derniereConnectionHeure TIME,
  dateDeNaissance DATE,
  adresse VARCHAR(500),
  codePostal INTEGER,
  telephone VARCHAR(20)
);
ALTER TABLE public.utilisateur OWNER TO root;

CREATE UNIQUE INDEX CONCURRENTLY utilisateur_email ON public.utilisateur (email);

CREATE TABLE public.compte (
  id SERIAL PRIMARY KEY,
  libelle VARCHAR(250),
  solde DECIMAL(10,2),
  decouvert DECIMAL(10,2),
  taux DECIMAL(5,2),
  utilisateurId INTEGER NOT NULL,  
  FOREIGN KEY (utilisateurId) REFERENCES public.utilisateur (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
ALTER TABLE public.compte OWNER TO root;

CREATE TABLE public.operation (
  id SERIAL PRIMARY KEY,
  libelle VARCHAR(250),
  montant DECIMAL(10,2),
  dateOp DATE,
  heureOp TIME,
  compteId INTEGER NOT NULL,
  FOREIGN KEY (compteId) REFERENCES public.compte (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
ALTER TABLE public.operation OWNER TO root;

--
-- Les donnees
--
-- Remarque : On reset les sequences pour ne pas avoir de probleme lors de l'utilisation
INSERT INTO public.utilisateur VALUES (1,'df@aol.com','df','Fargis','Denis',0,NULL, NULL,'1975-09-19',NULL,78140,NULL);
INSERT INTO public.utilisateur VALUES (2,'dj@aol.com','dj','Fanael','Julie',1,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO public.utilisateur VALUES (3,'ip@aol.com','ip','Iaris','Paul',0,NULL,NULL,NULL,NULL,NULL,NULL);
ALTER SEQUENCE public.utilisateur_id_seq RESTART WITH 4 INCREMENT BY 1;

INSERT INTO public.compte VALUES (12,'Compte Courant',25000.00,NULL,NULL,1);
INSERT INTO public.compte VALUES (13,'Compte Courant',15000.00,100.00,NULL,2);
INSERT INTO public.compte VALUES (14,'Compte Courant',35000.00,50.00,NULL,3);
INSERT INTO public.compte VALUES (15,'Livret A',99500.00,NULL,0.10,1);
INSERT INTO public.compte VALUES (16,'Compte Remunéré',50000.00,NULL,0.30,2);
ALTER SEQUENCE public.compte_id_seq RESTART WITH 17 INCREMENT BY 1;

INSERT INTO public.operation VALUES (1,'Virement',500,'2014-12-31', '23:00:00',15);
INSERT INTO public.operation VALUES (2,'Retrait',-500,'2014-12-31', '23:00:00',12);
INSERT INTO public.operation VALUES (3,'Transaction avec le comte 12',-50,'2015-02-13', '13:10:52',15);
INSERT INTO public.operation VALUES (4,'Transaction avec le comte 15',50,'2015-02-13', '13:10:52',12);
ALTER SEQUENCE public.operation_id_seq RESTART WITH 5 INCREMENT BY 1;
