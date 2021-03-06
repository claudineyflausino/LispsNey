;;;; RDV Treinamentos - Autodesk Authorized Training Center
;;;; RENATO DONATO VIANA
;;;; 10/07/2016
;;;; 
;;;; Rotina desenvolvida para configurações de cotas de Civil, Elétrica, Tubulação, Intrumentação & controle
;;;; Estrutura Metálica
;;;; 
;;;; 
(defun c:c_cotas ()
  (setvar "cmdecho" 0)
   (command "DIM" "SAVE" "Standard" "Y" "exit")
   (command "DIM" "SAVE" "Annotative" "Y" "exit")
   (command "-dimstyle" "AN" "Y" "Annotative" "y" "A" "")(command "-dimstyle" "S" "Annotative" "Y")(command "-dimstyle" "R" "all")
   (command "DIMALT" "OFF")
   (command "DIMALTRND" "0.0000")
   (command "DIMALTTD" "4")
   (command "DIMALTTZ" "0")
   (command "DIMALTU" "2")
   (command "DIMALTZ" "0")
   (command "DIMARCSYM" "0")
   (command "DIMASO" "ON")
   (command "DIMASZ" "2.0000")
   (command "DIMATFIT" "3")
   (command "DIM" "BLK" "." "EXIT" "")
   (command "DIMAUNIT" "0")
   (command "DIMAZIN" "0")
   (command "DIMCEN" "5")
   (command "DIMCLRD" "250"); INDICA A COR DA LINHA DA COTA
   (command "DIMCLRE" "250"); INDICA A COR LINHA DE CHAMDA DA COTA
   (command "DIMCLRT" "2"); INDICA A COR DO TEXTO DA COTA
   (command "DIMDEC" "0")
   (command "DIMDLE" "0")
   (command "DIMDLE" "0")
   (command "DIMDLI" "8.0000")
   (command "DIMEXE" "1.0000")
   (command "DIMEXO" "1.0000")
   (command "DIMFXL" "1.0000")
   (command "DIMFXLON" "OFF")
   (command "DIMGAP" "1.0000")
   (command "DIMJOGANG" "45")
   (command "DIMJUST" "0")
   (command "layer" "make" "cotas" "color" "1" "cotas" "")
   (command "layer" "set" "cotas" ""); ATIVA O LAYER G_COTAS CORRENTE
   (command "DIMLFAC" "1.0000")
   (command "DIMLIM" "OFF")
   (command "DIMLUNIT" "2")
   (command "DIMRND" "0.0000")
   (command "DIMSAH" "OFF")
   (command "DIMTMOVE" "2")
   (command "DIMSD1" "OFF")
   (command "DIMSD1" "Off")
   (command "DIMSD2" "Off")
   (command "DIMSOXD" "Off")
   (command "DIMSE1" "Off")
   (command "DIMSE2" "Off")
   (command "DIMSHO" "ON")
   (command "DIMDEC" "0")
   (command "DIMRND" "0.0000")
   (command "DIMSAH" "Off")
   (command "DIMTFILL" "0")
   (command "DIMTXT" "0.15"); INDICA A ALTURA DO TEXTO DA COTA
   (command "DIMTIX" "On")
   (command "DIMTIH" "Off")
   (command "DIMGAP" "1.0000")
   (command "DIMTOH" "Off")
   (command "DIMJUST" "0")
   (command "DIMTAD" "1")
   (command "DIMPOST" "")
   (command "DIMTM" "0.0000")
   (command "DIMTP" "0.0000")
   (command "DIMTOL" "Off")
   (command "DIMLIM" "Off")
   (command "DIMTOLJ" "1")
   (command "DIMTDEC" "0")
   (command "DIMTFAC" "1.0000")
   (command "DIMTZIN" "0")
   (command "DIMTOFL" "ON")
   (command "DIMZIN" "0")
   (command "style" "Standard" "romans.shx" "A" "" "" "" "" "" "" "" ""); CONFIGURA O ESTLO DE TEXTO STANDARD EM ANNOTATIVO
   (command "-style" "Annotative" "romans.shx" "" "" "" "" "" "")
   (command "DIMTXSTY" "Annotative")
   (command "zoom" "ALL")
   (command "-dimstyle" "s" "standard" "y")
   (command "-dimstyle" "s" "Annotative" "y")
   (command "dim" "UP" "ALL" "" "EXIT"); EXECUTA O DIMUPDATE
   (princ)
   (Print "OS ESTILOS DE COTAS FORAM CONFIGURADOS COM SUCESSO")
   (setvar "cmdecho" 1)
  (princ)
  )