(defun acao (key val)
  (cond ((= key "raio") (if (> (atof val) 0)
               (setq raio val) ;valor correto
               (progn
                 (alert "Erro:\nDeve ser maior que zero!!")
                 (mode_tile "raio" 2) ;seleciona o conteudo
                )))
    ((= key "layer") (if (snvalid val) ;é um nome de layer válido?
               (setq layer val)
               (progn
                 (alert "Erro:\nDeve ser preenchido!!")
                 (mode_tile "layer" 2)
     )))
	;|acao que precisa da linha de comando, entao encerra o dcl com um valor  diferente de 0 (cancel) e 1 (ok)|;
    ((= key "botao") (done_dialog 2))
    ;((key "outras_coisas") (done_dialog 3))
    )
;altera o estado dos campos (habilitar ou nao)
  (modes)
  )

;função que (des)habilita keys
(defun modes nil
;condiciona o layer ao raio estar correto:
  (mode_tile "layer" (if raio 0 1))
;condiciona o botao ao layer
  (mode_tile "botao" (if layer 0 1))
;condiciona o botao OK ao raio, ao layer e a coordenada
  (mode_tile "accept" (if (and layer raio coord) 0 1)))

;função principal:
(defun c:circulo (/ ;veja que uso as variaveis com nomes iguais as keys:
        raio layer coord ;keys em forma de symbol
        pt ;variavel temporaria
        dcl dlg faz ;variaveis de controle do dcl
        key val ;variaveis de controle dos campos da dcl
        )
;inicia o dcl
  (setq dcl (load_dialog "C:/PastaTrabalho/Programacao/LISP/LispsNey/Testes/circulo.dcl")
    faz t);controla o looping
  
;|valores padrao, descomente a linha abaixo se preferir.
  veja que os uso em forma de string já, para facilitar o
  preenchimento dos campos do dcl|;
;(mapcar 'set '(raio layer coord) '("10" "circulo" "(5 3)"))
  
;enquanto FAZ:
  (while faz
;abre a tela do dcl:
    (new_dialog "circulo" dcl)

;|preenche o formulario e seta as ações
  na primeira execução estará tudo "zerado",
  se "valores padrao" nao forem setados|;
    (foreach key '("raio" "layer" "botao" "coord")
      (action_tile key "(acao $key $value)")
      (if (setq val (eval (read key)))
    (set_tile key val)))
    
;(des)habilita as keys:
    (modes)
    
;inicia o formulario:
    (setq dlg (start_dialog))

    (cond
;|acoes padrao, mesmo que voce nao faça action_tile para o
  botao "ok" e "cancel", eles fazem (done_dialog 1) e (done_dialog 0)
  respectivamente, em geral nao se muda isso mesmo|;
          ((= dlg 0) (alert "cancelado") (setq faz nil))
      ((= dlg 1) (alert "OK") (setq faz nil))
;|a partir daqui, vão todas as ações que dependem da linha de comando
  sao as funções get*: getpoint, getcorner, getint...|;
      ((= dlg 2) (if (setq pt (getpoint "\nEntre com um ponto"))
               (setq coord (strcat "("
                       (rtos (car pt) 2 2)
                       " "
                       (rtos (cadr pt) 2 2)
                       ")"
                       ))
               (setq coord nil)))
      ;((dlg 3) (outras_coisas))
      )
;|se foi clicado o "botao", ele pede uma coordenada e volta ao
  new_dialog, senao encerra de vez o dcl|;
    );end while

;descarrega o dcl da memoria:
  (unload_dialog dcl)
  
;única condição válida é clicar "OK", para desenhar o círculo:
  (if (= dlg 1)
    (entmake (list '(0 . "CIRCLE")
           (cons 10 (read coord))
           (cons 8 layer)
           (cons 40 (atof raio)))))
  (princ)
  )