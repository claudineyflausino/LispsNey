;controle e a�oes de janelas autolisp ###############################################################################

;Lisps Elaboradas por Claudiney Flausino

;##############   Configuracao de Portas  ###############################################################################

(defun c:ptConfig () (cfpt)) ; comando para chamar configura��o de portas pelo teclado autocad

;Func��o para abrir janela config portas
(defun Cfpt ()
  (setq dcl_id (load_dialog (strcat path "Janelas.dcl")))
  (if (not (new_dialog "ConfigPt" dcl_id)) (exit))

  (carrega_arquivo_portas)

  
  ;Setagem
  (set_tile "txt_Tipo" tipo_porta_config)
  (action_tile "txt_Tipo" "(setq tipo_porta_config $value)")
  
  (set_tile "txt_Largura" larg_porta_config)
  (action_tile "txt_Largura" "(setq larg_porta_config $value)")
  
  (set_tile "txt_Altura" alt_porta_config)
  (action_tile "txt_Altura" "(setq alt_porta_config $value)")
  
  (set_tile "txt_Boneca" boneca_config)
  (action_tile "txt_Boneca" "(setq boneca_config $value)")

  ;toggle
  (set_tile "ch_Cota" cota_porta_config)
  (action_tile "ch_Cota" "(setq cota_porta_config $value)")
  
  (set_tile "ch_Arco" arco_porta_config)
  (action_tile "ch_Arco" "(setq arco_porta_config $value)")
  
  (set_tile "ch_Linha" linha_porta_config)
  (action_tile "ch_Linha" "(setq linha_porta_config $value)")

  (set_tile "ch_Codificar" codificar_porta)
  (action_tile "ch_Codificar" "(setq codificar_porta $value)")
  
  (set_tile "txtLayerArco" layer_arco)
  (action_tile "txtLayerArco" "(setq layer_arco $value)")

  (set_tile "txtCorArco" cor_arco)
  (action_tile "txtCorArco" "(setq cor_arco $value)")
  

  ;ok e cancel
  (action_tile "accept" "(done_dialog 1)")
  (action_tile "cancel" "(done_dialog 0)")
  
  
  ;Finalizacao
  (setq ValorConfigPortas (start_dialog))
  (unload_dialog dcl_id)

  (if (= ValorConfigPortas 1) (salva_config_portas))
  (princ)
  
)

(defun carrega_arquivo_portas ()
  ;verifica se o arquivo existe
  (setq arquivo (findfile (strcat path "Dados/portas.txt")))
  (if (= nil arquivo)
    (carrega_variaveis_porta)
    (abre_arquivo_porta)
   )
)

(defun carrega_variaveis_porta ()
  	(setq
		tipo_porta_config "Porta interna de Madeira"
		boneca_config "0.10"
		larg_porta_config "0.80"
		alt_porta_config "2.10"
		cota_porta_config "1"
		arco_porta_config "1"
		linha_porta_config "0"
		codificar_porta "1"
  		cor_parede "5"
  		cor_arco "1"
	)
)

(defun abre_arquivo_porta ()
  (setq open_file (open (strcat path "Dados/portas.txt") "r")
	tipo_porta_config (read-line open_file)
	boneca_config (read-line open_file)
	larg_porta_config (read-line open_file)
	alt_porta_config (read-line open_file)
	cota_porta_config (read-line open_file)
	arco_porta_config (read-line open_file)
	linha_porta_config (read-line open_file)
	codificar_porta (read-line open_file)
	layer_arco  (read-line open_file)
	cor_arco (read-line open_file)
	
  )
  (close open_file)
)  

(defun salva_config_portas ()
   (setq open_file (open (strcat path "Dados/portas.txt") "w"))
   (write-line tipo_porta_config open_file)
   (write-line boneca_config open_file)
   (write-line larg_porta_config open_file)
   (write-line alt_porta_config open_file)
   (write-line cota_porta_config open_file)
   (write-line arco_porta_config open_file)
   (write-line linha_porta_config open_file)
   (write-line codificar_porta open_file)
   (write-line layer_arco open_file)
   (write-line cor_arco open_file)
 
   (close open_file)
   (princ "Salvo com Sucesso")
)


(defun carrega_layers ()
  (setq lista (list (cdr (assoc 2 (tblnext "layer" t)))))
       
  (while (setq lay (tblnext "layer"))
    (setq lista 
    (cons (strcase (cdr (assoc 2 lay))) lista))
  )

  (setq lista (vl-sort lista '<))
  

)

;##################################################################################################################################

 

;#################  sele��o de layers  ############################################################################################
(defun slayer ()
 (setq lista nil
       main_cancel nil)
  
 (setq lista (list (cdr (assoc 2 (tblnext "layer" t)))))
       
 (while (setq lay (tblnext "layer"))
  (setq lista 
  (cons (strcase (cdr (assoc 2 lay))) lista))
 )
  
 (setq lista (vl-sort lista '<))
 (setq dim_pos '(-1 -1))

 (setq dcl_id (load_dialog "e:/LispsNey/Janelas.dcl"))
  
 (if (not 
  (new_dialog "seleciona_layer" dcl_id "" '(-1 -1))) (exit))

  ;load the popup_list 
 (start_list "txt_layer")
 (mapcar ' add_list lista)
 (end_list)

 (action_tile "txt_layer" "(setq l_sel $value)")

 (action_tile "accept" "(done_dialog 1)")


  ;ok e cancel
  (action_tile "accept" "(done_dialog 1)")
  (action_tile "cancel" "(done_dialog 0)")
  
  
  ;Finalizacao
  (setq valorSeleciona (start_dialog))
  (unload_dialog dcl_id)

  (if (= valorSeleciona 1) (setq layer_selecionada (nth (atoi l_sel) lista)) (setq layer_selecionada "0"))
  (princ)
 
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


;configura��es gerais lispNey##############################################################################
(defun c:ConfigLispNey ()
	(setq dcl_id (load_dialog (strcat path "Janelas.dcl")))
	(if (not (new_dialog "config_lisp" dcl_id)) (exit))

	;Verifica se o arquivo existe e carrega as variaveis
	(carrega_arquivo_config)
  
	;Setagem
	(set_tile "txtFatorEscalaTextos" fator_escala_textos)
	(action_tile "txtFatorEscalaTextos" "(setq fator_escala_textos $value)")
	
	(set_tile "txtFatorEscalaBlocos" fator_escala_blocos)
	(action_tile "txtFatorEscalaBlocos" "(setq fator_escala_blocos $value)")
	
  
	(set_tile "txtLayerParede" layer_parede)
	(action_tile "txtLayerParede" "(setq layer_parede $value)")
	
	(set_tile "txtCorParede" cor_parede)
	(action_tile "txtCorParede"  "(setq cor_parede $value)")
    
	(set_tile "txtLayerDetalhes" layer_detalhes)
	(action_tile "txtLayerDetalhes" "(setq layer_detalhes $value)")
	
	(set_tile "txtCorDetalhes" cor_detalhes)
	(action_tile "txtCorDetalhes"  "(setq cor_detalhes $value)")
 
	
  
	;ok e cancel
	(action_tile "accept" "(done_dialog 1)")
	(action_tile "cancel" "(done_dialog 0)")
  
  
	;Finalizacao
	(setq ValorConfig (start_dialog))
	(unload_dialog dcl_id)

	(if (= ValorConfig 1) (salva_arquivo_config))
	(princ)
)


(defun carrega_arquivo_config ()
  ;verifica se o arquivo existe
  (setq arquivo (findfile (strcat path "Dados/config.txt")))
  (if (= nil arquivo)
    (carrega_variaveis_config)
    (abre_arquivo_config)
   )
)

(defun carrega_variaveis_config ()
  	(setq
		fator_escala_textos "1"
		fator_escala_blocos "1"
		layer_parede "05"
		cor_parede "5"
		layer_detalhes "021"
		cor_detalhes "1"
		
	)
)

(defun abre_arquivo_config ()
  (setq open_file (open (strcat path "Dados/config.txt") "r")
	fator_escala_textos (read-line open_file)
	fator_escala_blocos (read-line open_file)
	layer_parede (read-line open_file)
	cor_parede (read-line open_file)
	layer_detalhes (read-line open_file)
	cor_detalhes (read-line open_file)

  )
  (close open_file)
)  

(defun salva_arquivo_config ()
   (setq open_file (open (strcat path "Dados/config.txt") "w"))
   (write-line fator_escala_textos open_file)
   (write-line fator_escala_blocos open_file)
   (write-line layer_parede open_file)
   (write-line cor_parede open_file)
   (write-line layer_detalhes open_file)
   (write-line cor_detalhes open_file)
    
   (close open_file)
   (princ "Salvo com Sucesso")
)

;fim caixa dialogo portas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defun C:samp5 ()					
	
	(setq siz "Parede")					;preset hole size
	(setq NAMES '("01" "02" "CLAUDINEY" "MARIA" "TESTE" "TESTE" "GABRIEL" "CLAUDIANA"));setq
	(setq dcl_id (load_dialog (strcat path "Janelas.dcl")))
 
	;test for dialog
	(if (not (new_dialog "samp5" dcl_id)) (exit))
	
	;Pega a largura e altura do Tile Imagem
	(setq w (dimx_tile "im") h (dimy_tile "im"))				
	(start_image "im")					;start the image
	(fill_image 0 0 w h 1)				;fill it with blue
	(end_image)						;end image
 
	(start_list "selections")				;start the list box
	(mapcar 'add_list NAMES)				;fill the list box
	(end_list)						;end list
 
	(action_tile "rb1" "(setq hole \"site\")")		;store hole type
	(action_tile "rb2" "(setq hole \"shop\")")		;store hole type
	(action_tile "rb3" "(setq hole \"hid\")")		;store hole type
	(action_tile "rb4" "(setq hole \"ctsk\")")		;store hole type
	(action_tile "rb5" "(setq hole \"elev\")")		;store hole type
	(action_tile "rb6" "(setq hole \"slot\")")		;store hole type
  
    (action_tile "cancel" "(done_dialog) (setq userclick nil)")		;Se o Usuario pressionar cancelar fecha janela e muda flag para nil
    
	;Se o usuario pressionar ok
	(action_tile 
			"accept"
				(strcat 
					"(progn 
						(setq SIZ (atof (get_tile \"selections\")))"
						" (done_dialog)(setq userclick T)
					)"
				)
	); Final do botao ok
 
	(start_dialog)					;start dialog
 
	(unload_dialog dcl_id)				;unload
 
	(if userclick					;check O.K. was selected
		(progn
			(setq SIZ (fix SIZ))				;convert to integer
			(setq SIZ (nth SIZ NAMES))			;get the size
		);progn
	);if userclick
 
	(princ)
)
 ;configura��es gerais lispNey##############################################################################


(defun fabr(grupo nome_biblioteca / ed dcl_id) 
	(setq x 0)
	(setq	y 0)
	(setq nome_bloco nil)
	(setq pos nil)
  
	(setq dcl_id (load_dialog (strcat path "Janelas.dcl")))
	(if (not (new_dialog "fabi" dcl_id)) (exit))
	
	(set_tile "lbl_descricao" descr_biblio)

	(start_list "grupo")
	(mapcar 'add_list grupo) 
	(end_list)
	
	(if (= nil grupo_selecionado) (setq grupo_selecionado "0"))
	(set_tile "grupo" grupo_selecionado) 
    (action_tile "grupo" "(setq grupo_selecionado $value)(listar_categorias)")

	
	(if (= nil categoria_selecionado) (setq categoria_selecionado "0"))
	(set_tile "categoria" categoria_selecionado) 
    (action_tile "categoria" "(setq categoria_selecionado $value)(listar_blocos)")  

	(action_tile "bloco" "(mostra_slide)")
	
	(start_image "img1")
	(setq x (dimx_tile "img1"))
	(setq y (dimy_tile "img1"))
	(fill_image 0 0 x y -16)
	(setq nome_bloco (nth 0 lista_blocos))
	(slide_image 0 0 x y (strcat nome_biblioteca "(" nome_bloco ")"))
	(end_image)
	
	(action_tile "accept" "(done_dialog 1)")
	(setq cx_bloco (start_dialog))
	(unload_dialog dcl_id)
)

(defun listar_categorias()
	(start_list "categoria")

		(setq txtFile (open (findfile (strcat path "Dados/" (nth (atoi grupo_selecionado) grupo) ".txt")) "r"))
		(setq lista '())
		(while (/= (setq linha (read-line txtFile)) nil)
			(setq lista (cons linha lista))
			(setq categoria (reverse lista))
		)
		(close txtFile)

		(mapcar 'add_list categoria)
	(end_list)
)


(defun listar_blocos()
	(start_list "bloco")
		
		(setq catetoria_selecionado "0")
		
		(setq txtCategoria (open (findfile (strcat path "Dados/" (nth (atoi categoria_selecionado) categoria) ".txt")) "r"))
		(setq list_categoria '())
		(while (/= (setq linha (read-line txtCategoria)) nil)
			(setq list_categoria (cons linha list_categoria))
			(setq blocos (reverse list_categoria))
		)
		(close txtCategoria)
		
		
		(mapcar 'add_list blocos)
	(end_list)
)

 
  
(defun mostra_slide() 
  (setq pos (atoi (get_tile "bloco")))
  (setq nome_bloco (nth pos blocos))
  (start_image "img1")
  (setq x (dimx_tile "img1"))
  (setq y (dimy_tile "img1"))
  (fill_image 0 0 x y -16)
  (slide_image 0 0 x y (strcat nome_biblioteca "(" nome_bloco ")"))
  (end_image)
)  

(defun insere(path nome_bloco escala)
  (setq fator_cor (* (getvar "userr1") escala))
  (if (/= fator_cor 0.0)
	
    (command "_INSERT" (strcat path "Blocos/Arquitetonico/PlantaBaixa/" nome_bloco) pause pause pause pause "")
	(command "_INSERT" (strcat path "Blocos/Arquitetonico/PlantaBaixa/" nome_bloco) pause pause pause pause "")
	
  )
  (princ)
)
  
  ;***cozinha
(defun C:BLOCOS()
  (setq descr_biblio "Blocos para Arquitetura")
  (setq nome_biblioteca "BLOCOS")
  (setq escala 1000)
  (setq grupo '("ARQUITETONICO"
				"BOMBEIROS"
				"CARIMBOS"
				"ELETRICO"
				"HIDRAULICO"
				"ESTRUTURAL"
				"TELEFONIA"
				))
						
  (fabr grupo nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***FIM_cozinha

  ;***cozinha
(defun C:ESTRUTURAL()
  (setq descr_biblio "Blocos para Projeto Estrutural")
  (setq nome_biblioteca "ESTRUTURAL")
  (setq escala 1000)
  (setq tipo '("Estacas" "Baldrame" ))
  (setq aguafria '("25mm" "50mm" ))
  (setq esgoto '("40mm" "50mm" "75mm" "100mm" "150mm" "200mm"))

  (setq lista_blocos '( "GELADEIRA"
						"FOGAO_4B"
						"FOGAO_6B"
						"CUBA_PIA"
						"ARM_2P"
						"ARM_3P"
						"ARM_4P"
						"ARM_5P"
						"ARM_6P"))
  (fabr tipo esgoto lista_blocos nome_biblioteca)
  (if (= cx_bloco 1)
    (insere path nome_bloco escala)
  )
  (princ)
)
;***FIM_cozinha

(defun c:nss()
	(setq txtFile (open (findfile (strcat path "Dados/ARQUITETONICO.txt")) "r"))
	(setq lista '())
	(while (/= (setq linha (read-line txtFile)) nil)
		(setq lista (cons linha lista))
		(setq lista2 (reverse lista));volta a lista na posi��o inicial
	)
	(close txtFile)
)


(defun c:mss (/ parse txtFile txtList pt ins)

	(vl-load-com) ;;necess�rio somente com fun��es vlax-xxx, mas mantive
	(setq txtFile (open (findfile (strcat path "Dados/ARQUITETONICO.txt")) "r"));;o caminho do seu arquivo .txt aqui
	(setq txtList '());cria uma lista vazia - pode ser (setq txtList nil)
	(setq txtList (read-line txtFile));l� a primeira linha do arquivo .txt
	(if (/= txtList nil);se tem algo escrito
		(progn
			(setq txtList (list (parse txtList ",")));divide essa linha em partes separadas, tendo como base o separador, no caso a virgula
			(while (/= (setq txtline (read-line txtFile)) nil);continua lendo at� que a leitura resulte nil
			(setq txtList (cons (parse txtline ",") txtList));adiciona as partes separadas numa lista
			)
			(close txtFile);ap�s a leitura, fecha o arquivo .txt
			(setq txtList (reverse txtList));;inverte a lista
			(foreach pt txtList ;;para cada elemento da lista
		
			


			)
		)
		(alert "\n Failed!");nesse caso, se n�o tem nada escrito na primeira linha, d� erro
	)
	(if (/= txtList nil) (princ "\n Done!"))
(princ)

)



