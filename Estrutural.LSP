
;(setq path "e:/LispsNey/")


;ESTRUTUAL
(defun c:configestaca()

	(setq n_estaca (getstring "\n Nome da Estaca <E1>: "))
	(setq d_estaca (getreal "\n Diametro da Estaca <0.20>: "))
	(setq p_estaca (getreal "\n Profundidade: <6.00>: "))
	(setq f_estaca (getstring "\n Ferragem da Estaca <5/16>: "))
	(setq q_estaca (getint "\n Quantidade de Ferro: <4>: "))
	(setq f_estribo_estaca (getstring "\n Ferragem Estribo <4.2mm>: "))
	(setq espaco_estribo_estaca (getreal "\n Espaçamento dos Estrivos <0.25>: "))
	(if (= "" nomeestaca) (setq nomeestaca "E1"))
	(if (= nil d_estaca) (setq d_estaca 0.20))
	(if (= nil p_estaca) (setq p_estaca 6.00))
	(if (= "" f_estaca) (setq f_estaca "5/16"))
	(if (= nil q_estaca) (setq q_estaca 6))
	(if (= "" f_estribo_estaca) (setq f_estribo_estaca "4.2mm"))
	(if (= nil espaco_estribo_estaca) (setq espaco_estribo_estaca 0.25))
	(princ)
)

(defun c:Estaca (/)
    (guarda_status)
	(initget "1, 2, 3")
	
	(setq tipo (getkword "\n Digite numero de Pontos para inserir a estaca?: <1, 2, 3>: ?"))
	
	(cond
		((= tipo "1")
			(setq pinsert (getpoint "\n Selecione o ponto central da Estaca"))
		)
		
		((= tipo "2")
			(setq p1 (getpoint "\n Selecione o Canto 01"))
			(setq p2 (getpoint p1 "\n Selecione o Canto 2"))
			(setq pinsert (polar p1 (angle p1 p2) (/ (distance p1 p2) 2)))  
			(devolve_status)
		)
		
		((= tipo "3")
			(setq p1 (getpoint "\n Selecione o Canto 01"))
			(setq p2 (getpoint p1 "\n Selecione o Canto 2"))
			(setvar "osmode" 128)
			(setq p3 (getpoint p2 "\n Selecione o outro lado da Parede"))
			(setq pinsert (polar p1 (angle p1 p3) (/ (distance p1 p3) 2)))  
			(devolve_status)
		)
	
	)
	
  
  (command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/Estaca.dwg") "_non" pinsert 1 1 0 n_estaca d_estaca p_estaca f_estaca q_estaca f_estribo_estaca espaco_estribo_estaca)
  (princ)
)

(defun c:Coluna (/)
  (guarda_status)
  (command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/Coluna.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:vb1()
	(setq largura (getreal "\n Largura da viga: <0.15> "))
	(if (= nil largura) (setq largura 0.15))
	(setq altura (getreal "\n Altura da viga: <0.30> "))
	(if (= nil altura) (setq altura 0.30))
	(while 
		(guarda_status)
		(setvar "osmode" 1)
		(setq p1 (getpoint "\n Selecione o ponto inicial da Viga: "))
		(setq p2 (getpoint p1 "\n Selecione o ponto final da Viga: "))
		(setq pcota (polar p1 (angle p1 p2) (/ (distance p1 p2) 2)))
		(setvar "osmode" 128)
		(setq p3 (polar pcota (- (angle p1 p2) (/ pi 2)) largura))
		(setq comprimento (distance p1 p2))
		(setq angulo (- (* (angle pcota p3) (/ 180 pi)) 90))	
		(setq angulo2 angulo)
		(if (and (> angulo 90) (< angulo 270))
			(setq angulo2 (+ angulo 180))
		)
		(if (= angulo -90.0)
			(setq angulo2 90)
		)
		(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaBaldrame.dwg") "_non" pcota 1 1 angulo2 "VB1" (rtos comprimento 2 2) (rtos largura 2 2) (rtos altura 2 2) "5/16" "4" "4.2mm" "0.25" "")
		(princ)
		(devolve_status)
	)
)

(defun c:vr1()
	(setq largura (getreal "\n Largura da viga: <0.15> "))
	(if (= nil largura) (setq largura 0.15))
	(setq altura (getreal "\n Altura da viga: <0.30> "))
	(if (= nil altura) (setq altura 0.30))
	(while 
		(guarda_status)
		(setvar "osmode" 1)
		(setq p1 (getpoint "\n Selecione o ponto inicial da Viga: "))
		(setq p2 (getpoint p1 "\n Selecione o ponto final da Viga: "))
		(setq pcota (polar p1 (angle p1 p2) (/ (distance p1 p2) 2)))
		(setvar "osmode" 128)
		(setq p3 (polar pcota (- (angle p1 p2) (/ pi 2)) largura))
		(setq comprimento (distance p1 p2))
		(setq angulo (- (* (angle pcota p3) (/ 180 pi)) 90))	
		(setq angulo2 angulo)
		(if (and (> angulo 90) (< angulo 270))
			(setq angulo2 (+ angulo 180))
		)
		(if (= angulo -90.0)
			(setq angulo2 90)
		)
		(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaRespaldo.dwg") "_non" pcota 1 1 angulo2 "VR1" (rtos comprimento 2 2) (rtos largura 2 2) (rtos altura 2 2) "5/16" "4" "4.2mm" "0.25" "")
		(princ)
		(devolve_status)
	)
)


(defun c:Trilho (/)
  (command ".insert" (strcat path "Blocos/Estrutural/Trilho.dwg") pause 1 1 pause)
  (princ)
 )


(defun c:tbloco ()

;Seleciona todos blocos
(setq sel (ssget "ALL" '((0 . "INSERT")) ))

(setq tsel (sslength sel))

(princ tsel)

(setq nome (ssname sel 0))     ;descobre o entity-name
(setq elemento nome)     ;passa-se o entity-name a uma variável de carga

(setq elemento (entnext elemento))     ;carrega-se o 1º atrib da lista ("HI")
(setq lista1 (list (cdr (assoc 2 (entget elemento))) (cdr (assoc 1 (entget elemento)))))

(setq elemento (entnext elemento))     ;carrega-se o 2º atrib da lista ("LW")
(setq lista2 (list (cdr (assoc 2 (entget elemento))) (cdr (assoc 1 (entget elemento)))))

(setq elemento (entnext elemento))     ;carrega-se o 2º atrib da lista ("LW")
(setq elemento (entnext elemento))     ;carrega-se o 2º atrib da lista ("LW")
(setq lista3 (list (cdr (assoc 2 (entget elemento))) (cdr (assoc 1 (entget elemento)))))

(setq elemento (entnext elemento))     ;carrega-se o 2º atrib da lista ("LW")
(setq lista4 (list (cdr (assoc 2 (entget elemento))) (cdr (assoc 1 (entget elemento)))))

(setq estacas (list lista1 lista2 lista3 lista4))
(setq estacas (append '("ESTACAS") estacas))


)

;COMANDO NAO ACABADO ESTRUTURAL
(defun c:blocos_estrutural ()

   (setq p1 (getpoint "\n Especifique o ponto para inserir a legenda: "))
	(command "._text"  "J" "c" "_non" p1 0.15 0 "NOME")
	(command "._text"  "J" "c" "_non" (polar p1 0 0.90) 0.15 0 "FERRO")
	(command "._text"  "J" "c" "_non" (polar p1 0 2.00) 0.15 0 "QTD")
	(command "._text"  "J" "c" "_non" (polar p1 0 3.30) 0.15 0 "PROFUND.")
	(command "._text"  "J" "c" "_non" (polar p1 0 4.50) 0.15 0 "ESTRIVO")
   
   (setq p2 (polar p1 4.71159 0.25))

	;Seleciona todos blocos
	(setq sel (ssget "ALL" '((0 . "INSERT") ) ))

	;pega o tamanho da selecao
	(setq tsel (sslength sel))

	;cria um contador para o loop
	(setq contador 0)
	(setq qtdbloco 0)
	(setq QtdEstaca 0)
		
	
	;loop
	(while (< contador tsel)
	    
		(setq nomebloco (ssname sel contador))
		(setq lista (entget nomebloco))
		
		(if (= "Estaca" (cdr (assoc 2 lista)))
			(progn
			
			
			
			(setq QtdEstaca (+ QtdEstaca 1))
			
			;NOME DO BLOCO
			(command "._text"  "J" "c" "_non" p2 0.15 0 (strcase (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext nomebloco))))) )))))
			
			;FERRAGEM
			(command "._text"  "J" "c" "_non" (polar p2 0 0.90) 0.15 0 (cdr (assoc 1 (entget (entnext (entnext (entnext nomebloco)))))))
			
			;QUANTIDADE
			(command "._text"  "J" "c" "_non" (polar p2 0 2.00) 0.15 0 (atof (cdr (assoc 1 (entget (entnext (entnext nomebloco)))))))
			
			;PROFUNDIDADE
			(command "._text"  "J" "c" "_non" (polar p2 0 3.30) 0.15 0 (rtos (atof (cdr (assoc 1 (entget (entnext nomebloco))))) 2 2))
			
			;ESTRIBOS
			(command "._text"  "J" "c" "_non" (polar p2 0 4.50) 0.15 0 (rtos (atof (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext nomebloco)))))))) 2 2))
						
			
			(setq p2 (polar p2 4.71159 0.25))
			
			
			)
		)
		
		(setq contador (+ contador 1))
		(princ)
	)

)

(defun c:CriaEstac ()
	(prompt "\n Selecione as estacas: ")
	(setq sel (ssget '((0 . "INSERT") (2 . "Estaca"))))
	;cria um contador para o loop
	(setq contador 0)
	(setq listaestacas (list))
	;loop
	(while (< contador (sslength sel))
	    (setq nomebloco (ssname sel contador))
		(setq bloco (strcase (cdr (assoc 1 (entget (entnext nomebloco)))))) 
		(setq bloco (vl-string-subst "" "E" bloco))
		(setq listaestacas (cons (atoi bloco) listaestacas))
		(setq contador (+ contador 1))
	)
    ;ordena ordem decrescente	 
	(setq listaestacas (vl-Sort listaestacas '(lambda (x y) (>= x y))))
	(setq contador 0)
	(setq novalista (list))
     ;monta novamente a lista com os Itens em ordem
	(while (< contador (length listaestacas))
	   (setq novalista (cons (strcat "E"  (itoa (nth contador listaestacas))) novalista))
	   (setq contador (+ contador 1))
	)
	;Variaveis
	(setq qtd 0)
	(setq nome nil)
	(setq bitola nil)
	(setq qtdferro nil)
	(setq profundidade nil)
	(setq diametro nil)
	(setq ferroestrivo nil)
	(setq distestrivo nil)
	(setq qtdbarras nil)

   (guarda_status)

    (crl "legendas" 7)
    
	(setvar "clayer" "legendas")

	(setq p1 (getpoint "\n Especifique o ponto para inserir a legenda: "))
	(command "._text"  "J" "c" "_non" p1 0.15 0 "Estaca")
	(command "._text"  "J" "C" "_non" (polar p1 0 0.80) 0.15 0 "QTD")
	(command "._text"  "J" "l" "_non" (polar p1 0 1.50) 0.15 0 "Bitola")
	(command "._text"  "J" "c" "_non" (polar p1 0 2.70) 0.15 0 "Qtd Ferro")
	(command "._text"  "J" "c" "_non" (polar p1 0 3.80) 0.15 0 "Diam.")
	(command "._text"  "J" "c" "_non" (polar p1 0 4.70) 0.15 0 "Prof.")
	(command "._text"  "J" "l" "_non" (polar p1 0 5.50) 0.15 0 "Estrivo / Dist")
	(command "._text"  "J" "l" "_non" (polar p1 0 7.80) 0.15 0 "Total")

    (command "_line" "_non" (polar (polar p1 0 -0.50) 4.71159 0.03) "_non" (polar (polar p1 0 9.00) 4.71159 0.03) "")

	(setq p2 (polar p1 4.71159 0.25))
	
	(setq pinicial (polar (polar p1 0 -0.50) 4.71159 0.03) )


	(setq cont1 0)
	
	(while (< cont1 (length novalista))
		(setq posicao_atual (nth cont1 novalista))
		(setq nome posicao_atual)
		(setq cont2 0)
		(setq qtd 0)
		(while (< cont2 (sslength sel))
			(setq nomebloco (ssname sel cont2))
			(if (= (cdr (assoc 1 (entget (entnext nomebloco)))) posicao_atual)
				(progn
				(setq bitola (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext nomebloco))))))))
				(setq profundidade (cdr (assoc 1 (entget (entnext (entnext (entnext nomebloco)))))))
				(setq diametro (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
				(setq qtdferro (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext nomebloco)))))))))
				(setq distestrivo (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext (entnext (entnext nomebloco)))))))))))
				(setq ferroestrivo (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext (entnext nomebloco))))))))))
				(setq qtd (+ qtd 1))
				)
			)
			(setq cont2 (+ cont2 1))
		)
		(setq qtdbarras (/ (* qtd (atof profundidade) (atof qtdferro)) 12))
		(command "._text"  "J" "l" "_non" p2 0.15 0 (strcase nome))
		(command "._text"  "J" "c" "_non" (polar p2 0 0.80) 0.15 0 qtd)
		(command "._text"  "J" "l" "_non" (polar p2 0 1.50) 0.15 0 bitola)
		(command "._text"  "J" "c" "_non" (polar p2 0 2.70) 0.15 0 qtdferro )
		(command "._text"  "J" "r" "_non" (polar p2 0 4.00) 0.15 0 diametro)
		(command "._text"  "J" "r" "_non" (polar p2 0 4.90) 0.15 0 profundidade)
		(command "._text"  "J" "l" "_non" (polar p2 0 5.50) 0.15 0 ferroestrivo)
		(command "._text"  "J" "r" "_non" (polar p2 0 6.70) 0.15 0 distestrivo)
		(command "._text"  "J" "r" "_non" (polar p2 0 8.70) 0.15 0 (strcat (rtos qtdbarras 2 0) " Barras"))
		(command "_line" "_non" (polar (polar p2 0 -0.50) 4.71159 0.03) "_non" (polar (polar p2 0 9.00) 4.71159 0.03) "")
		(setq pfinal (polar (polar p2 0 9.00) 4.71159 0.03))		
		(setq cont1 (+ cont1 1))
		(setq p2 (polar p2 4.71159 0.25))		
	)
	(command "_rectang" "non" pinicial "non" pfinal "")
	(princ)
)


(defun c:CriaColunas ()
	;Seleciona todos blocos
	(prompt "\n Selecione as Colunas: ")
	(setq sel (ssget '((0 . "INSERT") (2 . "Coluna"))))
	;cria um contador para o loop
	(setq contador 0)
	(setq listaestacas (list))
	;loop
	(while (< contador (sslength sel))
	    (setq nomebloco (ssname sel contador))
		(setq bloco (strcase (cdr (assoc 1 (entget (entnext nomebloco)))))) 
		(setq bloco (vl-string-subst "" "C" bloco))
		(setq listaestacas (cons (atoi bloco) listaestacas))
		(setq contador (+ contador 1))
	)
    ;ordena ordem decrescente	 
	(setq listaestacas (vl-Sort listaestacas '(lambda (x y) (>= x y))))
	(setq contador 0)
	(setq novalista (list))
     ;monta novamente a lista com os Itens em ordem
	(while (< contador (length listaestacas))
	   (setq novalista (cons (strcat "C"  (itoa (nth contador listaestacas))) novalista))
	   (setq contador (+ contador 1))
	)
	
	;Variaveis
	(setq qtd 0)
	(setq nome nil)
	(setq bitola nil)
	(setq qtdferro nil)
	(setq altura nil)
	(setq lado1 nil)
	(setq lado2 nil)
	(setq ferroestrivo nil)
	(setq distestrivo nil)
	(setq qtdbarras nil)

   (guarda_status)

    (crl "legendas" 7)
    
	(setvar "clayer" "legendas")

	(setq p1 (getpoint "\n Especifique o ponto para inserir a legenda: "))
	(command "._text"  "J" "c" "_non" p1 0.15 0 "Coluna")
	(command "._text"  "J" "C" "_non" (polar p1 0 0.80) 0.15 0 "QTD")
	(command "._text"  "J" "l" "_non" (polar p1 0 1.50) 0.15 0 "Ferro")
	(command "._text"  "J" "c" "_non" (polar p1 0 3.80) 0.15 0 "Dimensões")
	(command "._text"  "J" "l" "_non" (polar p1 0 5.50) 0.15 0 "Estrivo / Dist")
	(command "._text"  "J" "l" "_non" (polar p1 0 7.80) 0.15 0 "Total")

    (command "_line" "_non" (polar (polar p1 0 -0.50) 4.71159 0.03) "_non" (polar (polar p1 0 9.00) 4.71159 0.03) "")

	(setq p2 (polar p1 4.71159 0.25))
	
	(setq pinicial (polar (polar p1 0 -0.50) 4.71159 0.03) )


	(setq cont1 0)
	
	(while (< cont1 (length novalista))
		(setq posicao_atual (nth cont1 novalista))
		(setq nome posicao_atual)
		(setq cont2 0)
		(setq qtd 0)
		(while (< cont2 (sslength sel))
			(setq nomebloco (ssname sel cont2))
			(if (= (cdr (assoc 1 (entget (entnext nomebloco)))) posicao_atual)
				(progn
				(setq bitola (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext nomebloco)))))))))
				(setq altura (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext nomebloco))))))))
				(setq lado1 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
				(setq lado2 (cdr (assoc 1 (entget (entnext (entnext (entnext nomebloco)))))))
				(setq qtdferro (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext (entnext nomebloco))))))))))
				(setq distestrivo (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext (entnext (entnext (entnext nomebloco))))))))))))
				(setq ferroestrivo (cdr (assoc 1 (entget (entnext (entnext (entnext (entnext (entnext (entnext (entnext nomebloco)))))))))))
				(setq qtd (+ qtd 1))
				)
			)
			(setq cont2 (+ cont2 1))
		)
		(setq qtdbarras (/ (* qtd (atof altura) (atof qtdferro)) 12))
		
		(command "._text"  "J" "l" "_non" p2 0.15 0 (strcase nome))
		(command "._text"  "J" "c" "_non" (polar p2 0 0.80) 0.15 0 qtd)
		(command "._text"  "J" "l" "_non" (polar p2 0 1.50) 0.15 0 (strcat qtdferro " x " bitola))
		(command "._text"  "J" "r" "_non" (polar p2 0 4.50) 0.15 0 (strcat lado1 " x " lado2 " x " altura))
		(command "._text"  "J" "l" "_non" (polar p2 0 5.50) 0.15 0 (strcat ferroestrivo " / " distestrivo))
		(command "._text"  "J" "r" "_non" (polar p2 0 8.70) 0.15 0 (strcat (rtos qtdbarras 2 0) " Barras"))
		(command "_line" "_non" (polar (polar p2 0 -0.50) 4.71159 0.03) "_non" (polar (polar p2 0 9.00) 4.71159 0.03) "")
		(setq pfinal (polar (polar p2 0 9.00) 4.71159 0.03))		
		(setq cont1 (+ cont1 1))
		(setq p2 (polar p2 4.71159 0.25))		
	)
	(command "_rectang" "non" pinicial "non" pfinal "")
	(princ)
)


(defun c:scolunas()
	(guarda_status)
    (crl "021" 1)
	(setvar "clayer" "021")
	(setq sel (ssget '((0 . "INSERT") (2 . "Estaca"))))
	(setq contador 0)
    (while (< contador (sslength sel))
		(setq nomebloco (ssname sel contador))
		(setq ponto (cdr (assoc 10 (entget nomebloco))))
		(setq titulo (cdr (assoc 1 (entget (entnext nomebloco)))))
		
		(setq titulo (vl-string-subst "C" "E" titulo))		
		
		(entdel nomebloco)
		(command "_attdia" "0" "_.insert" (strcat path "Blocos/Estrutural/Coluna.dwg") "_non" ponto "1" "1" 0 titulo "0.10" "0.10"  "3.00" "5/16" "4" "4.2mm" "0.25" "_attdia" "1")
		(setq contador (+ contador 1))
	)
	(devolve_status)
)


(defun c:ColunaSegue_ColunaPara()
	(guarda_status)
    (crl "021" 1)
	(setvar "clayer" "021")
	(setq sel (ssget '((0 . "INSERT") (2 . "Coluna"))))
	(setq contador 0)
    (while (< contador (sslength sel))
		(setq nomebloco (ssname sel contador))
		(setq ponto (cdr (assoc 10 (entget nomebloco))))
		(setq titulo (cdr (assoc 1 (entget (entnext nomebloco)))))
		
		(setq titulo (vl-string-subst "C" "E" titulo))		
		
		(entdel nomebloco)
		(command "_attdia" "0" "_.insert" (strcat path "Blocos/Estrutural/Coluna_Para.dwg") "_non" ponto "1" "1" 0 titulo "0.10" "0.10"  "3.00" "5/16" "4" "4.2mm" "0.25" "_attdia" "1")
		(setq contador (+ contador 1))
	)
	(devolve_status)
)

(defun c:ColunaPara_ColunaSegue()
	(guarda_status)
    (crl "021" 1)
	(setvar "clayer" "021")
	(setq sel (ssget '((0 . "INSERT") (2 . "Coluna_Para"))))
	(setq contador 0)
    (while (< contador (sslength sel))
		(setq nomebloco (ssname sel contador))
		(setq ponto (cdr (assoc 10 (entget nomebloco))))
		(setq titulo (cdr (assoc 1 (entget (entnext nomebloco)))))
		
		(setq titulo (vl-string-subst "C" "E" titulo))		
		
		(entdel nomebloco)
		(command "_attdia" "0" "_.insert" (strcat path "Blocos/Estrutural/Coluna.dwg") "_non" ponto "1" "1" 0 titulo "0.10" "0.10"  "3.00" "5/16" "4" "4.2mm" "0.25" "_attdia" "1")
		(setq contador (+ contador 1))
	)
	(devolve_status)
)

(defun c:TrocaVbVr()
	(guarda_status)
    (crl "021" 1)
	(setvar "clayer" "021")
	(setq sel (ssget '((0 . "INSERT") (2 . "VigaBaldrame"))))
	(setq contador 0)
    (while (< contador (sslength sel))
		(setq nomebloco (ssname sel contador))
		(setq ponto (cdr (assoc 10 (entget nomebloco))))
		(setq titulo (cdr (assoc 1 (entget (entnext nomebloco)))))
		(setq comprimento (cdr (assoc 1 (entget (entnext(entnext nomebloco))))))
		
		(setq titulo (vl-string-subst "VR" "VB" titulo))		
		
		(setq angulo (cdr (assoc 50 (entget nomebloco))))
		
		
		(setq angulo2 (* angulo (/ 180 pi)))	
		
		
		(entdel nomebloco)

		(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaRespaldo.dwg") "_non" ponto 1 1 angulo2 titulo comprimento "0.10" "0.30" "5/16" "4" "4.2mm" "0.25" "")
		
		
		(setq contador (+ contador 1))
	)
	(devolve_status)
)

(defun c:TrocaVrVs()
	(guarda_status)
    (crl "021" 1)
	(setvar "clayer" "021")
	(setq sel (ssget '((0 . "INSERT") (2 . "VigaRespaldo"))))
	(setq contador 0)
    (while (< contador (sslength sel))
		(setq nomebloco (ssname sel contador))
		(setq ponto (cdr (assoc 10 (entget nomebloco))))
		(setq titulo (cdr (assoc 1 (entget (entnext nomebloco)))))
		(setq comprimento (cdr (assoc 1 (entget (entnext(entnext nomebloco))))))
		
		(setq titulo (vl-string-subst "VS" "VR" titulo))		
		
		(setq angulo (cdr (assoc 50 (entget nomebloco))))
		
		
		(setq angulo2 (* angulo (/ 180 pi)))	
		
		
		(entdel nomebloco)

		(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaSuspensa.dwg") "_non" ponto 1 1 angulo2 titulo comprimento "0.10" "0.30" "5/16" "4" "4.2mm" "0.25" "")
		
		
		(setq contador (+ contador 1))
	)
	(devolve_status)
)

(defun c:nEstacas()
(setq ninicial (getint "\Informe a sequencia Inicial da Estaca"))
(if (= nil ninicial) (setq ninicial 1))

   (while
		(setq estaca (car (nentsel "\n Seleciona o texto da Estaca")))
		(setq textosel (entget estaca))
		(setq ed (subst (cons 1 (strcat "E" (rtos ninicial 2 0))) (assoc 1 textosel) textosel))
		(entmod ed)		
		(setq ninicial (+ ninicial 1))
		(princ)
   )
   (princ)
)

;Numera Blocos
(defun c:nBlocos()
(setq letra (getstring "\Informe o prefixo: "))
(setq ninicial (getint "\Informe a sequencia Inicial da Coluna: "))

(if (= nil ninicial) (setq ninicial 1))

   (while
		(setq estaca (car (nentsel "\n Seleciona o texto da Estaca")))
		(setq textosel (entget estaca))
		
		(setq ed (subst (cons 1 (strcat letra (rtos ninicial 2 0))) (assoc 1 textosel) textosel))
		
		(entmod ed)		
		(setq ninicial (+ ninicial 1))
		(princ)
   )
   (princ)
)


(defun c:vb ()

    (prompt "\n Selecione as Colunas para gerar as Vigas Baldrames")
	(setq sel (ssget '((0 . "INSERT") (2 . "Estaca"))))

	(if (> (sslength sel) 2) (alert "Selecione apenas duas colunas"))
	
	(if (> (sslength sel) 2) (exit))
    
	(setq nomebloco (ssname sel 1))
	(setq p1 (cdr (assoc 10 (entget nomebloco))))
	(setq largura1 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))

	(setq nomebloco (ssname sel 0))
	(setq p2 (cdr (assoc 10 (entget nomebloco))))
	(setq largura2 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
	 	
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))	
	
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(setq p4 (polar p3 dir2 (distof largura1)))
	
	(setq comprimento (distance p1 p2))
    (setq angulo (- (* (angle p3 p4) (/ 180 pi)) 90))	
	
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)

	(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaBaldrame.dwg") "_non" p3 1 1 angulo2 "VB1" (rtos comprimento 2 2) "0.15" "0.30" "5/16" "4" "4.2mm" "0.25" "")
	(princ)


)

(defun c:vbColunas()
    (prompt "\n Selecione as Colunas para gerar as Vigas Baldrames")
	(setq sel (ssget '((0 . "INSERT") (2 . "Coluna"))))
	(if (> (sslength sel) 2) (alert "Selecione apenas duas colunas"))
    (if (> (sslength sel) 2) (exit))
	(setq nomebloco (ssname sel 1))
	(setq p1 (cdr (assoc 10 (entget nomebloco))))
	(setq largura1 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
	(setq nomebloco (ssname sel 0))
	(setq p2 (cdr (assoc 10 (entget nomebloco))))
	(setq largura2 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))	
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	(setq p4 (polar p3 dir2 (distof largura1)))
	(setq comprimento (distance p1 p2))
    (setq angulo (- (* (angle p3 p4) (/ 180 pi)) 90))	
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)

	(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaBaldrame.dwg") "_non" p3 1 1 angulo2 "VB1" (rtos comprimento 2 2) "0.15" "0.30" "5/16" "4" "4.2mm" "0.25" "")
	(princ)
)

(defun c:lcolunas ()
	(guarda_status)
	(crl "Parede" 252)
	(setvar "clayer" "Parede")
    (prompt "\n Selecione as Colunas: ")
	(setq sel (ssget '((0 . "INSERT") (2 . "Coluna"))))
	(if (> (sslength sel) 2) (alert "Selecione apenas duas colunas"))
	(if (> (sslength sel) 2) (exit))
	(setq nomebloco (ssname sel 1))
	(setq p1 (cdr (assoc 10 (entget nomebloco))))
	(setq largura1 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
	(setq layer (cdr (assoc 8 (entget (entnext nomebloco)))))
	(setq nomebloco (ssname sel 0))
	(setq p2 (cdr (assoc 10 (entget nomebloco))))
	(setq largura2 (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))	
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	(setq p4 (polar p3 dir2 (distof largura1)))
	(setq comprimento (distance p1 p2))
    (setq angulo (- (* (angle p3 p4) (/ 180 pi)) 90))	
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(setq larg (distof largura1))
	(setq p6 (polar p1 dir (/ larg 2 )))
	(setq p7 (polar p2 dir (* (/ larg 2) -1)))
	(setq p8 (polar p6 dir2 (/ larg 2)))
	(setq p9 (polar p7 dir2 (/ larg 2)))
	(setq p10 (polar p6 dir2 (* (/ larg 2) -1)))
	(setq p11 (polar p7 dir2 (* (/ larg 2) -1)))
	(command "_line" "_non" p8 "_non" p9 "")
	(command "_line" "_non" p10 "_non" p11 "")
	(setvar "clayer" layer)
	(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaBaldrame.dwg") "_non" p3 1 1 angulo2 "VB1" (rtos comprimento 2 2) "0.15" "0.30" "5/16" "4" "4.2mm" "0.25" "")
	(princ)
	(devolve_status)
)

(defun c:atb()
   (setq e1 (car (entsel)))
    (while (/= "SEQEND" (cdr (assoc 0 (setq proxima (entget (setq e1 (entnext e1)))))))
		(if (= "ATTRIB" (cdr (assoc 0 proxima)))
			(progn
				(if (= "QD" (cdr (assoc 2 proxima))) (setq qd (cdr (assoc 1 proxima))))
				(if (= "CIRC" (cdr (assoc 2 proxima))) (setq circ (cdr (assoc 1 proxima))))
			)
		)
   )
 )