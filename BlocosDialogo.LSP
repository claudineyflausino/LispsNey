
(defun support( / carac n path_completo)
  (setq carac nil)
  (setq n 1)
  (setq path_completo (getvar "acadprefix"))
  (while (/= carac ";")
    (setq carac (substr path_completo n 1))
    (setq n (+ n 1))
  )
  (setq support_path (strcat (substr path_completo 1 (- n 2)) "\\"))
)

;dados para os cabe�alhos da janela
(setq nome_fabricante "CLAUDINEY AP. FLAUSINO")
(setq contato_fabr "(043) 9 8805-7567")
;fim dados cabe�alho

(defun fabr(lista lista_blocos nome_biblioteca / ed dcl_id) 

  (support)
  (setq ed (open (strcat support_path "DIALOGO6.dcl") "w"))
  (write-line "fabricantes:dialog{" ed)
  (write-line "label=\"Biblioteca 1.0 - ca.flausino@bol.com.br\";" ed)
  (write-line ":boxed_column{" ed)
  (write-line "label=\"Dados do Desenvolvedor:\";" ed)
  (write-line ":text{" ed)
  (write-line (strcat "label=\"" nome_fabricante "\";}") ed)
  (write-line ":text{" ed)
  (write-line (strcat "label=\"" descr_biblio "\";}") ed)
  (write-line ":text{" ed)
  (write-line (strcat "label=\"" contato_fabr "\";}}") ed)
  (write-line "spacer;" ed)
  (write-line ":boxed_row{" ed)
  (write-line " label=\"SELECIONE O BLOCO : \";" ed)
  (write-line ":list_box{" ed)
  (write-line "width=45;" ed)
  (write-line "key=\"bloco\";}" ed)
  (write-line ":image{" ed)
  (write-line "height=15;" ed)
  (write-line "aspect_ratio=1.5;" ed)
  (write-line "key=\"imagem\";}" ed)
  (write-line ":image{" ed)
  (write-line "height=15;" ed)
  (write-line "aspect_ratio=1.5;" ed)
  (write-line "key=\"imagem1\";}}" ed)
  
  (write-line "spacer;" ed)
  (write-line "ok_cancel;}" ed)
  (close ed)

  
  (setq x 0)
  (setq	y 0)
  (setq nome_bloco nil)
  (setq pos nil)
  (setq dcl_id (load_dialog (strcat support_path "DIALOGO6.dcl")))
  (new_dialog "fabricantes" dcl_id)
  (start_list "bloco")
  (mapcar 'add_list lista) 
  (end_list)
  
  (set_tile "bloco" "0")
  (start_image "imagem")
  (setq x (dimx_tile "imagem"))
  (setq y (dimy_tile "imagem"))
  (fill_image 0 0 x y -16)
  (setq nome_bloco (nth 0 lista_blocos))
  (slide_image 0 0 x y (strcat nome_biblioteca "(" nome_bloco ")"))
  (end_image)
  (action_tile "bloco" "(mostra_slide)")
  (action_tile "accept" "(done_dialog 1)")
  (setq cx_bloco (start_dialog))
  (unload_dialog dcl_id)
  )

(defun mostra_slide() 
  (setq pos (atoi (get_tile "bloco")))
  (setq nome_bloco (nth pos lista_blocos))
  (start_image "imagem")
  (setq x (dimx_tile "imagem"))
  (setq y (dimy_tile "imagem"))
  (fill_image 0 0 x y -16)
  (slide_image 0 0 x y (strcat nome_biblioteca "(" nome_bloco ")"))
  (end_image)
  )

(defun insere(path nome_bloco escala)
  (setq fator_cor (* (getvar "userr1") escala))
  (if (/= fator_cor 0.0)
    (command "_INSERT" (strcat path nome_bloco ".dwg") pause pause pause pause)
    (command "_INSERT" (strcat path nome_bloco ".dwg") pause pause pause pause)
  )
  (princ)
)
;***FIM_ORIGINAL


;***cozinha
(defun C:COZINHA()
  (setq descr_biblio "Blocos para Cozinha")
  (setq nome_biblioteca "COZINHA")
  (setq escala 1000)
  (setq lista '("Geladeira" "Fog�o 4 Bocas" "Fog�o 6 Bocas" "Cuba de pia" "Arm�rio 2 portas"
	        "Arm�rio 3 portas"  "Arm�rio 4 portas"  "Arm�rio 5 portas"  "Arm�rio 6 portas" ))
  (setq lista_blocos '("GELADEIRA" "FOGAO_4B" "FOGAO_6B" "CUBA_PIA" "ARM_2P" "ARM_3P" "ARM_4P"
		       "ARM_5P" "ARM_6P"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***FIM_cozinha

;***BANHEIRO
(defun C:BANHEIRO()
  
  (setq descr_biblio "Blocos para Banheiro")
  (setq nome_biblioteca "BANHEIRO")
  (setq escala 1000)
  (setq lista '("Lavat�rio 1" "Lavat�rio 2" "Lavat�rio 3" "Cuba simples" "Vaso sanit�rio"
		"Bide" "Mict�rio" "Mict�rio de Canto" "B. Hidromassagem" "B. Hidromassagem Canto"))
  (setq lista_blocos '("PIA" "lav_02" "LAV_03" "PIA2" "VASO" "BIDE" "MIC_1" "MIC_C" "HIDRO" "HIDRO_C"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***FIM_BANHEIRO

;***SETAS
(defun C:SETAS()
  (setq descr_biblio "Blocos para Setas")
  (setq nome_biblioteca "SETAS")
  (setq escala 1000)
  (setq lista '("Seta 01 - Geral" "Seta 02 - Cobertura" "Seta 03 - Corte" "Seta 04 - Norte"))
  (setq lista_blocos '("SETA" "SETCOB" "CORTE" "NORTE"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***FIM_SETAS

;***vegeta��o
(defun C:VEGETACAO()
  (setq descr_biblio "Blocos de Vegeta��o")
  (setq nome_biblioteca "VEGETACAO")
  (setq escala 1000)
  (setq lista '("�rvore 1" "�rvore 2" "�rvore 3" "Coqueiro 1" "Arbusto 01" "Flor 01" "Flor 02"
		"Vaso de Flor 1" "Vaso de Flor 2" "Vaso de Flor 3" "Vaso de Flor 4"
		"Vaso de Flor 5" "Vaso de Flor 6" "Vaso de Flor 7" "Vaso de Flor 8"
		"Vaso de Flor 9" "Vaso de Flor 10" "Vaso de Flor 11" "Vaso de Flor 12"
		"Vaso de Flor 13" "Vaso de Flor 14"))
  (setq lista_blocos '("ARVORE1" "ARVORE2" "ARVORE3" "COQUEIRO" "ARBUSTOS1" "FLOR1" "FLOR2" "VEGET1"
		       "VEGET2" "VEGET3" "VEGET4" "VEGET5" "VEGET6" "VEGET7" "VEGET8" "VEGET9"
		       "VEGET10" "VEGET11" "VEGET12" "VEGET13" "VEGET14" "VEGET1"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***VEGETACAO


;***PORTAS E JANELAS
(defun C:PJANELAS()
  (setq descr_biblio "Blocos de Portas e Janelas")
  (setq nome_biblioteca "PJANELAS")
  (setq escala 1000)
  (setq lista '( "Janela Horizontal" "Janela Vertical" "Porta simples" "Porta de Correr"
		 "Porta de Com�rcio"))
  (setq lista_blocos '("JH" "JV" "P" "PCOR" "PCOM"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***Portas e janelas

;VEICULOS
(defun C:VEICULOS()
  (setq descr_biblio "Blocos de Ve�culos")
  (setq nome_biblioteca "VEICULOS")
  (setq escala 1000)
  (setq lista '( "Astra Cima" "Astra Frente" "Astra Lado" "Mercedes Cima"
		 "Mercedes Frente" "Mercedes Lado" "Tipo Cima" "Tipo Frente" "Tipo Lado"
		 "Tempra Cima" "Tempra Frente" "Tempra Lado" "Fusca Cima" "Fusca Frente"
		 "Fusca Lado" "�nibus Cima" "�nibus Frente" "�nibus Lado"))
  (setq lista_blocos '("ASTRA_C" "ASTRA_F" "ASTRA_L" "MERCEDES_C" "MERCEDES_F" "MERCEDES_L"
		       "TIPO_C" "TIPO_F" "TIPO_L" "TEMPRA_C" "TEMPRA_F" "TEMPRA_L" "FUSCA_C"
		       "FUSCA_F" "FUSCA_L" "CIRCULAR_C" "CIRCULAR_F" "CIRCULAR_L"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***VEICULOS

;CARIMBOS
(defun C:CARIMBOS()
  (setq descr_biblio "Blocos de Ve�culos")
  (setq nome_biblioteca "CARIMBOS")
  (setq escala 1000)
  (setq lista '( "A4" "A3" "Proj. Arquitet�nico" "Proj. Complementar" "Sub/Unif. lotes"))
  (setq lista_blocos '("A4" "A3" "ARQUITET" "COMPLE" "SUBDIVISAO"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***CARIMBOS

;***SALA
(defun C:SALA()
  (setq descr_biblio "Blocos para Sala")
  (setq nome_biblioteca "SALA")
  (setq escala 1000)
  (setq lista '("Sofa 03 Lugares" "Sofa 2 Lugares"))
  (setq lista_blocos '("sofa3" "sofa2"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***FIM_SALA

;PESSOAS
(defun C:PESSOAS()
  (setq descr_biblio "Blocos de Pessoas")
  (setq nome_biblioteca "PESSOAS")
  (setq escala 1000)
  (setq lista '("Casal 01" "Casal 02" "Casal 03" "Casal 04" "Casal 05" "Casal 06" "Casal 07"
		"Casal 08" "Homem 01 Planta" "Homem 02 Planta" "Homem 03 Planta"
		"Homem 03 Eleva��o" "Homem 04 Planta" "Homem 04 Eleva��o" "Homem 05 Eleva��o"
		"Homem 06 Eleva��o" "Homem 07 Eleva��o" "Homem 08 Eleva��o" "Homem 09 Eleva��o"
		"Homem 10 Eleva��o" "Homem 11 Eleva��o" "Homem 12 Eleva��o" "Homem 13 Eleva��o"
		"Homem 14 Eleva��o" "Homem 15 Eleva��o" "Homem 16 Eleva��o" "Homem 17 Eleva��o"
		"Homem 18 Eleva��o" "Homem 19 Eleva��o" "Homem 20 Eleva��o" "Homem 21 Eleva��o"
		"Mulher 01 Planta" "Mulher 01 Eleva��o" "Mulher 02 Planta" "Mulher 02 Eleva��o"
		"Mulher 03 Eleva��o" "Mulher 04 Eleva��o" "Mulher 05 Eleva��o" "Mulher 06 Eleva��o"
		"Mulher 07 Eleva��o" "Mulher 08 Eleva��o" "Mulher 09 Eleva��o" "Mulher 10 Eleva��o"
		"Mulher 11 Eleva��o" "Mulher 12 Eleva��o" "Mulher 13 Eleva��o"
		"Deficiente"))
  (setq lista_blocos '("Casal01" "Casal02" "Casal03" "Casal04" "Casal05" "Casal06" "Casal07"
		       "Casal08" "Homem01P" "Homem02P" "Homem03P" "Homem03E" "Homem04P"
		       "Homem04E" "Homem05E" "Homem06E" "Homem07E" "Homem08E" "Homem09E"
		"Homem10E" "Homem11E" "Homem12E" "Homem13E" "Homem14E" "Homem15E" "Homem16E"
		       "Homem17E" "Homem18E" "Homem19E" "Homem20E" "Homem21E" "Mulher01P"
		       "Mulher01E" "Mulher02P" "Mulher02E" "Mulher03E" "Mulher04E" "Mulher05E"
		       "Mulher06E" "Mulher07E" "Mulher08E" "Mulher09E" "Mulher10E" "Mulher11E"
		       "Mulher12E" "Mulher13E" "Deficiente"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***PESSOAS


;BLOCOS DE TELEFONICO
(defun C:TELEFONICO()
  (setq descr_biblio "Blocos de Tub. Telef�nica")
  (setq nome_biblioteca "TELEFONICO")
  (setq escala 1000)
  (setq lista '("Det. de observa��o" "Legenda" "Poste lado Direito"
		"Poste Lado Esquerdo" "Tomada de Dados" "Tomada de Telefone"))
    (setq lista_blocos '("OBS_TEL" "LEG" "POSTETEL_D" "POSTETEL_E" "DADOS" "TE"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***TELEFONICO