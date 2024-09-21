--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:BDv2TbQvdqmMvN5lnMp4TA==$dmBZLGESBnHxNAP/eShcXcqSF1B+aPl2rJK5HF63jjY=:uAbeLQKRA1hEriL8yL9GLzAu4NdD0I0mo3RLoq5DvEs=';
CREATE ROLE "prasanna.natarajan";
ALTER ROLE "prasanna.natarajan" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE web;
ALTER ROLE web WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:IXborpvVMppmd7/ld9VB1w==$k1RUpLweHTcchSA2Vk7diC80PghibiFduiJ/OSL7SMM=:ZSDWSePsQkgphbjd0o4p5bw60dgrqjzdVxlR7QtMEU4=';

--
-- User Configurations
--








--
-- PostgreSQL database cluster dump complete
--

