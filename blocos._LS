
;(setq path "e:/LispsNey/")

;blocos arquitetonico

(defun c:chuveiro (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" "chuveiro" pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:nivelcorte (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" "CotaNivelCorte" pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:cotanivel (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" "CotaNivelPlantaBaixa" pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:Telha (/)
  (guarda_status)
  (setvar "osmode" 512)
  (command "._insert" "TelhaCeramica" pause 1 1 pause)
  (devolve_status)
  (princ)
)


(defun c:beiralmadeira (/)
  (command "._insert" "BeiralMadeira" pause 1 1 pause)
  (princ)
)

(defun c:EstacaCorte (/)
  (command "._insert" "EstacaCorte" pause 1 1 pause)
  (princ)
)

(defun pendural (p1 p2 / )
  
  (setq dir (angle p1 p2))

  (command "._insert" "cumeeira" "_non" p1 1 1 p	2)

  (command "._explode" "l" "")

  (setq p3 (polar p1 dir 0.80))

  (setq dir2 (- dir (/ pi 2)))
  
  (setq p4 (polar p3 dir2 0.10))
  (setq p5 (polar p3 dir2 -0.10))

  (setq p6 (polar p2 dir -0.05))
  (setq p7 (polar p6 dir2 0.06))
  (setq p8 (polar p6 dir2 -0.06))

  (crl "021" 1)
  (setvar "clayer" "021")
  (command "_line" "_non" p7 "_non" p8 "")
  (command "_extend" "l" "" "f" "_non" p4 "_non" p5 "" "")
  (command "_trim" "f" "_non" p4 "_non" p5 "" "" "f" "_non" p1 "_non" p2 "" "")
  (princ)
)

(defun c:pendural2 ()

  (guarda_status)
  (setvar "osmode" 1)
  (setq p1 (getpoint "\n Selecione o ponto de insersão2:"))
  
  (setvar "osmode" 128)
  
  (setq p2 (getpoint p1 "\n Selecione a base do Pendural:"))

  (devolve_status)
  
  (setq dir (angle p1 p2))

  (command "._insert" "cumeeira" "_non" p1 1 1 p2)

  (command "._explode" "l" "")

  (setq p3 (polar p1 dir 0.80))

  (setq dir2 (- dir (/ pi 2)))
  
  (setq p4 (polar p3 dir2 0.10))
  (setq p5 (polar p3 dir2 -0.10))

  (setq p6 (polar p2 dir 0.05))
  (setq p7 (polar p6 dir2 0.06))
  (setq p8 (polar p6 dir2 -0.06))

  (crl "021" 1)
  (setvar "clayer" "021")
  (command "_line" "_non" p7 "_non" p8 "")
  (command "_extend" "l" "" "f" "_non" p4 "_non" p5 "" "")
  (command "_trim" "f" "_non" p4 "_non" p5 "" "" "f" "_non" p1 "_non" p2 "" "")
  (princ)
)

(defun c:terca ()
  (command "._insert" "terca" pause 1 1 pause)
  (princ)
)


(defun c:BaldramesEstacas (/)
  (command "._insert" "BaldramesEstacas" pause 1 1 0 "._explode" "l")
  (princ)
  )

(defun c:NomeComodo (/)
  (setq p1 (getpoint "\n Selecione o ponto de inserção do Texto"))
  
  (command "._insert" "NomeComodo" p1 1 1 0 "._explode" "l")

  (command "_textedit" "l" "")
  
  
  (princ)
)


(defun c:NomeDesenho (/)
  (command "._insert" "NomeDesenho" pause 1 1 0 "Escala 1:71" "Planta Baixa1" "._burst" "l")
  (princ)
)




;PORTAS E JANELAS........................................................................
(princ)
(defun c:JH (/)
  (command ".insert" "JH" pause pause pause pause)
  )
(princ)
(defun c:JV (/)
  (command ".insert" "JV" pause pause pause pause)
  )
(princ)

(defun c:PCOR (/)
  (command ".insert" "PCOR" pause pause pause pause)
  )
(princ)
(defun c:PCOR2 (/)
  (command ".insert" "PCOR2" pause pause pause pause)
  )
(princ)
(defun c:PCOM (/)
  (command ".insert" "PCOM" pause pause pause pause)
  )
(princ)

;BANHEIRO ................................................................................
(defun c:PIA (/)
  (command ".insert" "PIA" pause 1 1 pause)
  )
(princ)
(defun c:PIA2 (/)
  (command ".insert" "PIA2" pause 1 1 pause)
  )
(princ)
(defun c:VASO (/)
  (command ".insert" "VASO" pause 1 1 pause)
  )
(princ)

;COZINHA..................................................................................
(defun c:CUBA_PIA (/)
  (command ".insert" "CUBA_PIA" pause 1 1 pause)
  )
(princ)
(defun c:FOGAO_4B (/)
  (command ".insert" "FOGAO_4B" pause 1 1 pause)
  )
(princ)
(defun c:FOGAO_6B (/)
  (command ".insert" "FOGAO_6B" pause 1 1 pause)
  )
(princ)
(defun c:GELADEIRA (/)
  (command ".insert" "GELADEIRA" pause 1 1 pause)
  (princ)
 )

(defun c:Tanque (/)
  (command ".insert" "Tanque" pause 1 1 pause)
  (princ)
)

;ESTRUTUAL
(defun c:Estaca (/)
  (command ".insert" "Estaca" pause 1 1 pause)
  )
(princ)
(defun c:Trilho (/)
  (command ".insert" "Trilho" pause 1 1 pause)
  )
(princ)


;HIDRAULICO
(defun c:CI (/)
  (command ".insert" "CI" pause pause pause pause)
  )
(princ)
(defun c:CS75 (/)
  (command ".insert" "CS75" pause pause pause pause)
  )
(princ)
(defun c:CS50 (/)
  (command ".insert" "CS50" pause pause pause pause)
  )
(princ)
(defun c:CP (/)
  (command ".insert" "CP" pause pause pause pause)
  )
(princ)
(defun c:015 (/)
  (command ".insert" "015" pause pause pause pause)
  )
(princ)
(defun c:022 (/)
  (command ".insert" "022" pause pause pause pause)
  )
(princ)
(defun c:025 (/)
  (command ".insert" "025" pause pause pause pause)
  )
(princ)
(defun c:040(/)
  (command ".insert" "040" pause pause pause pause)
  )
(princ)
(defun c:050 (/)
  (command ".insert" "050" pause pause pause pause)
  )
(princ)
(defun c:075 (/)
  (command ".insert" "075" pause pause pause pause)
  )
(princ)
(defun c:0100 (/)
  (command ".insert" "0100" pause pause pause pause)
  )
(princ)
(defun c:RG (/)
  (command ".insert" "RG" pause pause pause pause)
  )
(princ)

(princ)
  (defun c:C45100 (/)
    (command ".insert" "C45100" pause pause pause pause)
  )
(princ)



;VEGETAÇÃO..........................................................................
(defun c:ARBUSTO (/)
  (command ".insert" "ARBUSTO" pause pause pause pause)
  )
(princ)
(defun c:ARVORE1 (/)
  (command ".insert" "ARVORE1" pause pause pause pause)
  )
(princ)
(defun c:ARVORE2 (/)
  (command ".insert" "ARVORE2" pause 1 1 0)
  )
(princ)
(defun c:ARVORE3 (/)
  (command ".insert" "ARVORE3" pause 1 1 0)
  )
(princ)
(defun c:FLOR1 (/)
  (command ".insert" "FLOR1" pause 1 1 0)
  )
(princ)
(defun c:FLOR2 (/)
  (command ".insert" "FLOR2" pause 1 1 0)
  )
(princ)
(defun c:COQUEIRO (/)
  (command ".insert" "COQUEIRO" pause 1 1 0)
  )
(princ)
(defun c:VEGET1 (/)
  (command ".insert" "VEGET1" pause 1 1 0)
  )
(princ)
(defun c:VEGET2 (/)
  (command ".insert" "VEGET2" pause pause pause pause)
  )
(princ)
(defun c:VEGET3 (/)
  (command ".insert" "VEGET3" pause pause pause pause)
  )
(princ)
(defun c:VEGET4 (/)
  (command ".insert" "VEGET4" pause pause pause pause)
  )
(princ)
(defun c:VEGET5 (/)
  (command ".insert" "VEGET5" pause pause pause pause)
  )
(princ)
(defun c:VEGET6 (/)
  (command ".insert" "VEGET6" pause pause pause pause)
  )
(princ)
(defun c:VEGET7 (/)
  (command ".insert" "VEGET7" pause pause pause pause)
  )
(princ)
(defun c:VEGET8 (/)
  (command ".insert" "VEGET8" pause pause pause pause)
  )
(princ)
(defun c:VEGET9 (/)
  (command ".insert" "VEGET9" pause pause pause pause)
  )
(princ)
(defun c:VEGET10 (/)
  (command ".insert" "VEGET10" pause pause pause pause)
  )
(princ)
(defun c:VEGET11 (/)
  (command ".insert" "VEGET11" pause pause pause pause)
  )
(princ)
(defun c:VEGET12 (/)
  (command ".insert" "VEGET12" pause pause pause pause)
  )
(princ)
(defun c:VEGET13 (/)
  (command ".insert" "VEGET13" pause pause pause pause)
  )
(princ)
(defun c:VEGET14 (/)
  (command ".insert" "VEGET14" pause pause pause pause)
  )
(princ)

;VEICULOS
(defun c:TEMPRA_C (/)
  (command ".insert" "TEMPRA_C" pause pause pause pause)
  )
(princ)
(defun c:TEMPRA_L (/)
  (command ".insert" "TEMPRA_L" pause pause pause pause)
  )
(princ)
(defun c:TEMPRA_F (/)
  (command ".insert" "TEMPRA_F" pause pause pause pause)
  )
(princ)

(defun c:TIPO_C (/)
  (command ".insert" "TIPO_C" pause pause pause pause)
  )
(princ)
(defun c:TIPO_L (/)
  (command ".insert" "TIPO_L" pause pause pause pause)
  )
(princ)
(defun c:ASTRA_C (/)
  (command ".insert" "ASTRA_C" pause pause pause pause)
  )
(princ)
(defun c:ASTRA_L (/)
  (command ".insert" "ASTRA_L" pause pause pause pause)
  )
(princ)
(defun c:ASTRA_F (/)
  (command ".insert" "ASTRA_F" pause pause pause pause)
  )
(princ)

(defun c:MERCEDES_C (/)
  (command ".insert" "MERCEDES_C" pause pause pause pause)
  )
(princ)

(defun c:MERCEDES_F (/)
  (command ".insert" "MERCEDES_F" pause pause pause pause)
  )
(princ)
(defun c:MERCEDES_L (/)
  (command ".insert" "MERCEDES_L" pause pause pause pause)
  )
(princ)

(defun c:FUSCA_C (/)
  (command ".insert" "FUSCA_C" pause pause pause pause)
  )
(princ)
(defun c:FUSCA_F (/)
  (command ".insert" "FUSCA_F" pause pause pause pause)
  )
(princ)
(defun c:FUSCA_L (/)
  (command ".insert" "FUSCA_L" pause pause pause pause)
  )
(princ)

(defun c:CIRCULAR_C (/)
  (command ".insert" "CIRCULAR_C" pause pause pause pause)
  )
(princ)
(defun c:CIRCULAR_F (/)
  (command ".insert" "CIRCULAR_F" pause pause pause pause)
  )
(princ)
(defun c:CIRCULAR_L (/)
  (command ".insert" "CIRCULAR_L" pause pause pause pause)
  )
(princ)

;Layers para eletrica
(defun c:L_ELETRICO ()
(if (not (tblsearch "layer" "CIRC 01" ""))
  (command "layer" "new"  "CIRC 01" "c" "10"  "CIRC 01" "")
  )
  (if (not (tblsearch "layer" "CIRC 02" ""))
  (command "layer" "new"  "CIRC 02" "c" "154"  "CIRC 02" "")
  )
  (if (not (tblsearch "layer" "CIRC 03" ""))
  (command "layer" "new"  "CIRC 03" "c" "90"  "CIRC 03" "")
  )
  (if (not (tblsearch "layer" "CIRC 04" ""))
  (command "layer" "new"  "CIRC 04" "c" "210"  "CIRC 04" "")
  )
  (if (not (tblsearch "layer" "CIRC 05" ""))
  (command "layer" "new"  "CIRC 05" "c" "230"  "CIRC 05" "")
  )
  (if (not (tblsearch "layer" "CIRC 06" ""))
  (command "layer" "new"  "CIRC 06" "c" "30"  "CIRC 06" "")
  )
  (if (not (tblsearch "layer" "CIRC 07" ""))
  (command "layer" "new"  "CIRC 07" "c" "42"  "CIRC 07" "")
  )
  (if (not (tblsearch "layer" "CIRC 08" ""))
  (command "layer" "new"  "CIRC 08" "c" "33"  "CIRC 08" "")
  )
  (if (not (tblsearch "layer" "CIRC 09" ""))
  (command "layer" "new"  "CIRC 09" "c" "41"  "CIRC 09" "")
  )
  (if (not (tblsearch "layer" "CIRC 10" ""))
  (command "layer" "new"  "CIRC 10" "c" "110"  "CIRC 10" "")
  )
  (princ)
)

(defun c:l_arquitetonico ()
  (if (not (tblsearch "layer" "05" ""))
    (command "layer" "new"  "05" "c" "5"  "05" "")
	(setvar "clayer" "05")
  )
  (if (not (tblsearch "layer" "015" ""))
    (command "layer" "new"  "015" "c" "6"  "015" "")
  )
  (if (not (tblsearch "layer" "021" ""))
    (command "layer" "new"  "021" "c" "1"  "021" "")
  )
  (if (not (tblsearch "layer" "025" ""))
    (command "layer" "new"  "025" "c" "2"  "025" "")
  )
  (if (not (tblsearch "layer" "07" ""))
    (command "layer" "new"  "07" "c" "7"  "07" "")
  )
  (if (not (tblsearch "layer" "Telha" ""))
    (command "layer" "new"  "Telha" "c" "30"  "Telha" "")
  )
  (princ)
)


;Comando para pegar distancias acumuladas por pontos
(defun c:diac (/ p0 p1 p2 dist)
  (initget 1)
  (setq p1 (getpoint "\nPrimeiro ponto : "))
  (setq p2 (getpoint p1 "\nProximo ponto : "))
  (setq dist 0.0 p0 p2)
  (while p0
    (setq dist (+ (distance p1 p2) dist))
    (princ (strcat "\nDistancia acumulada : " (rtos dist 2)))
    (setq p1 p2)
    (setq p2 (getpoint p1 "\nPróximo ponto ou <Enter> para finalizar :" ))
    (setq p0 p2)
  )
  (princ (strcat "\nDistancia total acumulada =  " (rtos dist 2)))
  (alert (strcat "\nDistancia total acumulada =  " (rtos dist 2)))
  (princ)
)


;ROTINA PARA INSERSÃO DE CARIMBOS
(defun c:CAR (/)
  (initget "1, 2, 3, 4, 5")
  (setq Bloco (getkword "\nCarimbo?: <[1]A4, [2]A3, [3]Arquitetônico, [4]Complementar, [5]Subdivisão> :"))

  (cond
    ((= bloco "1") (command ".insert" "A4" pause pause pause pause))
    
    ((= bloco "2") (command ".insert" "A3" pause pause pause pause))
    
    ((= bloco "3") (command ".insert" "ARQUITET" pause pause pause pause))
    
    ((= bloco "4") (command ".insert" "COMPLE" pause pause pause pause))
    
    ((= bloco "5") (command ".insert" "SUBDIVISAO" pause pause pause pause))
    )
 (princ)
)

;#################################################################
;CODIGO PARA INSERSÃO DAS SETAS INDIVIDUAIS
(defun c:SETA (/)
  (command ".insert" "SETA" pause pause pause pause)
  (princ)
)

(defun c:CORTE (/)
  (command ".insert" "CORTE" pause pause pause pause)
  (princ)
)

(defun c:NORTE (/)
  (command ".insert" "NORTE" pause pause pause pause)
  (princ)  
)

(defun c:SETCOB (/)
  (command ".insert" "SETCOB" pause pause pause pause)
  (princ)
)


(defun c:JCELO (/)
  (command ".insert" "JCELO" pause pause pause pause)
  (princ)  
)


(DEFUN C:AREAALQ ()
(setq SELOBJETO (entsel)) (if (NULL selOBJETO) (while (NULL SELOBJETO)(princ "\nObjeto Não Encontrado: ") 
(setq SELOBJETO (entsel))))(command "area" "object" SELOBJETO) 
(setq pt1 (getpoint "\nPosisão do Texto?: "))
(setq Tmtexto (getreal "\nTamanho do texto?: [1.000]"))
(if (= tmtexto nil) (setq tmtexto 1))
(setq Areas (getvar "area"))
(setq Alque (/ areas 24200))
(setq Alque (strcat (rtos alque 2 3) " Alq. PTA"))
(command "text" "m" pt1 tmtexto "0" alque )
)

(DEFUN C:AreaM ()
(setq SELOBJETO (entsel)) (if (NULL selOBJETO) (while (NULL SELOBJETO)(princ "\nObjeto Não Encontrado: ") 
(setq SELOBJETO (entsel))))(command "area" "object" SELOBJETO) 
(setq pt1 (getpoint "\nPosisão do Texto?: "))
(setq Tmtexto (getreal "\nTamanho do texto?: [1.000]"))
(if (= tmtexto nil) (setq tmtexto 1))
(setq Areas (getvar "area"))
(setq Metros (strcat (rtos areas 2 2) " m²"))
(command "text" "m" pt1 tmtexto "0" metros )
)

(DEFUN C:AreaHec ()
(setq SELOBJETO (entsel)) (if (NULL selOBJETO) (while (NULL SELOBJETO)(princ "\nObjeto Não Encontrado: ") 
(setq SELOBJETO (entsel))))(command "area" "object" SELOBJETO) 
(setq pt1 (getpoint "\nPosisão do Texto?: "))
(setq Tmtexto (getreal "\nTamanho do texto?: [1.000]"))
(if (= tmtexto nil) (setq tmtexto 1))
(setq Areas (getvar "area"))
(setq Alque (/ areas 10000))
(setq Alque (strcat (rtos alque 2 3) " Hectares"))
(command "text" "m" pt1 tmtexto "0" alque )
)

(defun c:areat (/ tx1 ed)
  
(setq tx1 (car (entsel "\nSelecione o texto: ")))

(setq ed (entget tx1)) 
(setq ed (subst (cons 1 "teste") (assoc 1 ed) ed)) 
  
(princ)
)

(Defun c:rect()
; LEITURA
; vai ler os valores de definição
(setq b (getreal "\nLargura : "))
(setq h (getreal "\nAltura : "))
(setq pt1 (getpoint "\nCanto Inferior Esquerdo : "))
; CÁLCULOS
; vai calcular os outros pontos necessários
(setq pt2 (list (+ (car pt1) b) (cadr pt1)))
(setq pt3 (list (car pt2) (+ (cadr pt1) h)))
(setq pt4 (list (car pt1) (cadr pt3)))
; DESENHO
; Vai desenhar através do comando LINE e opção final Close
(command "line" pt1 pt2 pt3 pt4 "c")
)

(defun c:areacota()
  ;Pega a primeira cota
  (setq cota1 (cdr (assoc 42 (entget (car (entsel "\nSelecione a Primeira cota"))))))
  ;Pega a segunda cota
  (setq cota2 (cdr (assoc 42 (entget (car (entsel "\nSelecione a Segunda cota"))))))
  ;Calcula a area
  (setq total (* cota1 cota2))
  (if (setq ss (ssget "_:L" '((0 . "TEXT,MTEXT"))))
    (setq sset (sname ss 0))
  )
)


; comando calcular area
(defun c:areas () (pk2_main))

;Comando main de areas
(defun pk2_main()
  (initget 128)
  
  (setq p1 (getpoint "\nSeleciona um Objeto / criar Polyline / selecionar Cotas/<selecionar ponto Interno :"))
  
  (cond
    ((= 'LIST (type p1)) (pega_ponto))
    ((= 'STR (type p1))
     (cond
       ((= (strcase p1) "C") (duas_cotas))
       ((= (strcase p1) "O") (seleciona_poly))
       ((= (strcase p1) "P") (criap))
       
       (t (prompt "\nEntrada Inválida!"))
       
     )
    (t (prompt "\nEntrada Inválida!"))
  )
 )
)

;calcula atravez de duas cotas no desenho
(defun duas_cotas ()
  (guarda_status)
  (setq cota1 (cdr (assoc 42 (entget (car (entsel "\nSelecione a Primeira cota"))))))
  (setq cota2 (cdr (assoc 42 (entget (car (entsel "\nSelecione a Segunda cota"))))))
  (setq total (* cota1 cota2))

  (setq area_calculada (strcat (rtos total 2 2) " m²"))
  
  (altera_texto)

  
  (devolve_status)
  (princ)
)

;pega um ponto no desenho para calcular uma area apartir de um boundary
(defun pega_ponto()
  (guarda_status)
  (crl "025" 2) 
  (setvar "clayer" "025")
  (setvar "osmode" 0)
  (command "_boundary" p1 "")
  (command "_area" "o" "l")
  (setq resp "Não")

  (initget 1 "Sim Não Yes No")
  (setq resp (getkword "Confirma a área? (S/N): "))
  (while
    (or (= resp "Não") (= resp "No"))
    (command "_erase" "l" "")
    (pk2_main)
    (princ)
  )
  (command "_erase" "l" "")
  (setq a (getvar "area"))

  (setq area_calculada (strcat (rtos a 2 2) " m²"))
  
  (altera_texto)
  (devolve_status)
  (princ)
  
)

;seleciona uma polyline
(defun seleciona_poly ()
  (guarda_status)
  (crl "025" 2) 
  (setvar "clayer" "025")
  (setvar "osmode" 0)
  (setq SELOBJETO (entsel)) (if (NULL selOBJETO) (while (NULL SELOBJETO)(princ "\nObjeto Não Encontrado: ") 
  (setq SELOBJETO (entsel))))(command "area" "o" SELOBJETO) 
  (setq a (getvar "area"))

  (setq area_calculada (strcat (rtos a 2 2) " m²"))
  
  (altera_texto)
  (devolve_status)
  (princ)
  
)

;salva o status
(defun guarda_status ()
  (setq ley_no (getvar "clayer"))
  (setq att_no (getvar "attdia"))
  (setq osn_no (getvar "osmode"))
  (princ)
)

;Devolve o status
(defun devolve_status ()
  (setvar "clayer" ley_no)
  (setvar "attdia" att_no)
  (setvar "osmode" osn_no)
  (princ)
)


;cria layers no desenho
(defun crl (lnome cor)
  (entmake (list
	     (cons 0 "layer")
	     (cons 100 "AcDbSymbolTableRecord")
	     (cons 100 "AcDbLayerTableRecord")
	     (cons 2 lnome)
	     (cons 70 0)
	     (cons 62 cor)
	     (cons 6 "Continuous")
	   )
   )
)

;Colocar pontos no desenho atravez e um arquivo de pontos
(defun c:pto ()
  (setq arq_dados (getfiled "Selecione o arquivo de Dados" (getvar "dwgprefix") "txt" 16))
  (setq open_file (open arq_dados "r"))
  (while (/= nil (setq ponto_atual (read-line open_file)))
    (command "_point" ponto_atual)
  )  
)


(defun txtTela (titulo / )
  (setq dcl_id (load_dialog (strcat path "Janelas.dcl")))
  (if (not (new_dialog "texto_tela" dcl_id)) (exit))

  (if (= nil texto) (setq texto "QUARTO"))
    
  (set_tile "txtTitulo" titulo)
  (set_tile "txtTexto" texto)
  (action_tile "txtTexto" "(setq texto $value)")
  (mode_tile "txtTexto" 2)
   

  ;ok e cancel
  (action_tile "accept" "(done_dialog 1)")
  (action_tile "cancel" "(done_dialog 0)")

  
  ;Finalizacao
  (setq ValorJanela (start_dialog))
  (unload_dialog dcl_id)

  (if (= valorJanela 0) (setq texto nil))
  (princ)
  
)


(defun C:ndesenho ()

  
  (txtTela "Nome de Desenho")

  (if (= valorJanela 0) (exit))

  (crl "Textos" 7)
  (guarda_status)

  (setvar "clayer" "Textos")

  (setq p1 (getpoint "\n Selecione o ponto para inserção do texto:"))
  
  (setq escala 1.5)
  
  (setq p2 (polar p1 (/ pi 2) (* 0.15 escala)))
  (setq p3 (polar p1 (/ pi 2) (* -0.15 escala)))
  
  (command "._text"  "J" "l" "_non" p2 (* 0.15 escala) 0 (strcase texto))
  (command "._text" "J" "l" "_non" p1 (* 0.10 escala) 0 "Escala 1:75")
 
  (devolve_status)
  (princ)
)


(defun NomeAmbiente ()

  
  (txtTela "Nome de Ambiente")

  (if (= valorJanela 0) (exit))

  (crl "Nome_Ambientes" 7)
  (guarda_status)

  (setvar "clayer" "Nome_Ambientes")

  (setq p1 (getpoint "\n Selecione o ponto para inserção do texto:"))
  (setq escala (getreal "\n Informe a escala <1> "))
  (if (= nil escala) (setq escala 1))
  
  (setq p2 (polar p1 (/ pi 2) (* 0.15 escala)))
  (setq p3 (polar p1 (/ pi 2) (* -0.15 escala)))
  
  (command "._text"  "J" "c" "_non" p2 (* 0.15 escala) 0 (strcase texto))
  (command "._text" "J" "c" "_non" p1 (* 0.10 escala) 0 "P. Cer.")
 
  (setq novaarea (getvar "area"))
  
  (command "._text" "J" "c" "_non" p3 (* 0.10 escala) 0 (strcat (rtos novaarea 2 2) " m²"))

  (devolve_status)
  (princ)
)


;alterar o texto selecionado
(defun altera_texto ()
  (setq elist (entget (car (entsel "\n Selecione o texto para alterar"))))
  (entmod (setq elist (subst (cons 1 area_calculada) (assoc 1 elist) elist)))
  (princ)
)


;Cria polylines apartir de uma lista de pontos
(defun cria_poly (vertices closed)
  (entmake
    (append
      (list '(0 . "LWPOLYLINE")
	    '(100 . "AcDbEntity")
	    '(100 . "AcDbPolyline")
	    (cons 90 (length vertices))
	    (cons 70 (if closed 1 0)))
      (mapcar '(lambda (x)(cons 10 x)) vertices)
    )
  )
)

;Cria polyline para calcular areas
(defun criap ()
  (setq lista (list (setq ponto1 (getpoint "\n Selecione ponto inicial: "))))  
  (guarda_status)
  (crl "025" 2)
  (setvar "clayer" "025")
  (criap2)
  (devolve_status)	  
  (princ)
)

;Comando maiin de calcular areas atravez de polyline
(defun criap2()
  (initget 128)
  (setq ponto1 (getpoint "\n C para terminar ou /<selecionar proximo ponto :"))
  
  (cond
    ((= 'LIST (type ponto1))
       (setq lista (append lista (list ponto1)))

       (if (< 2 (length lista))
	 (command "_erase" "l" "")
       )
      
       (cria_poly lista nil)
       (criap2)
     )
    ((= 'STR (type ponto1))
      (command "_erase" "l" "")
      (cria_poly lista t)
      (command "._area" "o" "l")
      (setq a (getvar "area"))
      (setq area_calculada (strcat (rtos a 2 2) " m²"))
      (altera_texto)
      (command "_erase" "l" "")
      (princ)
    )

    ((= nil ponto1)
      (command "_erase" "l" "")
      (cria_poly lista t)
      (command "._area" "o" "l")
      (setq a (getvar "area"))
      (setq area_calculada (strcat (rtos a 2 2) " m²"))
      (altera_texto)
      (command "_erase" "l" "")
      (princ)
    )
    
  )
)

;OSNAP
;;;Fron help:
;;;Sets running object snaps.
;;;Type: Bitcode
;;;Saved in: Registry
;;;Initial value: 4133

;;;The setting is stored as a bitcode using the sum of the following values:
;;;0 NONe
;;;1 ENDpoint
;;;2 MIDpoint
;;;4 CENter
;;;8 NODe
;;;16 QUAdrant
;;;32 INTersection
;;;64 INSertion
;;;128 PERpendicular
;;;256 TANgent
;;;512 NEArest
;;;1024 Geometric CEnter
;;;2048 APParent Intersection
;;;4096 EXTension
;;;8192 PARallel
;;;16384 Suppresses the current running object snaps


(defun c:boxbanheiro ()

  (guarda_status)
  (setvar "osmode" 1)
  (setq p1 (getpoint "\nSelecione um dos cantos do banheiro: "))
  (setvar "osmode" 512)
  (setq p2 (getpoint p1 "\nSelecione a direção do box: "))
  (setvar "osmode" 128)
  (setq p3 (getpoint p2 "\Selecione a parede oposta ao box: "))
  (devolve_status)  
  (setq distancia (getreal "\nDistancia do box da parede : <0.90> :"))
  (if (= nil distancia) (setq distancia 0.90))  
  (setq dir (angle p1 p2))
  (setq dir2 (angle p2 p3))
  (setq p4 (polar p1 dir distancia))
  (setq tamanho (distance p2 p3))
  (setq p5 (polar p4 dir2 (/ tamanho 2)))
  (setq p6 (polar p5 dir 0.10))
  (command "_.insert" "BoxBanheiro" "_non" p5 1 tamanho "_non" p6)

  (initget 128)
  (setq inverter (getkword "\n Inverter o bloco? <Yes> <No> <Enter Não> ) "))

  (if (= (strcase inverter) "Y") (command "_mirror" "l" "" "non" p4 "_non" p5 "y"))    
  
  (print "Box inserido com sucesso!")
  (princ)
)

;Cria janela parametrizada
(defun c:janela ()
  (guarda_status)
  (command "_undo" "_begin")
  (setvar "osmode" 567)
  (setq p1 (getpoint "\n Selecione o centro da parede Interna: "))
  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))


  ;verifica se o arquivo existe
  (setq arquivo (findfile (strcat path "Dados/janelas.txt")))

  ;se nao existe ele cria com dados padrao
  (if (= nil arquivo)
   (cria_arquivo_padrao_janelas)
  )

  ;abre o arquivo para pegar os dados
  (setq open_file (open (strcat path "Dados/janelas.txt") "r")
	largjanelaconfig (read-line open_file)
	AlturaJanelaConfig (read-line open_file)
  )
  (close open_file)

  (if (= nil largjanelaconfig) (setq largjanelaconfig "1.50"))
    
  (setq largjanela (getreal (strcat "\nLargura da janela : <" largjanelaconfig ">: ")))
  (if (= nil largjanela) (setq largjanela (distof largjanelaconfig)))

  (setq altjanela (getreal (strcat "\nAltura da janela : <" AlturaJanelaConfig ">: ")))
  (if (= nil altjanela) (setq altjanela (distof AlturaJanelaConfig)))
  

   ;salva as informações no arquivo de configurações
  (setq open_file (open (strcat path "Dados/janelas.txt") "w"))
  (write-line (rtos largjanela 2 2) open_file)
  (write-line (rtos altjanela 2 2) open_file)
  (close open_file)
  

  
  (setq espessura (distance p1 p2))
  (setq dir (angle p1 p2))
  (setq p3 (polar p1 dir espessura))
  (setq p4 (polar p3 dir 0.13))
  (setq p9 (polar p1 dir -0.01))


  (crl "05" 5)
  (setvar "clayer" "05")
  (command "._line" "_non" p1 "_non" p3 "")
  (command "._offset" (/ largjanela 2) (entlast) "@0,1" "")
  (command "._offset" largjanela (entlast) "_non" p1 "")
  (command "._trim" "" "f" "_non" p9 "_non" p4 "" "")
  (command "._erase" "f" "_non" p9 "_non" p3 "" "")
  (setq angulo (- (* dir (/ 180 pi)) 90))
  (setq angulo2 angulo)
  (if (and (> angulo 90) (< angulo 270))
    (setq angulo2 (+ angulo 180))
  )
  (if (= angulo -90.0)
    (setq angulo2 90)
  )

  (command "_attdia" "0")
  (command "._insert" "janela" "_non" p1 largjanela espessura angulo (rtos largjanela 2 2) "1.20" "JANELA DE BLINDEX")
  (command "_.insert" "CotaJanela" "_non" p4 "1" "1" angulo2 (strcat (rtos largjanela 2 2) " x " (rtos altjanela 2 2)))
  (command "_attdia" "1")
  (devolve_status)
  (prompt "\n Janela inserida com sucesso!")
  
  (command "_undo" "_end")
  
  (princ)
)

(defun cria_arquivo_padrao_janelas ()
   (setq open_file (open (strcat path "Dados/janelas.txt") "w"))
   (write-line "1.50" open_file)
   (write-line "1.20" open_file)
   (close open_file)
)


(defun c:pt (/)

  (command "_undo" "_begin")
  (setq rp1 nil
        rp2 nil
	rp3 nil
	p1 nil
	p2 nil
	p3 nil
	dir1 nil
	dir2 nil
	pbloco nil
	parc1 nil
	parc2 nil
	parc3 nil
	pescala1 nil
	pescala2 nil
	pcortar1 nil
	pcortar2 nil
	pcoartar3 nil
	pcoartar4 nil
	tipo_porta_config nil
	boneca_config nil
	larg_porta_config nil
	alt_porta_config nil
	cota_porta_config nil
	arco_porta_config nil
  	layer_parede nil
  	layer_arco nil
  	cor_parede nil
  	cor_arco nil
	codificador_porta nil	
  )

  ;verifica se o arquivo existe
  (setq arquivo (findfile (strcat path "Dados/portas.txt")))

  ;se nao existe ele cria com dados padrao
  (if (= nil arquivo)
   (cfpt)
  )

  ;abre o arquivo para pegar os dados
  (setq open_file (open (strcat path "Dados/portas.txt") "r")
          tipo_porta_config (read-line open_file)
	  boneca_config (read-line open_file)
	  larg_porta_config (read-line open_file)
	  alt_porta_config (read-line open_file)
	  cota_porta_config (read-line open_file)
	  arco_porta_config (read-line open_file)
	  codificar_porta (read-line open_file)
  	  layer_parede (read-line open_file)
  	  layer_arco (read-line open_file)
  	  cor_parede (read-line open_file)
  	  cor_arco (read-line open_file)
  )



  
  (close open_file)

  (if (= nil larg_porta_config) (setq larg_porta_config "0.80"))
  (if (= nil boneca_config) (setq boneca_config "0.10"))
  (if (= nil alt_porta_config) (setq alt_porta_config "2.10"))
  (if (= nil tipo_porta_config) (setq tipo_porta_config "Porta Interna de Madeira"))
  (if (= nil cota_porta_config) (setq tipo_porta_config "1"))
  (if (= nil arco_porta_config) (setq tipo_porta_config "1"))
  (if (= nil codificar_porta) (setq codificar_porta "1"))
  (if (= nil layer_parede) (setq layer_parede "05"))
  (if (= nil layer_arco) (setq layer_arco "021"))
  (if (= nil cor_parede) (setq cor_parede "5"))
  (if (= nil cor_arco) (setq cor_arco "1"))
   
  
  (guarda_status)

  (setvar "osmode" 567)  
  (setq rp1 (getpoint "\n Selecione o canto interno da parede: "))
  (setvar "osmode" 512)
  (setq rp2 (getpoint rp1 "\n Selecione a parede do vão da porta: "))
  (setq dir1 (angle rp1 rp2))
  (setvar "osmode" 128)
  (setq rp3 (getpoint rp2 "\n Selecione o outro lado da parede (espessura): "))

  
  (setq largporta (getreal (strcat "\nTamanho da porta : <" larg_porta_config ">: ")))
  (if (= nil largporta) (setq largporta (distof larg_porta_config)))

  ;salva as informações no arquivo de configurações
  (setq open_file (open (strcat path "Dados/portas.txt") "w"))
  (write-line tipo_porta_config open_file)
  (write-line boneca_config open_file)
  (write-line (rtos largporta 2 2) open_file)
  (write-line alt_porta_config open_file)
  (write-line cota_porta_config open_file)
  (write-line arco_porta_config open_file)
  (write-line codificar_porta open_file)
  (write-line layer_parede open_file)
  (write-line layer_arco open_file)
  (write-line cor_parede open_file)
  (write-line cor_arco open_file)
  
  (close open_file)
  
  (setq espessura (distance rp2 rp3))
  (setq dir2 (angle rp2 rp3))
  (setq p1 (polar rp1 dir1 (distof boneca_config)))
  (setq p2 (polar p1 dir2 espessura))
  (setq pbloco (polar p1 dir1 0.015))
  (setq pcortar1 (polar p1 dir1 (/ largporta 2.01)))
  (setq pcortar2 (polar pcortar1 dir2 espessura))
  (setq pcortar3 (polar pcortar1 dir2 -0.15))
  (setq pcortar4 (polar pcortar2 dir2 0.10))
  (setq pescala2 (polar pbloco dir2 (* largporta -1)))
  (setq parc1 (polar p1 dir1 (* largporta 0.70)))
  (setq parc2 (polar parc1 dir2 (* (* largporta 0.70) -1)))
  (setq parc3 (polar p1 dir1 largporta))

  ;Desenha 

  (crl layer_arco (atoi cor_arco))

  (if (= arco_porta_config "1")
  (command "clayer" layer_arco "_arc" "_non" parc3 "_non" parc2 "_non" pescala2)
  )

  (crl layer_parede (atoi cor_parede))
  (setvar "clayer" layer_parede)
  (command "_line" "_non" p1 "_non" p2 "")
  (command "._offset" largporta (entlast) "_non" rp2 "")
  (command "._trim" "" "f" "_non" pcortar3 "_non" pcortar4 "" "")
  (command "._insert" "porta1" "_non" pbloco largporta 1 "_non" pescala2)

  (if (= cota_porta_config "1")
      (command "_attdia" "0" "_.insert" "CotaPorta" "_non" pcortar3 "1" "1" 0 (rtos largporta 2 2) alt_porta_config tipo_porta_config "_attdia" "1")
  )  

  (devolve_status)
  (prompt "\n Porta inserida com sucesso!")
  
  (command "_undo" "_end")
  
  (princ)

  
)



;Colocar coeficientes no desenho
(defun c:coefi()
  ;dados do terreno
  (setq a_terreno (getreal "\n Area do Terreno < " ))
  (setq a_construcao (getreal "\n Area Construção <"))
  
  (setq a (/ a_construcao a_terreno))
  (setq b (* a 100))
  (setq c (- 100 b))


  ;Coeficiente
  (setq a (rtos a 2 5))  
  (setq a (substr a 1 6))      
  (setq a (strcat a "%"))
  (setq elist (entget (car (entsel "\n Selecione o texto para alterar Coeficiente :"))))
  (entmod (setq elist (subst (cons 1 a) (assoc 1 elist) elist)))


  ;taxa ocupação
  (setq b (rtos b 2 5))  
  (setq b (substr b 1 5))      
  (setq b (strcat b "%"))
  (setq elist (entget (car (entsel "\n Selecione o texto para alterar Taxa Ocupação :"))))
  (entmod (setq elist (subst (cons 1 b) (assoc 1 elist) elist)))


  ;taxa impermeabilidade
  (setq c (rtos c 2 2))  
  (setq c (substr c 1 5))      
  (setq c (strcat c "%"))
  (setq elist (entget (car (entsel "\n Selecione o texto para alterar taxa Permeabilidade :"))))
  (entmod (setq elist (subst (cons 1 c) (assoc 1 elist) elist)))
 
)


;Cria porta correr
(defun c:pcorrer ()

  (setq p1 nil
	p2 nil
	p3 nil
	p4 nil
	p5 nil
	p6 nil
	dir nil
	dir2 nil
	espessura nil
	larg nil)
	

  (guarda_status)

  (command "_undo" "_begin")	
  
  
  (setvar "osmode" 567)
  (setq p1 (getpoint "\n Selecione o centro da parede Interna: "))
  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))
  (devolve_status)  
  (setq larg (getreal (strcat "\nLargura da janela : <2.00>: ")))
  (if (= nil larg) (setq larg 2.00))

  
  (setq espessura (distance p1 p2))
  (setq dir (angle p1 p2))
  (setq p3 (polar p1 dir espessura))
  (setq p4 (polar p3 dir 0.13))
  (setq p9 (polar p1 dir -0.10))
  (setq p5 (polar p2 (- dir (/ pi 2)) (/ larg 2)))
  (setq dir2 (angle p5 p2))
  (setq p6 (polar p5 dir2 larg))

  (setq p7 (polar p5 dir (* (/ espessura 2) -1)))
  (setq p8 (polar p7 dir2 larg))
  
  (crl "05" 5)
  (setvar "clayer" "05")
  (command "._line" "_non" p1 "_non" p3 "")
  (command "._offset" (/ larg 2) (entlast) "@0,1" "")
  (command "._offset" larg (entlast) "_non" p1 "")
  (command "._trim" "" "f" "_non" p9 "_non" p4 "" "")
  (command "._erase" "f" "_non" p9 "_non" p3 "" "")

  ;Inserir linha externa na porta
  (crl "021" 1)
  (setvar "clayer" "021")
  (command "._line" "_non" p5 "_non" p6 "")


  ;ajustar angulo do texto para ele nao ficar de cabeça para baixo
  (setq angulo (- (* dir (/ 180 pi)) 90))
  (setq angulo2 angulo)
  (if (and (> angulo 90) (< angulo 270))
    (setq angulo2 (+ angulo 180))
  )
  (if (= angulo -90.0)
    (setq angulo2 90)
  )
  (command "._insert" "PCorrer" "_non" p7 larg 1 "_non" p8)
  (command "_attdia" "0")
  (command "_.insert" "CotaJanela" "_non" p9 "1" "1" angulo2 (strcat (rtos larg 2 2) " x 2.10"))
  (command "_attdia" "1")
  (devolve_status)
  (prompt "\n Janela inserida com sucesso!")
  
  (command "_undo" "_end")
  
  (princ)
)


;Cria vão na parede
(defun c:vao ()
  (guarda_status)

  (command "_undo" "_begin")

  (setvar "osmode" 567)
  
  (setq p1 (getpoint "\nSelecione ponto inicial"))
  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\nSelecione o outro lado da parede"))
  (devolve_status)

  (setq espessura (distance p1 p2))
  
  (setq larg (getreal (strcat "\nLargura do vão? <1.00>: ")))
  (if (= nil larg) (setq larg 1.00))

  (setq dir (angle p1 p2))
  (setq dir2 (- dir (/ pi 2)))
   
  (setq p3 (polar p1 dir2 (/ larg 2)))
  (setq p4 (polar p3 dir espessura))

  (setq p5 (polar p3 dir2 (* larg -1)))
  (setq p6 (polar p5 dir espessura))

  (setq pcortar1 (polar p1 dir -0.10))
  (setq pcortar2 (polar p2 dir 0.10))
  
  (command "_line" "_non" p3 "_non" p4 "")
  (command "_line" "_non" p5 "_non" p6 "")

  (command "._trim" "" "f" "_non" pcortar1 "_non" pcortar2 "" "")

  (command "_undo" "_end")
  (princ)
  
)


;Cria porta correr
(defun c:penrrolar ()

  (setq p1 nil
	p2 nil
	p3 nil
	p4 nil
	p5 nil
	p6 nil
	dir nil
	dir2 nil
	espessura nil
	larg nil)
	

  (guarda_status)

  (command "_undo" "_begin")
  
  
  (setvar "osmode" 567)
  (setq p1 (getpoint "\n Selecione o centro da parede Interna: "))
  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))
  (devolve_status)  
  (setq larg (getreal (strcat "\nLargura da janela : <2.00>: ")))
  (if (= nil larg) (setq larg 2.00))

  
  (setq espessura (distance p1 p2))
  (setq dir (angle p1 p2))
  (setq p3 (polar p1 dir espessura))
  (setq p4 (polar p3 dir 0.13))
  (setq p9 (polar p1 dir -0.30))
  (setq p5 (polar p2 (- dir (/ pi 2)) (/ larg 2)))
  (setq dir2 (angle p5 p2))
  (setq p6 (polar p5 dir2 larg))
  (setq p7 (polar p1 dir2 (/ larg 2)))
  
  (crl "05" 5)
  (setvar "clayer" "05")
  (command "._line" "_non" p1 "_non" p3 "")
  (command "._offset" (/ larg 2) (entlast) "@0,1" "")
  (command "._offset" larg (entlast) "_non" p1 "")
  (command "._trim" "" "f" "_non" p9 "_non" p4 "" "")
  (command "._erase" "f" "_non" p9 "_non" p3 "" "")

  ;Inserir linha externa na porta
  (crl "021" 1)
  (setvar "clayer" "021")
  (command "._line" "_non" p5 "_non" p6 "")


  ;ajustar angulo do texto para ele nao ficar de cabeça para baixo
  (setq angulo (- (* dir (/ 180 pi)) 90))
  (setq angulo2 angulo)
  (if (and (> angulo 90) (< angulo 270))
    (setq angulo2 (+ angulo 180))
  )
  (if (= angulo -90.0)
    (setq angulo2 90)
  )
  (command "._insert" "PortaEnrrolar" "_non" p1 larg 1 "_non" p7)
  (command "_attdia" "0")
  (command "_.insert" "CotaJanela" "_non" p9 "1" "1" angulo2 (strcat (rtos larg 2 2) " x 1.20"))
  (command "_attdia" "1")
  (devolve_status)
  (prompt "\n Porta inserida com sucesso!")
  
  (command "_undo" "_end")
  
  (princ)
)

(defun c:telhadocorte ()

(setq p1 (getpoint "\nSelecione o ponto inicial"))
(setq p2 (getpoint p1 "\Selecione o outro lado do telhado"))

(command "_point" "non" p1)
(command "_point" "non" p2)
 
  

(setq tamanho (distance p1 p2))


(setq dir (angle p1 p2))

(setq p3 (polar p1 dir (/ tamanho 2)))
  (command "_point" "non" p3)

(setq dir2 (- dir (/ pi 2)))

(setq p4 (polar p3 dir2 (* (* (/ tamanho 2) 0.30) -1)))


(command "_point" "non" p4)

(command "_line" "non" p3 "non" p4 "")       
      

)

(defun c:Tirante ()

  (command "_undo" "_begin")

  (guarda_status)
  
  (setvar "osmode" 1)
  (setq p1 (getpoint "\n Selecione o inicio do pontalete"))
  
  (setvar "osmode" 512)
  (setq p2 (getpoint p1 "\n Selecione um ponto na viga "))

  (setvar "osmode" 128)
  (setq p3 (getpoint p2 "\n Selecione um ponto na viga "))


  (setq dir (angle p2 p3))

  (setq p4 (polar p1 dir -0.12))
  (setq p5 (polar p2 dir 0.12))

  (command "_.line" "_non" p1 "_non" p5 "")
  (command "_.line" "_non" p4 "_non" p2 "")

  (setq dir2 (angle p1 p3))

  (setq p6 (polar p3 dir 0.05))
  (setq p7 (polar p6 dir2 0.12))

  (command "_.line" "_non" p6 "_non" p7 "")
  (command "_.line" "_non" p6 "_non" p2 "")

  (setq p8 (polar p7 dir -0.2))

  (command "_.line" "_non" p8 "_non" p7 "")

  (setq pext (polar p7 dir -0.17))
  (setq pext1 (polar pext dir2 -0.05))
  (setq pext2 (polar pext dir2 0.05))
  (setq pext3 (polar pext1 dir 0.17))

  (command "_.extend" "" "f" pext1 pext2 "" "")

  (command "_trim" "" "f" "non" pext3 "_non" pext1 "" "")

  (devolve_status)
  
  (command "_undo" "_end")
)

(defun c:osr ()
  (setvar "osmode" 567)
)

(defun c:corte ()

	(initget 128)
    (setvar "osmode" 567)
	(setq p1 (getpoint "\n [D]detalhes gerais do corte / < ou Clique para um novo corte - da direita para esquerda > :"))
  
	(cond
		((= 'LIST (type p1)) (novocorte))
		((= 'STR (type p1))
		(cond
			((= (strcase p1) "C") (exit))
			((= (strcase p1) "D") (painelcorte))
		)
		)
	)
	(princ)

)

(defun novocorte ()
    (command "_undo" "_begin")
	(guarda_status)
	(setq tamVigaBaldrame 0.30)
	(setq tamVigaRespaldo 0.30)
	(setq tamBeiral 0.70)
	(setq espessuraLaje 0.10)	
	(setq pedireito 3.00)
    (setq qtdparedes 3)
	(setq idCorte "")
	(setq tipopavimento "t")
	(setvar "osmode" 128)
	(setq p2 (getpoint p1 "\n Linha Final do Corte"))
	(setq p3(getpoint p1 "\n Direção do Corte"))
	(setq idCorte (getstring "\n Identificação do corte <A>"))
	
	(initget "T I S")
	(setq tipopavimento (getkword "\n Tipo de Pavimento: [I]intermediário [S]superior ou cobertura [T]terreo <T>:"))
	(if (= nil tipopavimento) (setq tipopavimento "T"))
	
	(if (/= (strcase tipopavimento) "I" ) 
		(progn
			(initget "L M S")
			(setq tipobeiral (getkword "\n Tipo Beiral: [M]madeira [S]sem beiral [L]Laje <L>:"))
			(if (= nil tipobeiral) (setq tipobeiral "L"))
			(if (= (strcase tipobeiral) "L")
				(progn
					(setq tamBeiral (getreal "\n Tamanho do Beiral<0.70> :"))
					(if (= nil tamBeiral) (setq tamBeiral 0.70))
				)
			)
		)
	)
	
	(if (= "" idCorte) (setq idCorte "A"))
	
	(if (= nil pedireito) (setq pedireito 3.00))
	
	(setq dist (distance p1 p3))
	(setq tamanhocorte (distance p1 p2))


	(setq dir_long (angle p1 p2))
	(setq dir_alt (angle p1 p3))	
	
	(setq p4 (polar p3 dir_long tamanhocorte))
	
	(setq p5 (polar p3 dir_alt (* tamVigaBaldrame -1)))
	(setq p6 (polar p4 dir_alt (* tamVigaBaldrame -1)))
	
	(setq p7 (polar p3 dir_alt pedireito))
	(setq p8 (polar p4 dir_alt pedireito))
	
	(setq p9 (polar p5 dir_long 0.15))
	(setq p10 (polar p6 dir_long -0.15))
	
	(setq p11 (polar p9 dir_alt (- tamVigaBaldrame espessuraLaje)))
	(setq p12 (polar p10 dir_alt (- tamVigaBaldrame espessuraLaje)))
	
	(setq p13 (polar p7 dir_long (* tamBeiral -1)))
	(setq p14 (polar p8 dir_long tamBeiral))
	
	(setq p15 (polar p13 dir_alt espessuraLaje))
	(setq p16 (polar p14 dir_alt espessuraLaje))
	
	(setq p17 (polar p3 dir_long 0.15))
	(setq p18 (polar p4 dir_long -0.15))
	
	(setq p19 (polar p7 dir_long 0.15))
	(setq p20 (polar p8 dir_long -0.15))
	
	(setq p21 (polar p5 dir_long 0.075))
	(setq p22 (polar p10 dir_long 0.075))
	
	(setq p23 (polar p5 dir_long 0.50))
	(setq p24 (polar p23 dir_alt -0.70))
	
	(setq p25 (polar p24 dir_alt -0.10)) ;ponto baldrame linhas
	(setq p26 (polar p25 dir_long 1.73)) ; ponto final baldrames linhas
	
	(setq p27 (polar p25 dir_alt -0.20)) ;ponto linhas estacas
	(setq p28 (polar p27 dir_long 2.08)) ; ponto final linhas estacas
	
	(setq p29 (polar p7 dir_alt espessuraLaje))
	(setq p30 (polar p8 dir_alt espessuraLaje))
	
	(setq pl1 (polar p19 dir_long 0.50))
	(setq pl2 (polar pl1 dir_alt -0.20))
	(setq pl3 (polar pl2 dir_long 0.50))
	(command "._insert" "Textos" "_non" pl2 1 1 "_non" pl3 "LAJE-PRÉ" "._burst" "l")			
	
	;desenha as linhas
	(if (= (strcase tipopavimento) "T")
		(progn
		
			(crl "05" 5)
			(setvar "clayer" "05")
		
            (if (= (strcase tipobeiral) "L") (command "_line" "_non" p5 "_non" p7 "_non" p13 "_non" p15 "_non" p16 "_non" p14 "_non" p8 "_non" p6 "") (command "_line" "_non" p5 "_non" p29 "_non" p30 "_non" p6 ""))
		    (command "_line" "_non" p17 "_non" p19 "_non" p20 "_non" p18 "")       	
			(command "_line" "_non" p5 "_non" p9 "_non" p11 "_non" p12 "_non" p10 "_non" p6 "")  
			(command "_line" "_non" p3 "_non" p4 "")
			(command "_line" "_non" (polar p7 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "_non" (polar p19 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "")
			(command "_line" "_non" (polar p20 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "_non" (polar p8 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "")
		
		
			(crl "021" 1)
			(setvar "clayer" "021")
			(command "_line" "_non" (polar p5 dir_alt (- tamVigaBaldrame espessuraLaje)) "_non" (polar (polar p5 dir_alt (- tamVigaBaldrame espessuraLaje)) dir_long -0.70) "")
			(command "_line" "_non" (polar p6 dir_alt (- tamVigaBaldrame espessuraLaje)) "_non" (polar (polar p6 dir_alt (- tamVigaBaldrame espessuraLaje)) dir_long 0.70) "")
		
			;linhas das estacas e baldrames
			(command "_line" "_non" p25 "_non" (polar (polar p5 dir_long 0.075) dir_alt 0.15) "")
			(command "_line" "_non" p26 "_non" (polar (polar p10 dir_long 0.075) dir_alt 0.15) "")	
			(command "_line" "_non" p27 "_non" (polar (polar p5 dir_long 0.075) dir_alt -0.25) "")
			(command "_line" "_non" p28 "_non" (polar (polar p10 dir_long 0.075) dir_alt -0.25) "")	
			(command "_insert" "estacacorte" "_non"  p21 0.5 0.15 "_non" (polar p21 dir_alt -0.15) "_explode" (entlast) "")
			(command "_insert" "estacacorte" "_non"  p22 0.5 0.15 "_non" (polar p22 dir_alt -0.15) "_explode" (entlast) "")
			(command "_insert" "BaldramesEstacas" "_non"  p24 1 1 "_non" (polar p24 dir_long 0.15) "_explode" (entlast) "")
			(command "_insert" "TerraEsquerdaCorte" "_non"  (polar p11 dir_long -0.15) 1 1 "_non" p11 "")
			(command "_insert" "TerraDireitaCorte" "_non"  p11 1 1 "_non" (polar p11 dir_long 0.20) "")
			(command "_insert" "TerraDireitaCorte" "_non"  (polar p12 dir_long 0.15) 1 1 "_non" (polar p12 dir_long 0.20) "")
			(command "_insert" "TerraEsquerdaCorte" "_non"  p12 1 1 "_non" (polar p12 dir_long 0.20) "")
			
			(crl "Textos" 7)e 
			(setvar "clayer" "Textos")			
			
			(setq pnomedesenho (polar (polar p26 dir_long 2.00) dir_alt -0.30))
			(command "._insert" "NomeDesenho" "_non" pnomedesenho 1 1 "_non" (polar pnomedesenho dir_long 0.30) "Escala 1:75" (strcat "CORTE " idCorte idCorte) "._burst" "l")			
			
			
		)
	)
	
	(if (= (strcase tipopavimento) "S")
		(progn
		
			(crl "05" 5)
			(setvar "clayer" "05")
		
            (if (= (strcase tipobeiral) "L") (command "_line" "_non" p3 "_non" p7 "_non" p13 "_non" p15 "_non" p16 "_non" p14 "_non" p8 "_non" p4 "") (command "_line" "_non" p3 "_non" p29 "_non" p30 "_non" p4 ""))
		    (command "_line" "_non" p17 "_non" p19 "_non" p20 "_non" p18 "")       	
			(command "_line" "_non" p3 "_non" p4 "")
			(command "_line" "_non" (polar p7 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "_non" (polar p19 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "")
			(command "_line" "_non" (polar p20 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "_non" (polar p8 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "")
		)
	)

	(if (= (strcase tipopavimento) "I")
		(progn
		
			(crl "05" 5)
			(setvar "clayer" "05")
		
            (command "_line" "_non" p3 "_non" p29 "_non" p30 "_non" p4 "")
		    (command "_line" "_non" p17 "_non" p19 "_non" p20 "_non" p18 "")       	
			(command "_line" "_non" p3 "_non" p4 "")
			(command "_line" "_non" (polar p7 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "_non" (polar p19 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "")
			(command "_line" "_non" (polar p20 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "_non" (polar p8 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)) "")
		)
	)
	
	
    (setq pl1 (polar p1 dir_long -0.65))
	(setq pl2 (polar p2 dir_long 0.65))
			
	(setq pl3 (polar pl1 dir_alt 0.45))
	(setq pl4 (polar pl2 dir_alt 0.45))
	
	(command "_insert" "LinhaCorte" "_non" (polar pl1 dir_long 0.45) (- (distance pl1 pl2) 0.90) 1 "_non" (polar pl2 dir_long -0.45) "_explode" (entlast) "" )	   
	
	(command "_insert" "corte" "_non" pl1 1 1 "_non" pl3)
	(command "_insert" "corte" "_non" pl2 1 1 "_non" pl4)

	(crl "Textos" 7)
	(guarda_status)
	(setvar "clayer" "Textos")
	
	(command "_text" "c" "_non" pl3 0.20 0 (strcase idCorte))
	(command "_text" "c" "_non" pl4 0.20 0 (strcase idCorte))	

   
   	(crl "05" 5)
	(setvar "clayer" "05")

    (setvar "osmode" 567)
	
	(painelparedecorte)
 
    (devolve_status)
	
	(command "_undo" "_end")
	
)


(defun painelcorte()
	(initget "C T P J U L")
  
	(setq resp (getkword "\n [T]telhado / [P]porta [J]janelas [L]linhas / [U]undo"))
  
	(cond
		((= (strcase resp) "C") (exit))
		((= (strcase resp) "T") (beirallaje))
		((= (strcase resp) "P") (painelportacorte))
		((= (strcase resp) "J") (paineljanelacorte))
		((= (strcase resp) "U") (undocorte))
		((= (strcase resp) "L") (painellinhacorte))
	)
	
	(princ)
)

(defun undocorte()
(command "_undo" "")
(painelcorte)
)

(defun painellinhacorte()
	(setvar "osmode" 567)
	(initget 128)
	(setq ponto2 (getpoint "Clique ponto inicial da linha ou [P]porta [J]janela [V]oltar menu anterior]:"))
  
	(cond
		((= 'LIST (type ponto2)) (linhacorte))
		((= 'STR (type ponto2))
		(cond
			((= (strcase ponto2) "V") (painelcorte))
			((= (strcase ponto2) "P") (painelportacorte))
			((= (strcase ponto2) "J") (paineljanelacorte))
		)
		)
	)
	(princ)
)

(defun linhacorte()
	(setvar "osmode" 128)
	(setq ponto4 (getpoint ponto2 "\n Selecione o piso no corte"))
	(setvar "osmode" 567)	
	(setq ponto5 (polar ponto4 (angle ponto2 ponto4) pedireito))
	(crl "021" 1)
	(setvar "clayer" "021")
	(command "_pline" "_non" ponto4 "_non" ponto5  "")
	(devolve_status)
	(painellinhacorte)
	(princ)
)

(defun paineljanelacorte()
	(setvar "osmode" 567)
	(initget 128)
	(setq ponto2 (getpoint "Clique ponto inicial da janela ou [P]porta [L]linhas [V]oltar menu anterior]:"))
  
	(cond
		((= 'LIST (type ponto2)) (janelacorte))
		((= 'STR (type ponto2))
		(cond
			((= (strcase ponto2) "V") (painelcorte))
			((= (strcase ponto2) "P") (painelportacorte))
			((= (strcase ponto2) "L") (painellinhacorte))
		)
		)
	)
	(princ)
)

(defun janelacorte ( )
	(setvar "osmode" 567)	
	(setq ponto3 (getpoint ponto2 "\n Selecione o final da Porta"))
	(setvar "osmode" 128)
	(setq ponto4 (getpoint ponto2 "\n Selecione o piso no corte"))
	(setq alturajanela (getreal "\n Digite a Altura da Janel <1.20>"))
	(if (= nil alturajanela) (setq alturajanela 1.20))	
	(setvar "osmode" 567)	
	(setq ponto5 (polar ponto4 dir_alt 2.10))
	(setq ponto6 (polar ponto5 dir_long (distance ponto2 ponto3)))
	(setq ponto7 (polar ponto6 dir_alt (* alturajanela -1)))
	(setq ponto8 (polar ponto5 dir_alt (* alturajanela -1)))
	(crl "021" 1)
	(setvar "clayer" "021")
	(command "_pline" "_non" ponto5 "_non" ponto6  "_non" ponto7  "_non" ponto8 "c")
	(devolve_status)
	(paineljanelacorte)
	(princ)
)

(defun painelportacorte()
	(setvar "osmode" 567)
	(initget 128)
	(setq ponto2 (getpoint "\n Clique ponto inicial da porta ou [J]janela [L]linha [V]oltar menu anterior]:"))
  
	(cond
		((= 'LIST (type ponto2)) (portacorte))
		((= 'STR (type ponto2))
		(cond
			((= (strcase ponto2) "V") (painelcorte))
			((= (strcase ponto2) "J") (paineljanelacorte))
			((= (strcase ponto2) "L") (painellinhacorte))
		)
		)
	)
	(princ)
)

(defun portacorte ( )

	(setvar "osmode" 567)	
	;(setq ponto2 (getpoint "\n Selecione o inicio da Porta"))
	(setq ponto3 (getpoint ponto2 "\n Selecione o final da Porta"))
	
	;(command "_zoom" "_non" p15 "_non" p6)
	
	(setvar "osmode" 128)
	(setq ponto4 (getpoint ponto2 "\n Selecione o piso no corte"))	
	
	(setvar "osmode" 567)	
	
	(setq ponto5 (polar ponto4 dir_alt 2.10))
	(setq ponto6 (polar ponto5 dir_long (distance ponto2 ponto3)))
	(setq ponto7 (polar ponto4 dir_long (distance ponto2 ponto3)))
	
	(crl "021" 1)
	(setvar "clayer" "021")
	
    ;(command "_zoom" "p") 
	
	(command "_pline" "_non" ponto4 "_non" ponto5  "_non" ponto6  "_non" ponto7 "c")
	
	(devolve_status)
	
	(painelportacorte)

	(princ)
)

(defun painelparedecorte()
	(initget 128)
  
	(setq ponto1 (getpoint "\n [T]telhado / [P]porta [J]janelas [L]linhas / [U]undo / <Clique para nova parede no corte> :"))
  
	(cond
		((= 'LIST (type ponto1)) (paredecorte))
		((= 'STR (type ponto1))
		(cond
			((= (strcase ponto1) "C") (exit))
			((= (strcase ponto1) "T") (beirallaje))
			((= (strcase ponto1) "P") (painelportacorte))
			((= (strcase ponto1) "J") (paineljanelacorte))
			((= (strcase ponto1) "U") (undocorte))
			((= (strcase ponto1) "L") (painellinhacorte))
		)
		)
	)
	(princ)
)


(defun paredecorte ( )

        
	(guarda_status)
	(setq ponto2 (getpoint ponto1 "\n Selecione a direção da Parede (espessura)"))
	(setq ponto3 (polar p5 dir_long (distance p1 ponto1)))
	(setq ponto4 (polar ponto3 dir_long (distance ponto1 ponto2)))
	
	(setq ponto5 (polar p7 dir_long (distance p1 ponto1)))
	(setq ponto6 (polar ponto5 dir_long (distance ponto1 ponto2)))
	 
	(setq ponto7 (polar ponto5 dir_alt (* (- tamVigaRespaldo espessuraLaje) -1)))
	(setq ponto8 (polar ponto7 dir_long (distance ponto1 ponto2)))
	
	(setq ponto9 (polar p3 dir_long (distance p1 ponto1)))
	(setq ponto10 (polar ponto9 dir_long (distance ponto1 ponto2)))

	(setq ponto11 (polar ponto3 dir_alt  (- tamVigaBaldrame espessuraLaje)))
	(setq ponto12 (polar ponto11 dir_long (distance ponto1 ponto2)))
	
	(setq pcorte1 (polar ponto5 dir_long (/ (distance ponto1 ponto2) 2)))
	(setq pcorte2 (polar pcorte1 dir_alt 0.03))
	(setq pcorte3 (polar pcorte1 dir_alt -0.03))
	
	(setq pcorte4 (polar ponto11 dir_long (/ (distance ponto1 ponto2) 2)))
	(setq pcorte5 (polar pcorte4 dir_alt 0.03))
	(setq pcorte6 (polar pcorte4 dir_alt -0.03))	
	
	(setq pinsert1 (polar ponto3 dir_long (/ (distance ponto1 ponto2) 2)))
	(setq pinsert2 (polar pinsert1 dir_alt -0.15))
	(command "_undo" "_begin")
	(crl "05" 5)
	(setvar "clayer" "05")
	(command "_line" "_non" ponto11 "_non" ponto3  "_non" ponto4  "_non" ponto12 "")
	(command "_line" "_non" ponto7 "_non" ponto8 "")      
	(command "_line" "_non" ponto9 "_non" ponto5 "")
	(command "_line" "_non" ponto10 "_non" ponto6 "") 
	
	(command "_zoom" "_non" p15 "_non" p6)
	
    (command "_trim" "" "f" "_non" pcorte2	"_non" pcorte3 "" "")	
	(command "_trim" "" "f" "_non" pcorte5	"_non" pcorte6 "" "")
	
	(if (= (strcase tipopavimento) "T")
		(progn
			(crl "21" 1)
			(setvar "clayer" "21")
			(command "_line" "_non" p26 "_non" (polar (polar ponto3 dir_long 0.075) dir_alt 0.15) "")	
			(command "_line" "_non" p28 "_non" (polar (polar ponto3 dir_long 0.075) dir_alt -0.25) "")		
			(command "_insert" "TerraEsquerdaCorte" "_non"  ponto11 1 1 "_non" ponto12 "")
			(command "_insert" "TerraDireitaCorte" "_non"  ponto12 1 1 "_non" (polar ponto12 dir_long 0.20) "")	
			(command "_insert" "estacacorte" "_non"  pinsert1 0.5 (distance ponto1 ponto2) "_non" pinsert2 "_explode" (entlast) "")
		)
	)	
	
	(command "_zoom" "p")
	
	(command "_undo" "_end")
	
	(devolve_status)
	(painelparedecorte)
	(princ)
)


(defun c:beiralmadeirafrente ()
	(command "_insert" "beiralmadeiraFrente" pause 1 pause pause "_explode" (entlast) "")
	(devolve_status)
)

(defun c:beirallajefrente ()
	(command "_insert" "BeiralLajeFrente" pause 1 pause pause "_explode" (entlast) "")
	(devolve_status)
)

(defun c:beirallajelado ()
	(command "_insert" "BeiralLajeLado" pause 1 pause pause "_explode" (entlast) "")
	(devolve_status)
)

(defun c:blaje (/)

  (guarda_status)
  
  (setq p1 (getpoint "\n Selecione o ponto inicial do telhado"))
  (setq p2 (getpoint p1 "\n Selecione o ponto final do telhado"))
    
  (setq dir (angle p1 p2))


  (cond
    ((= dir pi) (setq x -1))
    ((= dir 0.0) (setq x 1))
    ((= dir (/ pi 2)) (setq x 1))
    ((= dir (+ pi (/ pi 2))) (setq x -1))
    (t nil)
  )
 
  (command "._insert" "BeiralLaje" p1 1 x p2 "_explode" (entlast) "")
  (setq dir2 (- dir (/ pi 2)))
  (setq p3 (polar p2 dir2 (* (*(/ (distance p1 p2) 2) -1) x)))
  (command "._line" "_non" p2 "_non" p3 "")
  (setq p4 (polar p1 dir 2.30))
  (setq p5 (polar p4 dir2 (* -0.05 x)))
  (setq p6 (polar p5 dir2 (* -0.90 x)))
  (command "._extend" "" "f" "_non" p5 "_non" p6 "" "")
  (setq perase1 (polar p2 dir2 (* -0.03 x)))
  (setq perase2 (polar perase1 dir 0.2))
  (setq perase3 (polar perase1 dir -0.20))
  (command "point" "non" perase2)
  (command "point" "non" perase3)
  (command "_erase" "f" "_non" perase2 "_non" perase3 "" "")

  (pendural p3 p2)
  
  (devolve_status)
  (princ)
)


