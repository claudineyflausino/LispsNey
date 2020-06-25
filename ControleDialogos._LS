;controle e açoes de janelas autolisp

;Configuracao de Portas..........................................................

(defun c:ptConfig () (cfpt))


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

  (set_tile "ch_Codificar" codificar_porta)
  (action_tile "ch_Codificar" "(setq codificar_porta $value)")


  (set_tile "txtLayerParede" layer_parede)
  (action_tile "txtLayerParede" "(setq layer_parede $value)")

  (set_tile "txtLayerArco" layer_arco)
  (action_tile "txtLayerArco" "(setq layer_arco $value)")

  (set_tile "txtCorParede" cor_parede)
  (action_tile "txtCorParede" "(setq cor_parede $value)")

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
		codificar_porta "1"
  		layer_parede "05"
  		layer_arco "021"
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
	codificar_porta (read-line open_file)
	layer_parede (read-line open_file)
	layer_arco  (read-line open_file)
	cor_parede (read-line open_file)
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
   (write-line codificar_porta open_file)
   (write-line layer_parede open_file)
   (write-line layer_arco open_file)
   (write-line cor_parede open_file)
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

;fim caixa dialogo portas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 

; seleção de layers
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

;fim caixa dialogo portas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;configurações gerais lispNey
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

  (set_tile "ch_Codificar" codificar_porta)
  (action_tile "ch_Codificar" "(setq codificar_porta $value)")


  (set_tile "txtLayerParede" layer_parede)
  (action_tile "txtLayerParede" "(setq layer_parede $value)")

  (set_tile "txtLayerArco" layer_arco)
  (action_tile "txtLayerArco" "(setq layer_arco $value)")

  (set_tile "txtCorParede" cor_parede)
  (action_tile "txtCorParede" "(setq cor_parede $value)")

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
		codificar_porta "1"
  		layer_parede "05"
  		layer_arco "021"
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
	codificar_porta (read-line open_file)
	layer_parede (read-line open_file)
	layer_arco  (read-line open_file)
	cor_parede (read-line open_file)
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
   (write-line codificar_porta open_file)
   (write-line layer_parede open_file)
   (write-line layer_arco open_file)
   (write-line cor_parede open_file)
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

;fim caixa dialogo portas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;