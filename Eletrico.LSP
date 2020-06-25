;ROTINA PARA INSERSÃO de blocos de eletrica
(defun c:lamp (/)
  (initget "1, 2, 3, 4")
  (setq Bloco (getkword "\nLampadas?: <[1]Incandescente, [2]Fluorescente, [3]Arandela, [4]Holofote> :"))

  (cond
	((= bloco "1") (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/L_LampIncandescente.dwg") pause 1 1 0 "1" "1" "A" "100"))
	((= bloco "2") (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/L_LampFluorescente.dwg") pause 1 1 pause "1" "1" "2" "A" "40"))
	((= bloco "3") (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/L_Arandela.dwg") pause 1 1 pause "1" "1" "A" "60"))
	((= bloco "4") (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/L_Holofote.dwg") pause 1 1 pause "1" "1" "A" "250"))
    )
 )


(defun c:tomadas (/)
  (initget "1, 2, 3, 4")
  (setq Bloco (getkword "\nTomadas?: <[1]Tomada Baixa, [2]Tomada Média, [3]Tomada Alta > :"))

  (cond
	((= bloco "1") (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/T_tomadabaixa.dwg") pause 1 1 pause "1" "1" "100"))
	((= bloco "2") (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/T_tomadamedia.dwg") pause 1 1 pause "1" "1" "100"))
	((= bloco "2") (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/T_tomadaalta.dwg") pause 1 1 pause "1" "1" "100"))
	(princ)
    )
)

(defun c:tomadabaixa (/)
  (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/T_tomadabaixa.dwg") pause 1 1 pause "1" "1" "100")
 )

(defun c:tomadamedia (/)
  (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/T_tomadamedia.dwg") pause 1 1 pause "1" "1" "100")
 )

(defun c:tomadaalta (/)
  (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/T_tomadaalta.dwg") pause 1 1 pause "1" "1" "100")
 )


(defun c:interruptor (/)
  (command "_attdia" "0" "_.insert" (strcat path "Blocos/Eletrico/I_Interruptor.dwg") pause 1 1 0 "1" "1" "1")
 )

(defun c:ff (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/ff.dwg") pause 1 1 pause "1" "1")
 )

(defun c:fn (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fn.dwg") pause 1 1 pause "1" "1" "")
  (princ)
  )

(defun c:fn1 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fnr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:fn2 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fnrr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:fn3 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fnrrr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:f1 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:f2 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/frr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:f3 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/frrr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:fn4 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fnrrrr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:fn5 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fnrrrrr.dwg") pause 1 1 pause "1" "1")
  )

(defun c:fn6 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/fnrrrrrr.dwg") pause 1 1 pause "1" "1")
 )

(defun c:n1 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/nr.dwg") pause 1 1 pause "1" "1")
 )

(defun c:n2 (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/nrr.dwg") pause 1 1 pause "1" "1")
 )

(defun c:arandela (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/L_arandela.dwg") pause 1 1 pause "1" "1" "A" "60")
 )

(defun c:Tchuveiro (/)
  (command "_attdia" "0" "._.insert" (strcat path "Blocos/Eletrico/T_chuveiro.dwg") pause 1 1 pause "1" "1" "5.400")
)

(defun c:portaoeletronico (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/portaoeletronico.dwg") pause 1 1 pause "1" "1")
 )

(defun c:holofote (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/L_holofote.dwg") pause 1 1 pause "1" "1")
 )

(defun c:arcondicionado (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/T_ar.dwg") pause 1 1 pause "1" "1")
 )

(defun c:qcargas (/)
  (command "._insert" (strcat path "Blocos/Eletrico/qcarga.dwg") pause 1 1 pause)
 )

(defun c:diagrama (/)
  (command "._insert" (strcat path "Blocos/Eletrico/diagrama.dwg") pause 1 1 pause)
 )

(defun c:LEGELETRICO (/)
  (command "._insert" (strcat path "Blocos/Eletrico/LEGENDAELETRICO.dwg") pause 1 1 pause)
 )

(defun c:TUBDESCE (/)
  (command "._insert" (strcat path "Blocos/Eletrico/TUBDESCE.dwg") pause 1 1 pause)
 )

(defun c:TUBSOBE (/)
  (command "._insert" (strcat path "Blocos/Eletrico/TUBSOBE.dwg") pause 1 1 pause)
)

(defun c:OBSELETRICO (/)
  (command "._insert" (strcat path "Blocos/Eletrico/OBSELETRICO.dwg") pause 1 1 pause)
)

(defun c:HIDROMASSAGEM (/)
  (command "._insert" (strcat path "Blocos/Eletrico/T_HIDRO.dwg") pause 1 1 pause)
)

(defun c:MOTORBOMBA (/)
  (command "._insert" (strcat path "Blocos/Eletrico/MB.dwg") pause 1 1 pause)
)

(defun c:QDistribuicao (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/QD.dwg") pause 1 1 pause "1" "1")
)

(defun c:QMedicao (/)
  (command "_attdia" "0" "._insert" (strcat path "Blocos/Eletrico/QM.dwg") pause 1 1 pause "1" "1")
)

;Corrige Circuitos
(defun c:cdd()
	(setq sel (ssget "ALL" '((0 . "INSERT") ) ))
	(setq tsel (sslength sel))
	(setq contador 0)

	(while (< contador tsel)
		(setq nomebloco (ssname sel contador))
		(setq lista (entget nomebloco)) 						;lista do bloco principal
		(setq lay (cdr (assoc 8 lista)))						; pega o layer
		(if (= 7 (strlen lay))
			(progn
				(setq Circuito (atoi (substr lay 6)))
				(setq circ (cdr (assoc 1 (entget (entnext (entnext nomebloco))))))
		        (setq nlista (entget (entnext (entnext nomebloco))))
				(setq ed (subst (cons 1 (itoa circuito)) (assoc 1 nlista) nlista)) ;cria lista substituindo os dados
				(entmod ed)						;salva a nova lista
			)
		)
		(setq contador (+ contador 1))
		(princ)
	)
(princ)
)

;Altera o QD
(defun c:TrocaQD()
	(setq sel (ssget '((0 . "INSERT") ) ))
	(setq tsel (sslength sel))
	(setq contador 0)

	(setq novoqd (getint "\n Digite o numero do QD <2> : "))

    (if (= nil novoqd) (setq novoqd 2))

	(while (< contador tsel)
		(setq nomebloco (ssname sel contador))
		(setq lista (entget nomebloco)) 						;lista do bloco principal
		(setq lay (cdr (assoc 8 lista)))						; pega o layer
		(if (= 7 (strlen lay))
			(progn
		        (setq nlista (entget (entnext nomebloco)))
				(setq ed (subst (cons 1 (itoa novoqd)) (assoc 1 nlista) nlista)) ;cria lista substituindo os dados
				(entmod ed)						;salva a nova lista
			)
		)
		(setq contador (+ contador 1))
		(princ)
	)
(princ)
)

(defun c:teste()

 (CollectCompProps (ssget '((0 . "INSERT") (102 . "{ACAD_REACTORS"))))
)

(defun CollectCompProps (ss)
  (vl-remove
    nil
    (mapcar
      '(lambda (enm / compHnd instHnd)
        (if (setq instHnd (KGA_Sys_InsertInstanceHandle enm))
          (progn
            (setq compHnd (bmlispget "Component" instHnd))
            (cons
              (bmlispget "InstanceName" instHnd)
              (mapcar
                '(lambda (nme)
                  (cons nme (bmlispget "ParameterValue" compHnd nme))
                )
                (bmlispget "Parameters" compHnd)
              )
            )
          )
        )
      )
      (vle-selectionset->list ss)
    )
  )
)