USE DEMO

/************** Suppression des Contraintes **************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ARFI_BACO]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE_FINITION] DROP CONSTRAINT FK_ARFI_BACO
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ARST_BACO]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE_STRUCTURE] DROP CONSTRAINT FK_ARST_BACO
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_REPR_ASSI]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[REPRESENTANT] DROP CONSTRAINT FK_REPR_ASSI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BACO_CARA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE] DROP CONSTRAINT FK_BACO_CARA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CARA_TYPC]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TYPE_PRODUIT_CARA] DROP CONSTRAINT FK_CARA_TYPC
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_AFFE_CLIE]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AFFECTATION] DROP CONSTRAINT FK_AFFE_CLIE
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CLIE_PAYS]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CLIENT] DROP CONSTRAINT FK_CLIE_PAYS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_INTE_CLIE]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[INTERLOCUTEUR] DROP CONSTRAINT FK_INTE_CLIE
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SCPA_CPTM]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_CPTM_ACT] DROP CONSTRAINT FK_SCPA_CPTM
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SCPS_CPTM]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_CPTM_SEL] DROP CONSTRAINT FK_SCPS_CPTM
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CPTM_COSE]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[COMPORTEMENT] DROP CONSTRAINT FK_CPTM_COSE
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_COFI_COMP]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[COMPOSANT_FINITION] DROP CONSTRAINT FK_COFI_COMP
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SCOM_COMP]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_COMPOSANT] DROP CONSTRAINT FK_SCOM_COMP
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_COMM_DEVI]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[COMMISSION] DROP CONSTRAINT FK_COMM_DEVI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ARFI_FINI]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE_FINITION] DROP CONSTRAINT FK_ARFI_FINI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_COFI_FINI]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[COMPOSANT_FINITION] DROP CONSTRAINT FK_COFI_FINI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_GRFI_FINI]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[GROUPE_FINITION] DROP CONSTRAINT FK_GRFI_FINI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BACO_FOUR]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE] DROP CONSTRAINT FK_BACO_FOUR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_COMP_FOUR]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[COMPOSANT] DROP CONSTRAINT FK_COMP_FOUR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BACO_GAMM]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE] DROP CONSTRAINT FK_BACO_GAMM
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_GATY_GAMM]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[GAMME_TYPR] DROP CONSTRAINT FK_GATY_GAMM
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ASSI_PAYS]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ASSISTANTE] DROP CONSTRAINT FK_ASSI_PAYS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_FOUR_PAYS]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[FOURNISSEUR] DROP CONSTRAINT FK_FOUR_PAYS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ARST_STRU]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE_STRUCTURE] DROP CONSTRAINT FK_ARST_STRU
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SCOM_STRU]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_COMPOSANT] DROP CONSTRAINT FK_SCOM_STRU
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SCPA_STRU]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_CPTM_ACT] DROP CONSTRAINT FK_SCPA_STRU
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SCPS_STRU]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_CPTM_SEL] DROP CONSTRAINT FK_SCPS_STRU
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_STLI_STRU_PARENT]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE_LIEE] DROP CONSTRAINT FK_STLI_STRU_PARENT
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_PAYS_TTVA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PAYS] DROP CONSTRAINT FK_PAYS_TTVA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_GRFI_TYFI]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[GROUPE_FINITION] DROP CONSTRAINT FK_GRFI_TYFI
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BACO_TYPR]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BASE_COMPOSE] DROP CONSTRAINT FK_BACO_TYPR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_GATY_TYPR]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[GAMME_TYPR] DROP CONSTRAINT FK_GATY_TYPR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_TYPR_TYPC]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TYPE_PRODUIT_CARA] DROP CONSTRAINT FK_TYPR_TYPC
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_STRU_TYST]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[STRUCTURE] DROP CONSTRAINT FK_STRU_TYST
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SECT_REPR]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SECTEUR] DROP CONSTRAINT FK_SECT_REPR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CLDI_CLIE]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CLIENT_DIFFUSION] DROP CONSTRAINT FK_CLDI_CLIE
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CLDI_REPR]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CLIENT_DIFFUSION] DROP CONSTRAINT FK_CLDI_REPR
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_LDCV_LDCO]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[LDCO_PLUS_VALUE] DROP CONSTRAINT FK_LDCV_LDCO
GO

/******************** Suppression des Triggers ********************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_ARST]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_ARST]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_CARA]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_CARA]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_CATE]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_CATE]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_CHAR]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_CHAR]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_CIVI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_CIVI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_COFI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_COFI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_COPO]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_COPO]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_COSE]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_COSE]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_CPTM]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_CPTM]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_COMP]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_COMP]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_FAMI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_FAMI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_FINI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_FINI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_FOUR]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_FOUR]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_GATY]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_GATY]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_GAMM]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_GAMM]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_GRFI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_GRFI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_JACM]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_JACM]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_MODA]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_MODA]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_MOCL]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_MOCL]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_PAYS]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_PAYS]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_SCOM]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_SCOM]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_SCPA]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_SCPA]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_SCPS]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_SCPS]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_STLI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_STLI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_STRU]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_STRU]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TTVA]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TTVA]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYCO]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYCO]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYDE]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYDE]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYFI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYFI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYJA]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYJA]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYMO]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYMO]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYPR]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYPR]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYPC]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYPC]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_TYST]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_TYST]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_BACO]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_BACO]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_ARFI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_ARFI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_ASSI]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_ASSI]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_FOTD]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_FOTD]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_REPR]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_REPR]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_RETD]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_RETD]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_LSOU_SECT]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_LSOU_SECT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_STLI_STRU_ENFANT_INSERT]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_STLI_STRU_ENFANT_INSERT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_STRU_STLI_ENFANT_UPDATE]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_STRU_STLI_ENFANT_UPDATE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_STRU_STLI_ENFANT_DELETE]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_STRU_STLI_ENFANT_DELETE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_REPR_PAYS_INSERT]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_REPR_PAYS_INSERT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_PAYS_REPR_UPDATE]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_PAYS_REPR_UPDATE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TR_CLIENT]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[TR_CLIENT]
GO

/******************** Suppression des Tables ********************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AFFECTATION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AFFECTATION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BASE_COMPOSE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BASE_COMPOSE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BASE_COMPOSE_FINITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BASE_COMPOSE_FINITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BASE_COMPOSE_STRUCTURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BASE_COMPOSE_STRUCTURE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ASSISTANTE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ASSISTANTE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CARACTERISTIQUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CARACTERISTIQUE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CATEGORIE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CATEGORIE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CHECKER_ARBRE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CHECKER_ARBRE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CIVILITE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CIVILITE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CLIENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CLIENT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CODE_POSTAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CODE_POSTAL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[COMPORTEMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPORTEMENT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[COMPORTEMENT_SELECTION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPORTEMENT_SELECTION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[COMPOSANT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPOSANT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[COMPOSANT_FINITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPOSANT_FINITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DEMO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DEMO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DICO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DICO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FAMILLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FAMILLE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FINITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FINITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FOURNISSEUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FOURNISSEUR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GAMME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GAMME]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GAMME_TYPR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GAMME_TYPR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GROUPE_FINITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GROUPE_FINITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[INTERLOCUTEUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[INTERLOCUTEUR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PAYS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PAYS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REMISE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REMISE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPRESENTANT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPRESENTANT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STRUCTURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STRUCTURE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STRUCTURE_COMPOSANT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STRUCTURE_COMPOSANT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STRUCTURE_CPTM_ACT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STRUCTURE_CPTM_ACT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STRUCTURE_CPTM_SEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STRUCTURE_CPTM_SEL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STRUCTURE_LIEE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STRUCTURE_LIEE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TTVA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TTVA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TYPE_FINITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TYPE_FINITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TYPE_MODALITE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TYPE_MODALITE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TYPE_PRODUIT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TYPE_PRODUIT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TYPE_PRODUIT_CARA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TYPE_PRODUIT_CARA]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TYPE_STRUCTURE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TYPE_STRUCTURE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LOTS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOT_REPR_IN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LOT_REPR_IN]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOT_SIEGE_OUT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LOT_SIEGE_OUT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOT_REPR_OUT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LOT_REPR_OUT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOT_SIEGE_IN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LOT_SIEGE_IN]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SECTEUR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SECTEUR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FOURNISSEUR_EDITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FOURNISSEUR_EDITION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CLIENT_DIFFUSION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CLIENT_DIFFUSION]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LDCO_PLUS_VALUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LDCO_PLUS_VALUE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DIALOGUE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DIALOGUE]
GO


/************** Cr?ation des TABLES **************/
CREATE TABLE [dbo].[AFFECTATION] (
	[AFFE__CLIE] [varchar] (10) NOT NULL ,
	[AFFE_Clep] [int] NOT NULL ,
	[AFFE_Libelle] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BASE_COMPOSE] (
	[BACO_Clep] [varchar] (12) NOT NULL ,
	[BACO__FOUR] [int] NOT NULL ,
	[BACO_Codecom] [varchar] (12) NULL ,
	[BACO_Libcom] [varchar] (80) NULL ,
	[BACO_Desdev] [varchar] (720) NULL ,
	[BACO_Pxactu] [money] NULL ,
	[BACO_Pxfutur] [money] NULL ,
	[BACO_Cubage] [decimal](4, 2) NULL ,
	[BACO_Coefcub] [decimal](3, 2) NULL ,
	[BACO_Indicspe] [bit] NULL ,
	[BACO_Poids] [decimal](6, 2) NULL ,
	[BACO_Datecrea] [datetime] NULL ,
	[BACO__CARA] [varchar] (20) NULL ,
	[BACO__TYPR] [varchar] (12) NULL ,
	[BACO__GAMM] [varchar] (5) NULL ,
	[BACO_Compose] [bit] NOT NULL ,
	[BACO_Declasse] [bit] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BASE_COMPOSE_STRUCTURE] (
	[ARST__BACO] [varchar] (12) NOT NULL ,
	[ARST__STRU] [varchar] (20) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ASSISTANTE] (
	[ASSI_Clep] [varchar] (15) NOT NULL ,
	[ASSI__PAYS] [varchar] (3) NULL ,
	[ASSI_Civilite] [varchar] (5) NULL ,
	[ASSI_Nom] [varchar] (40) NULL ,
	[ASSI_Prenom] [varchar] (40) NULL ,
	[ASSI_Adresse1] [varchar] (40) NULL ,
	[ASSI_Adresse2] [varchar] (40) NULL ,
	[ASSI_Adresse3] [varchar] (40) NULL ,
	[ASSI_Codepostal] [varchar] (10) NULL ,
	[ASSI_Ville] [varchar] (40) NULL ,
	[ASSI_Telephone] [varchar] (20) NULL ,
	[ASSI_Numposte] [varchar] (6) NULL ,
	[ASSI_Mobile] [varchar] (20) NULL ,
	[ASSI_Fax] [varchar] (20) NULL ,
	[ASSI_Email] [varchar] (100) NULL ,
	[ASSI_Website] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CARACTERISTIQUE] (
	[CARA_Clep] [varchar] (20) NOT NULL ,
	[CARA_Libelle] [varchar] (150) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CATEGORIE] (
	[CATE_Clep] [int] NOT NULL ,
	[CATE_Lib] [varchar] (20) NULL ,
	[CATE_Valide] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CHECKER_ARBRE] (
	[CHAR_Clep] [tinyint] NOT NULL ,
	[CHAR_Libelle] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CIVILITE] (
	[CIVI_Clep] [varchar] (5) NOT NULL ,
	[CIVI_Libelle] [varchar] (150) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CLIENT] (
	[CLIE_Clep] [varchar] (10) NOT NULL ,
	[CLIE__FAMI] [tinyint] NOT NULL ,
	[CLIE__PAYS] [varchar] (3) NULL ,
	[CLIE_Civilite] [varchar] (5) NULL ,
	[CLIE_Nom] [varchar] (40) NULL ,
	[CLIE_Prenom] [varchar] (40) NULL ,
	[CLIE_Adresse1] [varchar] (40) NULL ,
	[CLIE_Adresse2] [varchar] (40) NULL ,
	[CLIE_Adresse3] [varchar] (40) NULL ,
	[CLIE_Codepostal] [varchar] (10) NULL ,
	[CLIE_Ville] [varchar] (40) NULL ,
	[CLIE_Telephone] [varchar] (20) NULL ,
	[CLIE_Numposte] [varchar] (6) NULL ,
	[CLIE_Mobile] [varchar] (20) NULL ,
	[CLIE_Fax] [varchar] (20) NULL ,
	[CLIE_Email] [varchar] (100) NULL ,
	[CLIE_Website] [varchar] (100) NULL ,
	[CLIE_Type] [bit] NULL ,
	[CLIE_Note] [varchar] (1200) NULL ,
	[CLIE_Datecrea] [datetime] NULL ,
	[CLIE_Numsiren] [varchar] (9) NULL ,
	[CLIE_Tvaintracom] [varchar] (13) NULL ,
	[CLIE_Interlocuteur] [varchar] (40) NULL ,
	[CLIE_Date_rappel] [datetime] NULL ,
	[CLIE_A_rappeler] [varchar] (1000) NULL ,
	[CLIE__INTE] [int] NULL ,
	[CLIE_Siret] [varchar] (14) NULL ,
	[CLIE_Codeinsee] [varchar] (5) NULL ,
	[CLIE_Diffgen] [bit] NULL,
	[CLIE__REPR] [varchar] (15) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CODE_POSTAL] (
	[COPO_Clep] [char] (10) NOT NULL ,
	[COPO_Numcod] [tinyint] NOT NULL ,
	[COPO_Burdist] [varchar] (40) NULL ,
	[COPO_Codinsee] [varchar] (5) NULL ,
	[COPO_Ville] [varchar] (40) NULL ,
	[COPO_Latitude] [int] NULL ,
	[COPO_Longitude] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[COMPORTEMENT] (
	[CPTM_Clep] [varchar] (50) NOT NULL ,
	[CPTM_Obligatoire] [tinyint] NULL ,
	[CPTM_Selection] [tinyint] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[COMPORTEMENT_SELECTION] (
	[COSE_Clep] [tinyint] NOT NULL ,
	[COSE_Libelle] [varchar] (100) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[COMPOSANT] (
	[COMP_Clep] [varchar] (12) NOT NULL ,
	[COMP__FOUR] [int] NOT NULL ,
	[COMP__SGRP] [int] NULL ,
	[COMP_Codecom] [varchar] (12) NULL ,
	[COMP_Lib] [varchar] (80) NULL ,
	[COMP_Lib2] [varchar] (280) NULL ,
	[COMP_Prixactuel] [money] NULL ,
	[COMP_Prixfutur] [money] NULL ,
	[COMP_Cubage] [decimal](4, 2) NULL ,
	[COMP_Coefcubage] [decimal](3, 2) NULL ,
	[COMP_Datecreation] [datetime] NULL ,
	[COMP_Poids][decimal](6, 2) NULL ,
	[COMP_Indicspecial] [bit] NULL ,
	[COMP_Libcom] [varchar] (150) NULL ,
	[COMP_Declasse] [bit] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[COMPOSANT_FINITION] (
	[COFI__COMP] [varchar] (12) NOT NULL ,
	[COFI_Num] [int] NOT NULL ,
	[COFI__FINI] [char] (4) NULL ,
	[COFI_Lib] [varchar] (40) NOT NULL ,
	[COFI_Choixfinit] [tinyint] NOT NULL ,
	[COFI__TYFI] [varchar] (4) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DEMO] (
	[DEMO__DEVI1] [int] NOT NULL ,
	[DEMO__DEVI2] [smallint] NOT NULL ,
	[DEMO__TYDE] [int] NOT NULL ,
	[TYMO_Clep] [char] (1) NOT NULL ,
	[DEMO__MODA] [char] (2) NOT NULL ,
	[DEMO_Lib] [varchar] (300) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DICO] (
	[DICO_Fiche] [varchar] (50) NOT NULL ,
	[DICO_Table] [varchar] (50) NOT NULL ,
	[DICO_Nocol] [int] NOT NULL ,
	[DICO_Nomcol] [varchar] (50) NULL ,
	[DICO_Libcol] [varchar] (100) NULL ,
	[DICO_Libhint] [varchar] (100) NULL ,
	[DICO_Affichage] [int] NOT NULL ,
	[DICO_Recc] [int] NULL ,
	[DICO_Help] [int] NOT NULL ,
	[DICO_Tablefk] [varchar] (50) NULL ,
	[DICO_Colfk] [varchar] (50) NULL ,
	[DICO_Coldsp] [varchar] (50) NULL ,
	[DICO_Colobl] [bit] NOT NULL 
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[FAMILLE] (
	[FAMI_Clep] [tinyint] NOT NULL ,
	[FAMI_Lib] [varchar] (30) NULL,
	[FAMI_Valide] [bit] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FINITION] (
	[FINI_Clep] [char] (4) NOT NULL ,
	[FINI_Lib] [varchar] (30) NULL ,
	[FINI_Txcharge] [decimal](5, 2) NULL ,
	[FINI_Declasse] [bit] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [FOURNISSEUR] (
	[FOUR_Clep] [int] NOT NULL ,
	[FOUR__PAYS] [varchar] (3) NULL ,
	[FOUR_Civilite] [varchar] (3) NULL ,
	[FOUR_Nom] [varchar] (40) NULL ,
	[FOUR_Prenom] [varchar] (40) NULL ,
	[FOUR_Adresse1] [varchar] (40) NULL ,
	[FOUR_Adresse2] [varchar] (40) NULL ,
	[FOUR_Adresse3] [varchar] (40) NULL ,
	[FOUR_Codepostal] [varchar] (10) NULL ,
	[FOUR_Ville] [varchar] (40) NULL ,
	[FOUR_Telephone] [varchar] (20) NULL ,
	[FOUR_Numposte] [varchar] (6) NULL ,
	[FOUR_Mobile] [varchar] (20) NULL ,
	[FOUR_Fax] [varchar] (20) NULL ,
	[FOUR_Email] [varchar] (100) NULL ,
	[FOUR_Website] [varchar] (100) NULL ,
	[FOUR_Coefrefac] [decimal](4, 2) NULL ,
	[FOUR_Coefport] [decimal](4, 2) NULL ,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GAMME] (
	[GAMM_Clep] [varchar] (5) NOT NULL ,
	[GAMM_Libelle] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GAMME_TYPR] (
	[GATY__GAMM] [varchar] (5) NOT NULL ,
	[GATY__TYPR] [varchar] (12) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[GROUPE_FINITION] (
	[GRFI__TYFI] [varchar] (4) NOT NULL ,
	[GRFI__FINI] [char] (4) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[INTERLOCUTEUR] (
	[INTE__CLIE] [varchar] (10) NOT NULL ,
	[INTE_Clep] [int] NOT NULL ,
	[INTE_Civilite] [varchar] (5) NULL ,
	[INTE_Telephone] [varchar] (20) NULL ,
	[INTE_Portable] [varchar] (20) NULL ,
	[INTE_Mail] [varchar] (250) NULL ,
	[INTE_Fonction] [varchar] (150) NULL ,
	[INTE_Nom] [varchar] (50) NULL ,
	[INTE_Fax] [varchar] (20) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PAYS] (
	[PAYS_Clep] [varchar] (3) NOT NULL ,
	[PAYS_Nom] [varchar] (50) NOT NULL ,
	[PAYS__TTVA] [int] NOT NULL ,
	[PAYS_Numtel] [smallint] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[REPRESENTANT] (
	[REPR_Clep] [varchar] (15) NOT NULL ,
	[REPR__ASSI] [varchar] (15) NOT NULL ,
	[REPR__PAYS] [varchar] (3) NULL ,
	[REPR_Civilite] [varchar] (5) NULL ,
	[REPR_Nom] [varchar] (40) NULL ,
	[REPR_Prenom] [varchar] (40) NULL ,
	[REPR_Adresse1] [varchar] (40) NULL ,
	[REPR_Adresse2] [varchar] (40) NULL ,
	[REPR_Adresse3] [varchar] (40) NULL ,
	[REPR_Codepostal] [varchar] (10) NULL ,
	[REPR_Ville] [varchar] (40) NULL ,
	[REPR_Telephone] [varchar] (20) NULL ,
	[REPR_Numposte] [varchar] (6) NULL ,
	[REPR_Mobile] [varchar] (20) NULL ,
	[REPR_Fax] [varchar] (20) NULL ,
	[REPR_Email] [varchar] (100) NULL ,
	[REPR_Website] [varchar] (100) NULL ,
	[REPR_Tx] [decimal](4, 2) NULL ,
	[REPR_Credit] [decimal](10, 2) NULL ,
	[REPR_Objca] [decimal](10, 2) NULL ,
	[REPR_Notes] [varchar] (600) NULL ,
	[REPR_Datecreation] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[STRUCTURE] (
	[STRU_Clep] [varchar] (20) NOT NULL ,
	[STRU_Type] [tinyint] NOT NULL ,
	[STRU_Libelle] [varchar] (150) NOT NULL ,
	[STRU_Selectionne] [tinyint] NOT NULL ,
	[STRU_Position] [smallint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[STRUCTURE_COMPOSANT] (
	[SCOM__STRU] [varchar] (20) NOT NULL ,
	[SCOM__COMP] [varchar] (12) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[STRUCTURE_CPTM_ACT] (
	[SCPA__STRU] [varchar] (20) NOT NULL ,
	[SCPA__CPTM] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[STRUCTURE_CPTM_SEL] (
	[SCPS__STRU] [varchar] (20) NOT NULL ,
	[SCPS__CPTM] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[STRUCTURE_LIEE] (
	[STLI__Parent] [varchar] (20) NOT NULL ,
	[STLI__Enfant] [varchar] (20) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TYPE_FINITION] (
	[TYFI_Clep] [varchar] (4) NOT NULL ,
	[TYFI_Libelle] [varchar] (100) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TYPE_PRODUIT] (
	[TYPR_Clep] [varchar] (12) NOT NULL ,
	[TYPR_Libelle] [varchar] (120) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TYPE_PRODUIT_CARA] (
	[TYPC__TYPR] [varchar] (12) NOT NULL ,
	[TYPC__CARA] [varchar] (20) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TYPE_STRUCTURE] (
	[TYST_Clep] [tinyint] NOT NULL ,
	[TYST_Libelle] [varchar] (100) NOT NULL 
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[CLIENT_DIFFUSION] (
	[CLDI__CLIE] [varchar] (10) NOT NULL ,
	[CLDI__REPR] [varchar] (15) NOT NULL 
) ON [PRIMARY]
GO

/************** Ajout des cl?s primaires **************/
ALTER TABLE [dbo].[AFFECTATION] WITH NOCHECK ADD 
	CONSTRAINT [PK_AFFE] PRIMARY KEY  CLUSTERED 
	(
		[AFFE__CLIE],
		[AFFE_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BASE_COMPOSE] WITH NOCHECK ADD 
	CONSTRAINT [PK_ART] PRIMARY KEY  CLUSTERED 
	(
		[BACO_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BASE_COMPOSE_FINITION] WITH NOCHECK ADD 
	CONSTRAINT [PK_ARFI] PRIMARY KEY  CLUSTERED 
	(
		[ARFI__BACO],
		[ARFI_Num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BASE_COMPOSE_STRUCTURE] WITH NOCHECK ADD 
	CONSTRAINT [PK_ARST_STRU] PRIMARY KEY  CLUSTERED 
	(
		[ARST__BACO],
		[ARST__STRU]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ASSISTANTE] WITH NOCHECK ADD 
	CONSTRAINT [PK_ASSI] PRIMARY KEY  CLUSTERED 
	(
		[ASSI_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CARACTERISTIQUE] WITH NOCHECK ADD 
	CONSTRAINT [PK_CARA] PRIMARY KEY  CLUSTERED 
	(
		[CARA_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CATEGORIE] WITH NOCHECK ADD 
	CONSTRAINT [PK_CATE] PRIMARY KEY  CLUSTERED 
	(
		[CATE_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CHECKER_ARBRE] WITH NOCHECK ADD 
	CONSTRAINT [PK_CHAR] PRIMARY KEY  CLUSTERED 
	(
		[CHAR_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CIVILITE] WITH NOCHECK ADD 
	CONSTRAINT [PK_CIVI] PRIMARY KEY  CLUSTERED 
	(
		[CIVI_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CLIENT] WITH NOCHECK ADD 
	CONSTRAINT [PK_CLIE] PRIMARY KEY  CLUSTERED 
	(
		[CLIE_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CODE_POSTAL] WITH NOCHECK ADD 
	CONSTRAINT [PK_COPO] PRIMARY KEY  CLUSTERED 
	(
		[COPO_Clep],
		[COPO_Numcod]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[COMMISSION] WITH NOCHECK ADD 
	CONSTRAINT [PK_COMM] PRIMARY KEY  CLUSTERED 
	(
		[COMM__TYDE],
		[COMM__DEVI1],
		[COMM__DEVI2],
		[COMM_Num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[COMPORTEMENT] WITH NOCHECK ADD 
	CONSTRAINT [PK_CPTM] PRIMARY KEY  CLUSTERED 
	(
		[CPTM_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[COMPORTEMENT_SELECTION] WITH NOCHECK ADD 
	CONSTRAINT [PK_COSE] PRIMARY KEY  CLUSTERED 
	(
		[COSE_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[COMPOSANT] WITH NOCHECK ADD 
	CONSTRAINT [PK_COMP] PRIMARY KEY  CLUSTERED 
	(
		[COMP_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[COMPOSANT_FINITION] WITH NOCHECK ADD 
	CONSTRAINT [PK_COFI] PRIMARY KEY  CLUSTERED 
	(
		[COFI__COMP],
		[COFI_Num]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DEMO] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO] PRIMARY KEY  CLUSTERED 
	(
		[DEMO__TYDE],
		[TYMO_Clep],
		[DEMO__DEVI1],
		[DEMO__DEVI2],
		[DEMO__MODA]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[DICO] WITH NOCHECK ADD 
	CONSTRAINT [PK_DICO] PRIMARY KEY  CLUSTERED 
	(
		[DICO_Fiche],
		[DICO_Table],
		[DICO_Nocol]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FAMILLE] WITH NOCHECK ADD 
	CONSTRAINT [PK_FAMI] PRIMARY KEY  CLUSTERED 
	(
		[FAMI_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FINITION] WITH NOCHECK ADD 
	CONSTRAINT [PK_FINI] PRIMARY KEY  CLUSTERED 
	(
		[FINI_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FOURNISSEUR] WITH NOCHECK ADD 
	CONSTRAINT [PK_FOUR] PRIMARY KEY  CLUSTERED 
	(
		[FOUR_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GAMME] WITH NOCHECK ADD 
	CONSTRAINT [PK_GAMM] PRIMARY KEY  CLUSTERED 
	(
		[GAMM_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GAMME_TYPR] WITH NOCHECK ADD 
	CONSTRAINT [PK_GATY] PRIMARY KEY  CLUSTERED 
	(
		[GATY__GAMM],
		[GATY__TYPR]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GROUPE_FINITION] WITH NOCHECK ADD 
	CONSTRAINT [PK_GRFI] PRIMARY KEY  CLUSTERED 
	(
		[GRFI__TYFI],
		[GRFI__FINI]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[INTERLOCUTEUR] WITH NOCHECK ADD 
	CONSTRAINT [PK_INTE] PRIMARY KEY  CLUSTERED 
	(
		[INTE__CLIE],
		[INTE_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PAYS] WITH NOCHECK ADD 
	CONSTRAINT [PK_PAYS] PRIMARY KEY  CLUSTERED 
	(
		[PAYS_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[REPRESENTANT] WITH NOCHECK ADD 
	CONSTRAINT [PK_REPR] PRIMARY KEY  CLUSTERED 
	(
		[REPR_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[STRUCTURE] WITH NOCHECK ADD 
	CONSTRAINT [PK_STRU] PRIMARY KEY  CLUSTERED 
	(
		[STRU_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[STRUCTURE_COMPOSANT] WITH NOCHECK ADD 
	CONSTRAINT [PK_SCOM] PRIMARY KEY  CLUSTERED 
	(
		[SCOM__STRU],
		[SCOM__COMP]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[STRUCTURE_CPTM_ACT] WITH NOCHECK ADD 
	CONSTRAINT [PK_SCPA] PRIMARY KEY  CLUSTERED 
	(
		[SCPA__STRU],
		[SCPA__CPTM]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[STRUCTURE_CPTM_SEL] WITH NOCHECK ADD 
	CONSTRAINT [PK_SCPS] PRIMARY KEY  CLUSTERED 
	(
		[SCPS__STRU],
		[SCPS__CPTM]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[STRUCTURE_LIEE] WITH NOCHECK ADD 
	CONSTRAINT [PK_STLI] PRIMARY KEY  CLUSTERED 
	(
		[STLI__Parent],
		[STLI__Enfant]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TYPE_FINITION] WITH NOCHECK ADD 
	CONSTRAINT [PK_TYFI] PRIMARY KEY  CLUSTERED 
	(
		[TYFI_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TYPE_MODALITE] WITH NOCHECK ADD 
	CONSTRAINT [PK_TYMO] PRIMARY KEY  CLUSTERED 
	(
		[TYMO_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TYPE_PRODUIT] WITH NOCHECK ADD 
	CONSTRAINT [PK_TYPR] PRIMARY KEY  CLUSTERED 
	(
		[TYPR_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TYPE_PRODUIT_CARA] WITH NOCHECK ADD 
	CONSTRAINT [PK_TYPC] PRIMARY KEY  CLUSTERED 
	(
		[TYPC__TYPR],
		[TYPC__CARA]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TYPE_STRUCTURE] WITH NOCHECK ADD 
	CONSTRAINT [PK_TYST] PRIMARY KEY  CLUSTERED 
	(
		[TYST_Clep]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CLIENT_DIFFUSION] WITH NOCHECK ADD 
	CONSTRAINT [PK_CLDI] PRIMARY KEY  CLUSTERED 
	(
		[CLDI__CLIE],
		[CLDI__REPR]
	)  ON [PRIMARY] 
GO

/************** Ajout des d?pendances fonctionnelles **************/
ALTER TABLE [dbo].[BASE_COMPOSE] WITH NOCHECK ADD 
	CONSTRAINT [DF_BASE_COMPOSE_BACO_Compose] DEFAULT (0) FOR [BACO_Compose]
GO

ALTER TABLE [dbo].[CATEGORIE] WITH NOCHECK ADD 
	CONSTRAINT [DF_CATEGORIE_CATE_Valide] DEFAULT (0) FOR [CATE_Valide]
GO

/************** Ajout des index **************/
CREATE INDEX [FK_BACO_FOUR] ON [dbo].[BASE_COMPOSE]([BACO__FOUR]) ON [PRIMARY]
GO

CREATE INDEX [FK_ARFI_BACO] ON [dbo].[BASE_COMPOSE_FINITION]([ARFI__BACO]) ON [PRIMARY]
GO

CREATE INDEX [FK_ARFI_COUL] ON [dbo].[BASE_COMPOSE_FINITION]([ARFI__FINI]) ON [PRIMARY]
GO

CREATE INDEX [FK_ASSI_PAYS] ON [dbo].[ASSISTANTE]([ASSI__PAYS]) ON [PRIMARY]
GO

CREATE INDEX [FK_CLIE_FAMI] ON [dbo].[CLIENT]([CLIE__FAMI]) ON [PRIMARY]
GO

CREATE INDEX [FK_CLIE_PAYS] ON [dbo].[CLIENT]([CLIE__PAYS]) ON [PRIMARY]
GO

CREATE INDEX [FK_COMM_REPR] ON [dbo].[COMMISSION]([COMM__REPR]) ON [PRIMARY]
GO

CREATE INDEX [FK_COMM_DEVI] ON [dbo].[COMMISSION]([COMM__TYDE], [COMM__DEVI1], [COMM__DEVI2]) ON [PRIMARY]
GO

CREATE INDEX [FK_COMP_FOUR] ON [dbo].[COMPOSANT]([COMP__FOUR]) ON [PRIMARY]
GO

CREATE INDEX [FK_COMP_SGRP] ON [dbo].[COMPOSANT]([COMP__SGRP]) ON [PRIMARY]
GO

CREATE INDEX [FK_DEMO_DEVI] ON [dbo].[DEMO]([DEMO__TYDE], [DEMO__DEVI1], [DEMO__DEVI2]) ON [PRIMARY]
GO

CREATE INDEX [FK_DEMO_MODA] ON [dbo].[DEMO]([TYMO_Clep], [DEMO__MODA]) ON [PRIMARY]
GO

CREATE INDEX [FK_FOUR_PAYS] ON [dbo].[FOURNISSEUR]([FOUR__PAYS]) ON [PRIMARY]
GO

CREATE INDEX [FK_REPR_ASSI] ON [dbo].[REPRESENTANT]([REPR__ASSI]) ON [PRIMARY]
GO

CREATE INDEX [FK_REPR_PAYS] ON [dbo].[REPRESENTANT]([REPR__PAYS]) ON [PRIMARY]
GO

CREATE INDEX [IX_COPO_Codinsee] ON [dbo].[CODE_POSTAL]([COPO_Codinsee]) ON [PRIMARY]
GO

/************** Ajout des cl?s ?trang?res **************/
ALTER TABLE [dbo].[AFFECTATION] ADD 
	CONSTRAINT [FK_AFFE_CLIE] FOREIGN KEY 
	(
		[AFFE__CLIE]
	) REFERENCES [dbo].[CLIENT] (
		[CLIE_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[BASE_COMPOSE] ADD 
	CONSTRAINT [FK_BACO_CARA] FOREIGN KEY 
	(
		[BACO__CARA]
	) REFERENCES [dbo].[CARACTERISTIQUE] (
		[CARA_Clep]
	),
	CONSTRAINT [FK_BACO_FOUR] FOREIGN KEY 
	(
		[BACO__FOUR]
	) REFERENCES [dbo].[FOURNISSEUR] (
		[FOUR_Clep]
	),
	CONSTRAINT [FK_BACO_GAMM] FOREIGN KEY 
	(
		[BACO__GAMM]
	) REFERENCES [dbo].[GAMME] (
		[GAMM_Clep]
	) ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_BACO_TYPR] FOREIGN KEY 
	(
		[BACO__TYPR]
	) REFERENCES [dbo].[TYPE_PRODUIT] (
		[TYPR_Clep]
	) ON UPDATE CASCADE  NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[BASE_COMPOSE_FINITION] ADD 
	CONSTRAINT [FK_ARFI_BACO] FOREIGN KEY 
	(
		[ARFI__BACO]
	) REFERENCES [dbo].[BASE_COMPOSE] (
		[BACO_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_ARFI_FINI] FOREIGN KEY 
	(
		[ARFI__FINI]
	) REFERENCES [dbo].[FINITION] (
		[FINI_Clep]
	)
GO

ALTER TABLE [dbo].[BASE_COMPOSE_STRUCTURE] ADD 
	CONSTRAINT [FK_ARST_BACO] FOREIGN KEY 
	(
		[ARST__BACO]
	) REFERENCES [dbo].[BASE_COMPOSE] (
		[BACO_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_ARST_STRU] FOREIGN KEY 
	(
		[ARST__STRU]
	) REFERENCES [dbo].[STRUCTURE] (
		[STRU_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[ASSISTANTE] ADD 
	CONSTRAINT [FK_ASSI_PAYS] FOREIGN KEY 
	(
		[ASSI__PAYS]
	) REFERENCES [dbo].[PAYS] (
		[PAYS_Clep]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[CLIENT] ADD 
	CONSTRAINT [FK_CLIE_PAYS] FOREIGN KEY 
	(
		[CLIE__PAYS]
	) REFERENCES [dbo].[PAYS] (
		[PAYS_Clep]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[COMPORTEMENT] ADD 
	CONSTRAINT [FK_CPTM_COSE] FOREIGN KEY 
	(
		[CPTM_Selection]
	) REFERENCES [dbo].[COMPORTEMENT_SELECTION] (
		[COSE_Clep]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[COMPOSANT] ADD 
	CONSTRAINT [FK_COMP_FOUR] FOREIGN KEY 
	(
		[COMP__FOUR]
	) REFERENCES [dbo].[FOURNISSEUR] (
		[FOUR_Clep]
	)
GO

ALTER TABLE [dbo].[COMPOSANT_FINITION] ADD 
	CONSTRAINT [FK_COFI_COMP] FOREIGN KEY 
	(
		[COFI__COMP]
	) REFERENCES [dbo].[COMPOSANT] (
		[COMP_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_COFI_FINI] FOREIGN KEY 
	(
		[COFI__FINI]
	) REFERENCES [dbo].[FINITION] (
		[FINI_Clep]
	)
GO

ALTER TABLE [dbo].[FOURNISSEUR] ADD 
	CONSTRAINT [FK_FOUR_PAYS] FOREIGN KEY 
	(
		[FOUR__PAYS]
	) REFERENCES [dbo].[PAYS] (
		[PAYS_Clep]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[GAMME_TYPR] ADD 
	CONSTRAINT [FK_GATY_GAMM] FOREIGN KEY 
	(
		[GATY__GAMM]
	) REFERENCES [dbo].[GAMME] (
		[GAMM_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_GATY_TYPR] FOREIGN KEY 
	(
		[GATY__TYPR]
	) REFERENCES [dbo].[TYPE_PRODUIT] (
		[TYPR_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[GROUPE_FINITION] ADD 
	CONSTRAINT [FK_GRFI_FINI] FOREIGN KEY 
	(
		[GRFI__FINI]
	) REFERENCES [dbo].[FINITION] (
		[FINI_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_GRFI_TYFI] FOREIGN KEY 
	(
		[GRFI__TYFI]
	) REFERENCES [dbo].[TYPE_FINITION] (
		[TYFI_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[INTERLOCUTEUR] ADD 
	CONSTRAINT [FK_INTE_CLIE] FOREIGN KEY 
	(
		[INTE__CLIE]
	) REFERENCES [dbo].[CLIENT] (
		[CLIE_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[PAYS] ADD 
	CONSTRAINT [FK_PAYS_TTVA] FOREIGN KEY 
	(
		[PAYS__TTVA]
	) REFERENCES [dbo].[TTVA] (
		[TTVA_Clep]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[REPRESENTANT] ADD 
	CONSTRAINT [FK_REPR_ASSI] FOREIGN KEY 
	(
		[REPR__ASSI]
	) REFERENCES [dbo].[ASSISTANTE] (
		[ASSI_Clep]
	)
GO

ALTER TABLE [dbo].[STRUCTURE] ADD 
	CONSTRAINT [FK_STRU_TYST] FOREIGN KEY 
	(
		[STRU_Type]
	) REFERENCES [dbo].[TYPE_STRUCTURE] (
		[TYST_Clep]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[STRUCTURE_COMPOSANT] ADD 
	CONSTRAINT [FK_SCOM_COMP] FOREIGN KEY 
	(
		[SCOM__COMP]
	) REFERENCES [dbo].[COMPOSANT] (
		[COMP_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_SCOM_STRU] FOREIGN KEY 
	(
		[SCOM__STRU]
	) REFERENCES [dbo].[STRUCTURE] (
		[STRU_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[STRUCTURE_CPTM_ACT] ADD 
	CONSTRAINT [FK_SCPA_CPTM] FOREIGN KEY 
	(
		[SCPA__CPTM]
	) REFERENCES [dbo].[COMPORTEMENT] (
		[CPTM_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_SCPA_STRU] FOREIGN KEY 
	(
		[SCPA__STRU]
	) REFERENCES [dbo].[STRUCTURE] (
		[STRU_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[STRUCTURE_CPTM_SEL] ADD 
	CONSTRAINT [FK_SCPS_CPTM] FOREIGN KEY 
	(
		[SCPS__CPTM]
	) REFERENCES [dbo].[COMPORTEMENT] (
		[CPTM_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_SCPS_STRU] FOREIGN KEY 
	(
		[SCPS__STRU]
	) REFERENCES [dbo].[STRUCTURE] (
		[STRU_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[STRUCTURE_LIEE] ADD 
	CONSTRAINT [FK_STLI_STRU_PARENT] FOREIGN KEY 
	(
		[STLI__Parent]
	) REFERENCES [dbo].[STRUCTURE] (
		[STRU_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[TYPE_PRODUIT_CARA] ADD 
	CONSTRAINT [FK_CARA_TYPC] FOREIGN KEY 
	(
		[TYPC__CARA]
	) REFERENCES [dbo].[CARACTERISTIQUE] (
		[CARA_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TYPR_TYPC] FOREIGN KEY 
	(
		[TYPC__TYPR]
	) REFERENCES [dbo].[TYPE_PRODUIT] (
		[TYPR_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[CLIENT_DIFFUSION] ADD 
	CONSTRAINT [FK_CLDI_CLIE] FOREIGN KEY 
	(
		[CLDI__CLIE]
	) REFERENCES [dbo].[CLIENT] (
		[CLIE_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_CLDI_REPR] FOREIGN KEY 
	(
		[CLDI__REPR]
	) REFERENCES [dbo].[REPRESENTANT] (
		[REPR_Clep]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION 
GO

/************** Cr?ation des Triggers **************/
/* Les triggers li?s aux indicateurs des lots */
CREATE TRIGGER TR_LSOU_ARST ON [dbo].[BASE_COMPOSE_STRUCTURE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'ARST'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'ARST' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_CARA ON [dbo].[CARACTERISTIQUE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'CARA'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'CARA' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_CATE ON [dbo].[CATEGORIE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'CATE'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'CATE' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_CHAR ON [dbo].[CHECKER_ARBRE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'CHAR'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'CHAR' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_CIVI ON [dbo].[CIVILITE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'CIVI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'CIVI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_COFI ON [dbo].[COMPOSANT_FINITION]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'COFI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'COFI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_COPO ON [dbo].[CODE_POSTAL]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'COPO'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'COPO' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_COSE ON [dbo].[COMPORTEMENT_SELECTION]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'COSE'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'COSE' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_CPTM ON [dbo].[COMPORTEMENT]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'CPTM'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'CPTM' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_COMP ON [dbo].[COMPOSANT]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'COMP'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'COMP' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_FAMI ON [dbo].[FAMILLE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'FAMI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'FAMI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_FINI ON [dbo].[FINITION]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'FINI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'FINI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_FOUR ON [dbo].[FOURNISSEUR]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'FOUR'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'FOUR' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_GATY ON [dbo].[GAMME_TYPR]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'GATY'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'GATY' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_GAMM ON [dbo].[GAMME]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'GAMM'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'GAMM' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_GRFI ON [dbo].[GROUPE_FINITION]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'GRFI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'GRFI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_PAYS ON [dbo].[PAYS]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'PAYS'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'PAYS' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_SCOM ON [dbo].[STRUCTURE_COMPOSANT]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'SCOM'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'SCOM' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_SCPA ON [dbo].[STRUCTURE_CPTM_ACT]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'SCPA'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'SCPA' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_SCPS ON [dbo].[STRUCTURE_CPTM_SEL]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'SCPS'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'SCPS' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_STLI ON [dbo].[STRUCTURE_LIEE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'STLI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'STLI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_STRU ON [dbo].[STRUCTURE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'STRU'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'STRU' AND LSOU_Indicateur = 0
GO


CREATE TRIGGER TR_LSOU_TYFI ON [dbo].[TYPE_FINITION]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'TYFI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'TYFI' AND LSOU_Indicateur = 0
GO


CREATE TRIGGER TR_LSOU_TYPR ON [dbo].[TYPE_PRODUIT]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'TYPR'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'TYPR' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_TYPC ON [dbo].[TYPE_PRODUIT_CARA]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'TYPC'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'TYPC' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_TYST ON [dbo].[TYPE_STRUCTURE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'TYST'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'TYST' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_BACO ON [dbo].[BASE_COMPOSE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'BACO'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'BACO' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_ARFI ON [dbo].[BASE_COMPOSE_FINITION]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'ARFI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'ARFI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_ASSI ON [dbo].[ASSISTANTE]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'ASSI'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'ASSI' AND LSOU_Indicateur = 0
GO

CREATE TRIGGER TR_LSOU_REPR ON [dbo].[REPRESENTANT]
FOR INSERT, UPDATE, DELETE
AS
DECLARE @indic bit
SELECT @indic = LSOU_Indicateur FROM LOT_SIEGE_OUT WHERE LSOU_Clep = 'REPR'
IF @indic = 0
UPDATE LOT_SIEGE_OUT
SET LSOU_Indicateur = 1, LSOU_Dernmodif = getdate() WHERE LSOU_Clep = 'REPR' AND LSOU_Indicateur = 0
GO

/* Les triggers rempla?ant les FK */
CREATE TRIGGER TR_STLI_STRU_ENFANT_INSERT ON [dbo].[STRUCTURE_LIEE] 
FOR INSERT,UPDATE
NOT FOR REPLICATION
AS
BEGIN
DECLARE @new AS varchar(200)
SELECT @new	= STLI__Enfant FROM inserted
IF NOT EXISTS (SELECT * FROM STRUCTURE WHERE STRU_Clep = @new)
	BEGIN
		SET @new = @new  + ' n''existe pas dans la table STRUCTURE.'
		RAISERROR (@new, 16, 1)
		ROLLBACK TRANSACTION
	END
END
GO

CREATE TRIGGER TR_STRU_STLI_ENFANT_UPDATE ON [dbo].[STRUCTURE] 
FOR UPDATE
NOT FOR REPLICATION
AS
BEGIN
IF UPDATE (STRU_Clep)
	BEGIN
		ALTER TABLE STRUCTURE_LIEE DISABLE TRIGGER TR_STLI_STRU_ENFANT_INSERT
		DECLARE @old AS varchar(20), @new AS varchar(20)
		SELECT @old	= STRU_Clep FROM deleted
		SELECT @new	= STRU_Clep FROM inserted
		UPDATE STRUCTURE_LIEE SET STLI__Enfant = @new WHERE STLI__Enfant = @old
		ALTER TABLE STRUCTURE_LIEE ENABLE TRIGGER TR_STLI_STRU_ENFANT_INSERT
	END
END
GO

CREATE TRIGGER TR_STRU_STLI_ENFANT_DELETE ON [dbo].[STRUCTURE] 
FOR DELETE
NOT FOR REPLICATION
AS
BEGIN
DECLARE @old AS varchar(20)
SELECT @old	= STRU_Clep FROM deleted
IF EXISTS (SELECT * FROM STRUCTURE_LIEE WHERE  STLI__Enfant = @old)
	DELETE FROM STRUCTURE_LIEE WHERE STLI__Enfant = @old
END
GO

CREATE TRIGGER TR_REPR_PAYS_INSERT ON [dbo].[REPRESENTANT] 
FOR INSERT,UPDATE
NOT FOR REPLICATION
AS
BEGIN
DECLARE @new AS varchar(200)
SELECT @new	= REPR__PAYS FROM inserted
IF NOT EXISTS (SELECT * FROM PAYS WHERE PAYS_Clep = @new)
	BEGIN
		SET @new = @new  + ' n''existe pas dans la table PAYS.'
		RAISERROR (@new, 16, 1)
		ROLLBACK TRANSACTION
	END
END
GO

CREATE TRIGGER TR_PAYS_REPR_UPDATE ON [dbo].[PAYS]
FOR UPDATE
NOT FOR REPLICATION
AS
BEGIN
DECLARE @old AS varchar(20), @new AS varchar(20)
SELECT @old	= PAYS_Clep FROM deleted
IF UPDATE (PAYS_Clep)
AND EXISTS ( SELECT * FROM REPRESENTANT WHERE REPR__PAYS = @old )
	BEGIN
		ALTER TABLE REPRESENTANT DISABLE TRIGGER TR_REPR_PAYS_INSERT
		SELECT @new	= PAYS_Clep FROM inserted
		UPDATE REPRESENTANT SET REPR__PAYS = @new WHERE REPR__PAYS = @old
		ALTER TABLE REPRESENTANT ENABLE TRIGGER TR_REPR_PAYS_INSERT
	END
END
GO

CREATE TRIGGER TR_CLIENT ON [dbo].[CLIENT]
AFTER UPDATE
NOT FOR REPLICATION
AS
BEGIN
IF UPDATE(CLIE_Clep)
BEGIN
DECLARE @old varchar(10), @new varchar(10)
SELECT @old = CLIE_Clep FROM deleted
SELECT @new = CLIE_Clep FROM inserted

DECLARE @interlocuteur varchar(40)
SELECT @interlocuteur = CLIE_Interlocuteur FROM CLIENT WHERE CLIE_Clep = @new
IF @interlocuteur is NULL
	UPDATE CLIENT SET CLIE_Interlocuteur = @old WHERE CLIE_Interlocuteur is NULL AND CLIE_Clep = @new
END
END
GO
