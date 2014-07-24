program FDV;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Forms, Interfaces,
  U_FormMainIni,
  fonctions_dialogs,
  fonctions_forms,
  LCLType,
  U_SeleArticle in 'U_SeleArticle.pas' {F_SeleArticle},
  U_Categorie in 'U_Categorie.pas' {F_Categ},
  U_Client in 'U_Client.pas' {F_Client},
  U_Composant in 'U_Composant.pas' {F_Composant},
  U_ConstMessage in 'U_ConstMessage.pas',
  U_DmDonn in 'U_DmDonn.pas' {M_Donn},
  U_Famille in 'U_Famille.pas' {F_Famille},
  U_Fournisseur in 'U_Fournisseur.pas' {F_Fournisseur},
  U_ListeCoul in 'U_ListeCoul.pas' {F_ListeCoul},
  U_Modalite in 'U_Modalite.pas' {F_Modalite},
  U_CodePostal in 'U_CodePostal.pas' {F_CodePostal},
  U_Representant in 'U_Representant.pas' {F_Repr},
  U_TVA in 'U_TVA.pas' {F_TVA},
  U_comm in 'U_comm.pas' {F_Comm},
  U_Sousfamillevente in 'U_Sousfamillevente.pas' {F_Sousfamillevente},
  U_Soussousfamvente in 'U_Soussousfamvente.pas' {F_Soussousfamvente},
  U_Famillevente in 'U_Famillevente.pas' {F_Famillevente},
  U_Gamme in 'U_Gamme.pas' {F_Gamme},
  U_TypeProduit in 'U_TypeProduit.pas' {F_TypeProduit},
  U_Caracteristique in 'U_Caracteristique.pas' {F_Caracteristique},
  U_ComposeArticle in 'U_ComposeArticle.pas' {F_ComposeArticle},
  U_Civilite in 'U_Civilite.pas' {F_Civilite},
  U_DmCompose in 'U_DmCompose.pas' {M_DmCompose},
  U_Structure in 'U_Structure.pas' {F_Structure},
  U_Comportement in 'U_Comportement.pas' {F_Comportement},
  U_Pays in 'U_Pays.pas' {F_Pays},
  U_Prodrepr in 'U_Prodrepr.pas' {F_Prodrepr},
  U_Prodfiche in 'U_Prodfiche.pas' {F_Prodfiche},
  U_RepSecteur in 'U_RepSecteur.pas' {F_RepSecteur},
  U_Interloc in 'U_Interloc.pas' {F_Interloc},
  U_Affectation in 'U_Affectation.pas' {F_Affectation},
  U_DmArticle in 'U_DmArticle.pas' {M_Article: TDataModule};

{$IFNDEF FPC}
{$R *.res}
{$R WindowsXP.res}
{$ENDIF}

begin
  Application.Initialize;
  Application.Title := 'Force de Vente';

  doShowWorking( 'FORCES DE VENTE' );

  Application.CreateForm(TM_Donn, M_Donn);
  Application.CreateForm(TM_Article, M_Article);
  Application.CreateForm(TM_DmCompose, M_DmCompose);
  Application.CreateForm(TF_Composant, F_Composant);
{  if gb_MainFormIniDirectAccessOnServer Then
    with M_Article do
      Begin
        zq_Article1.CursorLocation := clUseServer ;
        zq_Article1.CursorType     := ctKeySet ;
        zq_Article2.CursorLocation := clUseServer ;
        zq_Article2.CursorType     := ctKeySet ;
        zq_Article3.CursorLocation := clUseServer ;
        zq_Article3.CursorType     := ctKeySet ;
        zq_Article4.CursorLocation := clUseServer ;
        zq_Article4.CursorType     := ctKeySet ;
        zq_Article5.CursorLocation := clUseServer ;
        zq_Article5.CursorType     := ctKeySet ;
        zq_Article6.CursorLocation := clUseServer ;
        zq_Article6.CursorType     := ctKeySet ;
      End ;
  finally
  end;                }
  p_RegisterClasses ([TF_Modalite, TF_Categ, TF_Client, TF_Composant,
                      TF_Famille, TF_Fournisseur,
                      TF_ListeCoul, TF_CodePostal, TF_TVA, TF_Repr,
                      TF_Modalite, TF_Comm,
                      TF_Famillevente, TF_Sousfamillevente, TF_Soussousfamvente,
                      TF_SeleArticle, TF_Gamme, TF_TypeProduit, TF_Caracteristique,
                      TF_Civilite, TF_Structure, TF_Comportement, TF_ComposeArticle,
                      TF_Pays, TF_Prodrepr, TF_Affectation,
                      TF_Prodfiche,TF_RepSecteur, TF_Interloc]);


  Application.Run;
end.
