
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

;dados para os cabeçalhos da janela
(setq nome_fabricante "CLAUDINEY AP. FLAUSINO")
(setq contato_fabr "(043) 9 8805-7567")
;fim dados cabeçalho

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
  (setq lista '("Geladeira" "Fogão 4 Bocas" "Fogão 6 Bocas" "Cuba de pia" "Armário 2 portas"
	        "Armário 3 portas"  "Armário 4 portas"  "Armário 5 portas"  "Armário 6 portas" ))
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
  (setq lista '("Lavatório 1" "Lavatório 2" "Lavatório 3" "Cuba simples" "Vaso sanitário"
		"Bide" "Mictório" "Mictório de Canto" "B. Hidromassagem" "B. Hidromassagem Canto"))
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

;***vegetação
(defun C:VEGETACAO()
  (setq descr_biblio "Blocos de Vegetação")
  (setq nome_biblioteca "VEGETACAO")
  (setq escala 1000)
  (setq lista '("Árvore 1" "Árvore 2" "Árvore 3" "Coqueiro 1" "Arbusto 01" "Flor 01" "Flor 02"
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
		 "Porta de Comércio"))
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
  (setq descr_biblio "Blocos de Veículos")
  (setq nome_biblioteca "VEICULOS")
  (setq escala 1000)
  (setq lista '( "Astra Cima" "Astra Frente" "Astra Lado" "Mercedes Cima"
		 "Mercedes Frente" "Mercedes Lado" "Tipo Cima" "Tipo Frente" "Tipo Lado"
		 "Tempra Cima" "Tempra Frente" "Tempra Lado" "Fusca Cima" "Fusca Frente"
		 "Fusca Lado" "Ônibus Cima" "Ônibus Frente" "Ônibus Lado"))
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
  (setq descr_biblio "Blocos de Veículos")
  (setq nome_biblioteca "CARIMBOS")
  (setq escala 1000)
  (setq lista '( "A4" "A3" "Proj. Arquitetônico" "Proj. Complementar" "Sub/Unif. lotes"))
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
		"Homem 03 Elevação" "Homem 04 Planta" "Homem 04 Elevação" "Homem 05 Elevação"
		"Homem 06 Elevação" "Homem 07 Elevação" "Homem 08 Elevação" "Homem 09 Elevação"
		"Homem 10 Elevação" "Homem 11 Elevação" "Homem 12 Elevação" "Homem 13 Elevação"
		"Homem 14 Elevação" "Homem 15 Elevação" "Homem 16 Elevação" "Homem 17 Elevação"
		"Homem 18 Elevação" "Homem 19 Elevação" "Homem 20 Elevação" "Homem 21 Elevação"
		"Mulher 01 Planta" "Mulher 01 Elevação" "Mulher 02 Planta" "Mulher 02 Elevação"
		"Mulher 03 Elevação" "Mulher 04 Elevação" "Mulher 05 Elevação" "Mulher 06 Elevação"
		"Mulher 07 Elevação" "Mulher 08 Elevação" "Mulher 09 Elevação" "Mulher 10 Elevação"
		"Mulher 11 Elevação" "Mulher 12 Elevação" "Mulher 13 Elevação"
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
  (setq descr_biblio "Blocos de Tub. Telefônica")
  (setq nome_biblioteca "TELEFONICO")
  (setq escala 1000)
  (setq lista '("Det. de observação" "Legenda" "Poste lado Direito"
		"Poste Lado Esquerdo" "Tomada de Dados" "Tomada de Telefone"))
    (setq lista_blocos '("OBS_TEL" "LEG" "POSTETEL_D" "POSTETEL_E" "DADOS" "TE"))
  (fabr lista lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***TELEFONICO