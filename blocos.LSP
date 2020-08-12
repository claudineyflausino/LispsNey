
;(setq path "e:/LispsNey/")


;Layers e Cotas Padrao Claudiney bloco contem informações de texto e algumas layers
(command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/LayersCotasPadrao.dwg") 0.0 1 1 0)
(command "_erase" "l" "")
(setvar "clayer" "05")

(command "_dimstyle" "r" "PLANTA BAIXA")

; blocos bombeiro
(defun c:s3 (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Bombeiros/s3.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:s2 (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Bombeiros/s2.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:s1 (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Bombeiros/s1.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:s8 (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Bombeiros/s8.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:s10 (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Bombeiros/s10.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

;blocos arquitetonico

(defun c:chuveiro (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Arquitetonico/Banheiro/chuveiro.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:nivelcorte (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/CotaNivelCorte.dwg") pause 1 1 pause)
  (devolve_status)
  (princ)
)

(defun c:cotanivel (/)
  (guarda_status)
  (setvar "osmode" 567)
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/CotaNivelPlantaBaixa.dwg") pause 1 1 0)
  (devolve_status)
  (princ)
)


(defun c:beiralmadeira (/)
  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/BeiralMadeira.dwg") pause 1 1 pause)
  (princ)
)

(defun c:EstacaCorte (/)
  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/EstacaCorte.dwg") pause 1 1 pause)
  (princ)
)



(defun pendural (p1 p2 / )
  
  (setq dir (angle p1 p2))

  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/cumeeira.dwg") "_non" p1 1 1 p	2)

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

  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/cumeeira.dwg") "_non" p1 1 1 p2)

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
  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/terca.dwg") pause 1 1 pause)
  (princ)
)


(defun c:BaldramesEstacas (/)
  (command "._insert" (strcat path "Blocos/Arquitetonico/Cortes/BaldramesEstacas.dwg") pause 1 1 0 "._explode" "l")
  (princ)
  )

(defun c:NomeAmbiente (/)
  (setq p1 (getpoint "\n Selecione o ponto de inserção do Texto"))
  
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/NomeComodo.dwg") p1 1 1 0 "._explode" "l")

  (command "_textedit" "l" "")
  
  
  (princ)
)


(defun c:NomeDesenho (/)
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/NomeDesenho.dwg") pause 1 1 0 "Escala 1:75" "PLANTA BAIXA")
  (command "._BURST" "l")
  (princ)
)


;PORTAS E JANELAS........................................................................
(princ)
(defun c:JH (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/JH.dwg") pause pause pause pause)
  )
(princ)
(defun c:JV (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/JV.dwg") pause pause pause pause)
  )
(princ)


;BANHEIRO ................................................................................
(defun c:PIA (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/PIA.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:PiaFrente (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/PiaFrente.dwg") pause 1 1 pause)
  (princ)
 )


(defun c:PIA2 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/PIA2.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:PIA3 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/PIA3.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:VASO (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/VASO.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:VasoFrente (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/VasoFrente.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:VasoLado (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/VasoLado.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:Bide (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Banheiro/Bide.dwg") pause 1 1 pause)
  (princ)
 )

;QUARTO
(defun c:CamaCasal1 (/)
	(command ".insert" (strcat path "Blocos/Arquitetonico/Quarto/CamaCasal1.dwg") pause 1 1 pause)
	(princ)
 )
 
 (defun c:CamaCasal2 (/)
	(command ".insert" (strcat path "Blocos/Arquitetonico/Quarto/CamaCasal2.dwg") pause 1 1 pause)
	(princ)
 )
 
 (defun c:CamaSolteiro (/)
	(command ".insert" (strcat path "Blocos/Arquitetonico/Quarto/CamaSolteiro.dwg") pause 1 1 pause)
	(princ)
 )

 (defun c:Escrivaninha (/)
	(command ".insert" (strcat path "Blocos/Arquitetonico/Quarto/Escrivaninha.dwg") pause 1 1 pause)
	(princ)
 )

;COZINHA..................................................................................
(defun c:Banqueta1 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/Banqueta1.dwg") pause 1 1 pause)
 (princ)
 
 )

(defun c:CubaPia (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/CUBA_PIA.dwg") pause 1 1 pause)
 (princ)
 
 )

(defun c:MesaMadeira (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/Mesa_Madeira.dwg") pause 1 1 pause)
 (princ)
 
 )

(defun c:Mesa4C (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/Mesa4C.dwg") pause 1 1 pause)
  (princ)
 )
(defun c:Mesa6c ()
	(command "_.insert" (strcat path "Blocos/Arquitetonico/Cozinha/Mesa6C.dwg") pause 1 1 pause)
	(princ)
)

(defun c:FOGAO4B (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/FOGAO_4B.dwg") pause 1 1 pause)
  (princ)
  )

(defun c:FOGAO6B (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/FOGAO_6B.dwg") pause 1 1 pause)
  )

(defun c:GELADEIRA (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/GELADEIRA.dwg") pause 1 1 pause)
  (princ)
 )
 
 (defun c:Armario2 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/ARM_2P.dwg") pause 1 1 pause)
  (princ)
 )

(defun c:Armario3 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/ARM_3P.dwg") pause 1 1 pause)
  (princ)
 )
 (defun c:Armario4 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/ARM_4P.dwg") pause 1 1 pause)
  (princ)
 )
 (defun c:Armario5 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/ARM_5P.dwg") pause 1 1 pause)
  (princ)
 )
 (defun c:Armario6 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Cozinha/ARM_6P.dwg") pause 1 1 pause)
  (princ)
 )


;AREA SERVIÇO

(defun c:Tanque (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Lavanderia/Tanque.dwg") pause 1 1 pause)
  (princ)
)

(defun c:MaquinaLavar (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Lavanderia/MaquinaLavar.dwg") pause 1 1 pause)
  (princ)
)

;SALA

(defun c:Sofa1 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Sala/Sofa1.dwg") pause 1 1 pause)
  (princ)
)


(defun c:Sofa2 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Sala/Sofa2.dwg") pause 1 1 pause)
  (princ)
)
(defun c:Sofa3 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Sala/Sofa3.dwg") pause 1 1 pause)
  (princ)
)


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

;ESTRUTUAL
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

(defun c:vb()

(setq contador (getint "\n Sequencia inicial: <1> "))
(if (= nil contador) (setq contador 1))

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

	(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaBaldrame.dwg") "_non" pcota 1 1 angulo2 (strcat "VB" (rtos contador 2 0)) (rtos comprimento 2 2) (rtos largura 2 2) (rtos altura 2 2) "5/16" "4" "4.2mm" "0.25" "")
	(princ)

	(devolve_status)

	(setq contador (+ contador 1))
)

)

(defun c:vr()

;(setq contador (getint "\n Numero inicial"))

(if (= nil contador) (setq contador 0))
	(guarda_status)
	(setvar "osmode" 1)
	(setq p1 (getpoint "\n Selecione o ponto inicial da Viga "))
	(setq p2 (getpoint p1 "\n Selecione o ponto final da Viga "))
	(setq pcota (polar p1 (angle p1 p2) (/ (distance p1 p2) 2)))
	(setvar "osmode" 128)
	(setq p3 (getpoint pcota "\n Selecione o outro lado da parede "))
	(setq largura (distance pcota p3))
	(setq comprimento (distance p1 p2))
	(setq angulo (- (* (angle pcota p3) (/ 180 pi)) 90))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command "_attdia" "0" ".insert" (strcat path "Blocos/Estrutural/VigaRespaldo.dwg") "_non" pause 1 1 angulo2 (strcat "VR" (rtos contador 2 0)) (rtos comprimento 2 2) (rtos largura 2 2) "0.30" "5/16" "4" "4.2mm" "0.25" "")
	(princ)
	(devolve_status)
	(setq contador (+ contador 1))

)


(defun c:Trilho (/)
  (command ".insert" (strcat path "Blocos/Estrutural/Trilho.dwg") pause 1 1 pause)
  (princ)
 )


;Hidraulico agua fria

(defun c:AD25 (/)
  (command "_.attdia" "0" ".insert" (strcat path "Blocos/Hidraulico/AF25.dwg") pause 1 1 pause "AD1 Ø25"  "3.50")
  (princ)
)

(defun c:AF50 (/)
  (command "_.attdia" "0" ".insert" (strcat path "Blocos/Hidraulico/AF50.dwg") pause 1 1 pause "AF1 Ø50"  "3.00")
  (princ)
)

(defun c:AF25 (/)
  (command "_.attdia" "0" ".insert" (strcat path "Blocos/Hidraulico/AF25.dwg") pause 1 1 pause "AF1 Ø25"  "3.00")
  (princ)
)

(defun c:JoelhoAzul25L (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Joelho_Azul_25_L.dwg") pause 1 1 pause)
  (princ)
)



;HIDRAULICO ESGOTO
(defun c:CI (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/CI.dwg") pause 1 1 pause)
  (princ)
)

(defun c:CS75 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Caixa_sifonada_75mm.dwg") pause 1 1 pause)
)

(defun c:CS50 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Caixa_sifonada_50mm.dwg") pause 1 1 pause)
)

(defun c:CS40 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Caixa_sifonada_50mm.dwg") pause 1 1 pause)
)


(defun c:CP (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/CP.dwg") pause 1 1 pause)
)

(defun c:015 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/015.dwg") pause 1 1 pause)
)

(defun c:022 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/022.dwg") pause 1 1 pause)
)

(defun c:025 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/025.dwg") pause 1 1 pause)
)

(defun c:040(/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/040.dwg") pause 1 1 pause)
)

(defun c:050 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/050.dwg") pause 1 1 pause)
)

(defun c:075 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/075.dwg") pause 1 1 pause)
  )

(defun c:0100 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/Cota/0100.dwg") pause 1 1 pause)
  )

(defun c:RG25 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/AguaFria/RG25.dwg") pause 1 1 pause)
  (princ)
)

(defun c:V25 (/)
  (command "_.attdia" "0" ".insert" (strcat path "Blocos/Hidraulico/V25.dwg") pause 1 1 pause "V Ø25" "3.20")
  (princ)
)

(defun c:RG50 (/)
  (command ".insert" (strcat path "Blocos/Hidraulico/RG50.dwg") pause 1 1 pause)
  (princ)
)


(defun c:C45100 (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/C45100.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho40L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_40_L.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho4045L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_40_45_L.dwg") pause 1 1 pause)
	(princ)
 )

 
 (defun c:LuvaSimples40L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/LuvaSimples_40_L.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho40S (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_40_S.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho50S (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_50_S.dwg") pause 1 1 pause)
	(princ)
)

(defun c:Joelho50L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_50_L.dwg") pause 1 1 pause)
	(princ)
)

(defun c:Joelho5045L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_50_45_L.dwg") pause 1 1 pause)
	(princ)
)

(defun c:Luva50L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Luva_50_L.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho100S (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_100_90_S.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho100Visita50S (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_100_Visita_50_S.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho10045L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_100_45_L.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho100D (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_100_90_D.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Joelho100L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_100_90_L.dwg") pause 1 1 pause)
	(princ)
 )

(defun c:Juncao40L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Juncao_40_L.dwg") pause 1 1 pause)
	(princ)
 ) 

(defun c:Juncao10050L (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Juncao_100_50_L.dwg") pause 1 1 pause)
	(princ)
 )

 
 (defun c:Tub40 (/)
 	(guarda_status)
	(crl "Esgoto" 1)
	(setvar "clayer" "Esgoto")	

 	(setq p1 (getpoint "\n Selecione o ponto inicial"))
	(setq p2 (getpoint p1 "\n Selecione o ponto final"))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(if (> 0 dir2) (setq valor -0.08) (setq valor 0.08))
	(if (= 0 dir2) (setq valor -0.08))
	
	(setq p4 (polar p3 dir2 valor))
	(setq p5 (polar p4 dir (distance p1 p2)))
    (setq angulo (* dir (/ 180 pi)))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Tubulacao_40mm_PVC_Esgoto.dwg") "_non" p1 (distance p1 p2) 1 "_non" p2 "")
	(command ".insert" (strcat path "Blocos/Hidraulico/Cota/040.dwg") "_non" p4 0.70 0.70 angulo2 "")
	(devolve_status)
	(princ)
 )
 
 (defun c:Tub50 (/)
 	(guarda_status)
	(crl "Esgoto" 1)
	(setvar "clayer" "Esgoto")	

 	(setq p1 (getpoint "\n Selecione o ponto inicial"))
	(setq p2 (getpoint p1 "\n Selecione o ponto final"))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(if (> 0 dir2) (setq valor -0.09) (setq valor 0.09))
	(if (= 0 dir2) (setq valor -0.09))
	
	(setq p4 (polar p3 dir2 valor))
	(setq p5 (polar p4 dir (distance p1 p2)))
    (setq angulo (* dir (/ 180 pi)))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Tubulacao_50mm_PVC_Esgoto.dwg") "_non" p1 (distance p1 p2) 1 "_non" p2 "")
	(command ".insert" (strcat path "Blocos/Hidraulico/Cota/050.dwg") "_non" p4 0.80 0.80 angulo2 "")
	(devolve_status)
	(princ)
 )
 
 (defun c:Tub75 (/)
 	(guarda_status)
	(crl "Esgoto" 1)
	(setvar "clayer" "Esgoto")	
 
 	(setq p1 (getpoint "\n Selecione o ponto inicial"))
	(setq p2 (getpoint p1 "\n Selecione o ponto final"))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(if (> 0 dir2) (setq valor -0.10) (setq valor 0.10))
	(if (= 0 dir2) (setq valor -0.10))
	
	(setq p4 (polar p3 dir2 valor))
	(setq p5 (polar p4 dir (distance p1 p2)))
    (setq angulo (* dir (/ 180 pi)))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Tubulacao_75mm_PVC_Esgoto.dwg") "_non" p1 (distance p1 p2) 1 "_non" p2 "")
	(command ".insert" (strcat path "Blocos/Hidraulico/Cota/075.dwg") "_non" p4 0.80 0.80 angulo2 "")
	(devolve_status)
	(princ)
 )
 
(defun c:Tub100 (/)

	(guarda_status)
	(crl "Esgoto" 1)
	(setvar "clayer" "Esgoto")	
	
	(setq p1 (getpoint "\n Selecione o ponto inicial"))
	(setq p2 (getpoint p1 "\n Selecione o ponto final"))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(if (> 0 dir2) (setq valor -0.13) (setq valor 0.13))
	(if (= 0 dir2) (setq valor -0.13))
	
	(setq p4 (polar p3 dir2 valor))
	(setq p5 (polar p4 dir (distance p1 p2)))
    (setq angulo (* dir (/ 180 pi)))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Tubulacao_100mm_PVC_Esgoto.dwg") "_non" p1 (distance p1 p2) 1 "_non" p2 "")
	(command ".insert" (strcat path "Blocos/Hidraulico/Cota/0100.dwg") "_non" p4 0.9 0.9 angulo2 "")
	(devolve_status)
	(princ)
 )
 
  (defun c:Joelho7545L()
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_75_45_L.dwg") pause 1 1 pause "")
	(princ)
 )



 
 (defun c:TE100S()
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/TE_100mm_S.dwg") pause 1 1 pause "")
	(princ)
 )
 
  (defun c:TE1007545L()
	(command ".insert" (strcat path "Blocos/Hidraulico/TE_100_75_45_L.dwg") pause 1 1 pause "")
	(princ)
 )
 
 (defun c:TE10075()
	(command ".insert" (strcat path "Blocos/Hidraulico/TE_100_75_L.dwg") pause 1 1 pause "")
	(princ)
 )
 
(defun c:TE10050L()
	(command ".insert" (strcat path "Blocos/Hidraulico/TE_100_50_L.dwg") pause 1 1 pause "")
	(princ)
 )
 
 (defun c:TE10050S()
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/TE_100mm_reducao_50mm_L.dwg") pause 1 1 pause "")
	(princ)
 )
 
 (defun c:REDUCAO10075L()
	(command ".insert" (strcat path "Blocos/Hidraulico/Esgoto/Reducao_100_75_L.dwg") pause 1 1 pause "")
	(princ)
 )
 
 
;Agua Fria
(defun c:Joelho50MarromL (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/Joelho_50_Marrom_L.dwg") pause 1 1 pause)
	(princ)
)

;Agua Fria
(defun c:TE50MarromL (/)
	(command ".insert" (strcat path "Blocos/Hidraulico/TE_50_Marrom_L.dwg") pause 1 1 pause)
	(princ)
)

(defun c:Tub25Marrom (/)
 	(guarda_status)
	(crl "AguaFria" 131)
	(setvar "clayer" "AguaFria")	

 	(setq p1 (getpoint "\n Selecione o ponto inicial"))
	(setq p2 (getpoint p1 "\n Selecione o ponto final"))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(if (> 0 dir2) (setq valor -0.08) (setq valor 0.08))
	(if (= 0 dir2) (setq valor -0.08))
	
	(setq p4 (polar p3 dir2 valor))
	(setq p5 (polar p4 dir (distance p1 p2)))
    (setq angulo (* dir (/ 180 pi)))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command ".insert" (strcat path "Blocos/Hidraulico/AguaFria/Tubo_PVC_25mm_marrom.dwg") "_non" p1 (distance p1 p2) 1 "_non" p2 "")
	(command ".insert" (strcat path "Blocos/Hidraulico/Cota/025.dwg") "_non" p4 0.70 0.70 angulo2 "")
	(devolve_status)
	(princ)
 )


(defun c:Tub50Marrom (/)
 	(guarda_status)
	(crl "AguaFria" 131)
	(setvar "clayer" "AguaFria")	

 	(setq p1 (getpoint "\n Selecione o ponto inicial"))
	(setq p2 (getpoint p1 "\n Selecione o ponto final"))
	(setq dir (angle p1 p2))
	(setq dir2 (- dir (/ pi 2)))
	(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
	
	(if (> 0 dir2) (setq valor -0.08) (setq valor 0.08))
	(if (= 0 dir2) (setq valor -0.08))
	
	(setq p4 (polar p3 dir2 valor))
	(setq p5 (polar p4 dir (distance p1 p2)))
    (setq angulo (* dir (/ 180 pi)))
	(setq angulo2 angulo)
	(if (and (> angulo 90) (< angulo 270))
		(setq angulo2 (+ angulo 180))
	)
	(if (= angulo -90.0)
		(setq angulo2 90)
	)
	(command ".insert" (strcat path "Blocos/Hidraulico/AguaFria/Tubo_PVC_50mm_marrom.dwg") "_non" p1 (distance p1 p2) 1 "_non" p2 "")
	(command ".insert" (strcat path "Blocos/Hidraulico/Cota/050.dwg") "_non" p4 0.70 0.70 angulo2 "")
	(devolve_status)
	(princ)
 )


 

;VEGETAÇÃO..........................................................................
(defun c:ARBUSTO (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/ARBUSTO.dwg") pause pause pause pause)
  )
(princ)
(defun c:ARVORE1 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/ARVORE1.dwg") pause pause pause pause)
  )
(princ)
(defun c:ARVORE2 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/ARVORE2.dwg") pause 1 1 0)
  )
(princ)
(defun c:ARVORE3 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/ARVORE3.dwg") pause 1 1 0)
  )
(princ)
(defun c:FLOR1 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/FLOR1.dwg") pause 1 1 0)
  )
(princ)
(defun c:FLOR2 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/FLOR2.dwg") pause 1 1 0)
  )
(princ)
(defun c:COQUEIRO (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/COQUEIRO.dwg") pause 1 1 0)
  )
(princ)
(defun c:VEGET1 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET1.dwg") pause 1 1 0)
  )
(princ)
(defun c:VEGET2 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET2.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET3 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET3.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET4 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET4.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET5 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET5.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET6 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET6.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET7 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET7.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET8 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET8.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET9 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET9.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET10 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET10.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET11 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET11.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET12 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET12.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET13 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET13.dwg") pause pause pause pause)
  )
(princ)
(defun c:VEGET14 (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Vegetacao/VEGET14.dwg") pause pause pause pause)
  )
(princ)

;VEICULOS
(defun c:Astra_c (/)
	(command ".insert" (strcat path "Blocos/Arquitetonico/Veiculos/Astra_c.dwg") pause pause pause pause)  
	(princ)
)

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
	(setvar "clayer" "05")  
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

(defun dataatual()
	(setq dt (rtos (getvar "cdate") 2 6))
	(setq dia (substr dt 7 2))
	(setq mes (substr dt 5 2))
	(setq ano (substr dt 1 4))
	(setq dtatual (strcat dia "/" mes "/" ano))
)


;ROTINA PARA INSERSÃO DE CARIMBOS
(defun c:carimbos (/)
  (initget "1, 2, 3, 4, 5")
  (setq Bloco (getkword "\nCarimbo?: <[1] A4, [2] A3, [3] Arquitetônico, [4] Complementar, [5]Subdivisão> :"))

  (cond
  
    ((= bloco "1") 
		(command "_.insert" (strcat path "Blocos/Carimbos/A4.dwg") "_non" pause "1" "1" 0)
	)
    
    ((= bloco "2") (command ".insert" (strcat path "Blocos/Carimbos/A3.dwg") pause 1 1 0))
    
    ((= bloco "3") (command ".insert" (strcat path "Blocos/Carimbos/ARQUITET.dwg") pause 1 1 0))
    
    ((= bloco "4") (command ".insert" (strcat path "Blocos/Carimbos/COMPLE.dwg") pause 1 1 0))
    
    ((= bloco "5") (command ".insert" (strcat path "Blocos/Carimbos/SUBDIVISAO.dwg") pause 1 1 0))
    )
 (princ)
)

;#################################################################
;CODIGO PARA INSERSÃO DAS SETAS INDIVIDUAIS
(defun c:SETA (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/SETA.dwg") pause pause pause pause)
  (princ)
)

(defun c:SetaCorte (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/CORTE.dwg") pause pause pause pause)
  (princ)
)

(defun c:NORTE (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/NORTE.dwg") pause pause pause pause)
  (princ)  
)

(defun c:SETCOB (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/SETCOB.dwg") pause pause pause pause)
  (princ)
)


(defun c:JCELO (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Fachadas/JCELO.dwg") pause pause pause pause)
  (princ)  
)

(defun c:Jveneziana (/)
  (command ".insert" (strcat path "Blocos/Arquitetonico/Fachadas/Veneziana.dwg") pause pause pause pause)
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
  
  (setq p1 (getpoint "\nSeleciona um [O]bjeto / criar [P]olyline / selecionar [C]otas/<selecionar ponto Interno :"))
  
  (cond
    ((= 'LIST (type p1)) (pega_ponto))
    ((= 'STR (type p1))
     (cond
       ((= (strcase p1) "C") (duas_cotas))
       ((= (strcase p1) "O") (seleciona_poly))
       ((= (strcase p1) "P") (criap))
       (t (prompt "\nEntrada Inválida!"))
     )
    )
  (t (prompt "\nEntrada Inválida!"))
 )
)

(defun c:pegaponto()
(setq p1 (getpoint "\nselecionar ponto Interno do Ambiente para Calcular a area"))
(pega_ponto)
)

(defun c:duasCotas()
(duas_cotas)
)
(defun c:seleciona_poly()
(seleciona_poly)
)
(defun c:criap()
(criap)
)

;calcula atravez de duas cotas no desenho
(defun duas_cotas ()
  (ApagarSelecaoCotas)
  (guarda_status)
  (setq selecao_cota1 (entsel "\nSelecione a Primeira cota"))
  (setq cota1 (cdr (assoc 42 (entget (car selecao_cota1)))))
  (setq ponto_selecao (car (cdr selecao_cota1)))
  
  (command "_.insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/SelecaoObjetos.dwg") "_non" ponto_selecao 1 1 0)
  (setq selecao_cota2 (entsel "\nSelecione a Segunda cota"))
  (setq cota2 (cdr (assoc 42 (entget (car selecao_cota2)))))
  (setq ponto_selecao (car (cdr selecao_cota2)))
  
  (command "_.insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/SelecaoObjetos.dwg") "_non" ponto_selecao 1 1 0)
  
  (setq total (* cota1 cota2))
  (setq area_calculada (strcat (rtos total 2 2) " m²"))
    
  (altera_texto)
  (ApagarSelecaoCotas)
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
  (setq SELOBJETO (entsel)) 
  (if (NULL selOBJETO) 
	(while (NULL SELOBJETO)
		(princ "\nObjeto Não Encontrado: ") 
		(setq SELOBJETO (entsel))
	)
  )
  (command "area" "o" SELOBJETO) 
  (setq a (getvar "area"))
  (command "chprop" SELOBJETO "" "C" "1" "") 			
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


(defun Ambiente ()
  (setq dcl_id (load_dialog (strcat path "Janelas.dcl")))
  (if (not (new_dialog "Ambiente" dcl_id)) (exit))

  (if (= nil texto) (setq texto "NOME AMBIENTE"))
    
  (set_tile "txtTitulo" "Nome de Ambientes")
  (set_tile "txtTexto" texto)
  (action_tile "txtTexto" "(setq texto $value)")
  (mode_tile "txtTexto" 2)
   

  ;ok e cancel
  (action_tile "accept" "(done_dialog 1)")

  
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
  (setq area_calculada (vl-string-subst "," "." area_calculada))
  (setq elist (entget (car (entsel "\n Selecione o texto para inserir a area:"))))
  (entmod (setq elist1 (subst (cons 1 area_calculada) (assoc 1 elist) elist)))
  (princ)
)

(defun c:limpa()
   (ApagarSelecaoCotas)
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
  (setvar "osmode" 4755)
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
  (command "_.insert" (strcat path "Blocos/Arquitetonico/Banheiro/BoxBanheiro.dwg") "_non" p5 1 tamanho "_non" p6)

  (initget 128)
  (setq inverter (getkword "\n Inverter o bloco? <Yes> <No> <Enter Não> ) "))

  (if (= (strcase inverter) "Y") (command "_mirror" "l" "" "non" p4 "_non" p5 "y"))    
  
  (print "Box inserido com sucesso!")
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
	linha_porta_config nil
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
	  linha_porta_config (read-line open_file)
	  codificar_porta (read-line open_file)
  	  layer_arco (read-line open_file)
  	  cor_arco (read-line open_file)
  )



  
  (close open_file)

  (if (= nil larg_porta_config) (setq larg_porta_config "0.80"))
  (if (= nil boneca_config) (setq boneca_config "0.10"))
  (if (= nil alt_porta_config) (setq alt_porta_config "2.10"))
  (if (= nil tipo_porta_config) (setq tipo_porta_config "Porta Interna de Madeira"))
  (if (= nil cota_porta_config) (setq cota_porta_config "1"))
  (if (= nil arco_porta_config) (setq arco_porta_config "1"))
  (if (= nil linha_porta_config) (setq linha_porta_config "1"))
  (if (= nil codificar_porta) (setq codificar_porta "1"))
  (if (= nil layer_arco) (setq layer_arco "021"))
  (if (= nil cor_arco) (setq cor_arco "1"))
   
  
  (guarda_status)
  
  ;Captura os dados a partir de uma linha selecionada
  (setq linha_selecionada (entsel "\nSelecione a linha interna onde vai ser aberto o Vão"))
  (setq ponto_selecao (car (cdr linha_selecionada)))
  (setq lista_linha (entget (car linha_selecionada)))
  (setq layer_parede (cdr (assoc 8 lista_linha)))  
  (setq pinicial (cdr (assoc 10 lista_linha)))       
  (setq pfinal (cdr (assoc 11 lista_linha)))

   
   
  (setq tipolinha (cdr (nth 8 lista_linha)))   
  (if (/= tipolinha "AcDbLine") (prompt "\n Linha Inválida, verifique o tipo de Line"))   
  
  ;Calcula os pontos	
  (setq d1 (distance pinicial ponto_selecao))
  (setq d2 (distance pfinal ponto_selecao))
  
  (cond 
    ((< d1 d2)
 	  (setq dir1 (angle pinicial pfinal))  
	  (setq rp1 (polar pinicial dir1 d1))  
      (setq p1 (polar pinicial dir1 (distof boneca_config)))  
    )
   
    ((> d1 d2)
      (setq dir1 (angle pfinal pinicial))  
      (setq rp1 (polar pfinal dir1 d2))
      (setq p1 (polar pfinal dir1 (distof boneca_config)))	
   )
  )  
	
  (setvar "osmode" 128)
  (setq rp2 (getpoint rp1 "\n Selecione o outro lado da parede (espessura): "))
  
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
  (write-line linha_porta_config open_file)
  (write-line codificar_porta open_file)
  (write-line layer_arco open_file)
  (write-line cor_arco open_file)
  
  (close open_file)
  
  (setq espessura (distance rp1 rp2))
  (setq dir2 (angle rp1 rp2))
  
  
  (setq p2 (polar p1 dir2 espessura))
  (setq pbloco (polar p1 dir1 0.015))
  (setq parco_base (polar p1 dir1 0.03))
  (setq parco_topo (polar parco_base dir2 (* largporta -1)))
  
  (setq pcortar1 (polar p1 dir1 (/ largporta 2.001)))
  (setq pcortar2 (polar pcortar1 dir2 espessura))
  (setq pcortar3 (polar pcortar1 dir2 -0.15))
  (setq pcortar4 (polar pcortar2 dir2 0.10))
  (setq pescala2 (polar pbloco dir2 (* largporta -1)))
  (setq parc1 (polar p1 dir1 (* largporta 0.70)))
  (setq parc2 (polar parc1 dir2 (* (* largporta 0.70) -1)))
  (setq parc3 (polar p1 dir1 largporta))

  (setq p3 (polar p1 dir1 largporta))
  (setq p4 (polar p3 dir2 espessura))	

  ;Desenha 

  (crl layer_arco (atoi cor_arco))

  (if (= arco_porta_config "1")
    (command "clayer" layer_arco "_arc" "_non" parc3 "_non" parc2 "_non" parco_topo)
  )
  
  (if (= linha_porta_config "1")
    (command "clayer" layer_arco "_line" "_non" parc3 "_non" parco_topo "")
  )
  
  (setvar "clayer" layer_parede)
  (command "_line" "_non" p1 "_non" p2 "")
  (command "_line" "_non" p3 "_non" p4 "")
  (setq p5 (polar p1 dir2 (/ espessura 2)))
  (setq p6 (polar p3 dir2 (/ espessura 2)))
  
  (command "._trim" "f" "_non" p5 "non" p6 "" "" "f" "_non" pcortar3 "_non" pcortar4 "" "")
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/porta1.dwg") "_non" pbloco largporta 1 "_non" pescala2 alt_porta_config tipo_porta_config larg_porta_config pcortar3)
  (if (= cota_porta_config "1")
      (command "_attdia" "0" "_.insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/CotaPorta.dwg") "_non" pcortar3 "1" "1" 0 (rtos largporta 2 2) alt_porta_config tipo_porta_config "_attdia" "1")
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
  (setq a (strcat "Coeficiente de aproveitamento:    " a "%"))
  (setq elist (entget (car (entsel "\n Selecione o texto para alterar Coeficiente :"))))
  (entmod (setq elist (subst (cons 1 a) (assoc 1 elist) elist)))


  ;taxa ocupação
  (setq b (rtos b 2 5))  
  (setq b (substr b 1 5))      
  (setq b (strcat "Taxa de ocupação:    " b "%"))
  (setq elist (entget (car (entsel "\n Selecione o texto para alterar Taxa Ocupação :"))))
  (entmod (setq elist (subst (cons 1 b) (assoc 1 elist) elist)))


  ;taxa impermeabilidade
  (setq c (rtos c 2 2))  
  (setq c (substr c 1 5))      
  (setq c (strcat "Taxa de permeabilidade:    " c "%"))
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
  
  (setvar "osmode" 4755)
  (setq p1 (getpoint "\ Selecione o ponto central da Porta: "))

  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))
  
  (setq sel (ssget p1 p2))
  
  (setq nome (ssname sel 0))
  
  (setq lista_linha (entget nome))
  (setq layer_parede (cdr (assoc 8 lista_linha))) 

  (setq larg (getreal (strcat "\nLargura da Porta : <2.00>: ")))
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
    
  (setvar "clayer" layer_parede)
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
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/PCorrer.dwg") "_non" p7 larg 1 "_non" p8)
  (command "_attdia" "0")
  (command "_.insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/CotaJanela.dwg") "_non" p9 "1" "1" angulo2 (strcat (rtos larg 2 2) " x 2.10"))
  (command "_attdia" "1")
  (devolve_status)
  (prompt "\n Porta inserida com sucesso!")
  (command "_undo" "_end")
  (princ)
)


;Cria vão na parede
(defun c:vao ()
  (guarda_status)
  (command "_undo" "_begin")
   
  (setvar "osmode" 4755)
  (setq p1 (getpoint "\ Selecione o ponto central do Vao: "))

  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))
   
  (setq sel (ssget p1 p2))
  
  (setq nome (ssname sel 0))
  
  (setq lista_linha (entget nome))
  (setq layer_parede (cdr (assoc 8 lista_linha)))  

  (setq espessura (distance p1 p2))
  
  (setq larg (getreal (strcat "\nLargura do vão? <1.00>: ")))
  
  (if (= nil larg) (setq larg 1.0001))

  (setq dir (angle p1 p2))
  (setq dir2 (- dir (/ pi 2)))
   
  (setq p3 (polar p1 dir2 (/ larg 2)))
  (setq p4 (polar p3 dir espessura))

  (setq p5 (polar p3 dir2 (* larg -1)))
  (setq p6 (polar p5 dir espessura))

  (setq pcortar1 (polar p1 dir -0.01))
  (setq pcortar2 (polar p2 dir 0.01))
  
  (setvar "clayer" layer_parede)
  
  (command "_line" "_non" p3 "_non" p4 "")
  (command "_line" "_non" p5 "_non" p6 "")

  (command "._trim" "" "f" "_non" pcortar1 "_non" pcortar2 "" "")

  (devolve_status)

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

  (setvar "osmode" 4755)
  (setq p1 (getpoint "\ Selecione o ponto central da Porta: "))

  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))
  
  (setq sel (ssget p1 p2))
  
  (setq nome (ssname sel 0))
  
  (setq lista_linha (entget nome))
  (setq layer_parede (cdr (assoc 8 lista_linha))) 
  
  
  (setq larg (getreal (strcat "\nLargura da Porta : <2.00>: ")))
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
  
  (setvar "clayer" layer_parede)
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
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/PortaEnrrolar.dwg") "_non" p1 larg 1 "_non" p7)
  (command "_attdia" "0")
  (command "_.insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/CotaJanela.dwg") "_non" p9 "1" "1" angulo2 (strcat (rtos larg 2 2) " x 1.20"))
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


;########################################## AUTOMAIZACAO DE CORTES

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
	(command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/Textos.dwg") "_non" pl2 1 1 "_non" pl3 "LAJE-PRÉ" "._burst" "l")			
	
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
			
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/estacacorte.dwg") "_non"  p21 0.5 0.15 "_non" (polar p21 dir_alt -0.15) "_explode" (entlast) "")
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/estacacorte.dwg") "_non"  p22 0.5 0.15 "_non" (polar p22 dir_alt -0.15) "_explode" (entlast) "")
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/BaldramesEstacas.dwg") "_non"  p24 1 1 "_non" (polar p24 dir_long 0.15) "_explode" (entlast) "")
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/TerraEsquerdaCorte.dwg") "_non"  (polar p11 dir_long -0.15) 1 1 "_non" p11 "")
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/TerraDireitaCorte.dwg") "_non"  p11 1 1 "_non" (polar p11 dir_long 0.20) "")
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/TerraDireitaCorte.dwg") "_non"  (polar p12 dir_long 0.15) 1 1 "_non" (polar p12 dir_long 0.20) "")
			(command "_insert" (strcat path "Blocos/Arquitetonico/Cortes/TerraEsquerdaCorte.dwg") "_non"  p12 1 1 "_non" (polar p12 dir_long 0.20) "")
			
			(crl "Textos" 7)e 
			(setvar "clayer" "Textos")			
			
			(setq pnomedesenho (polar (polar p26 dir_long 2.00) dir_alt -0.30))
			(command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/NomeDesenho.dwg") "_non" pnomedesenho 1 1 "_non" (polar pnomedesenho dir_long 0.30) "Escala 1:75" (strcat "CORTE " idCorte idCorte) "._burst" "l")			
			
			
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
	
	(command "_insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/LinhaCorte.dwg") "_non" (polar pl1 dir_long 0.45) (- (distance pl1 pl2) 0.90) 1 "_non" (polar pl2 dir_long -0.45) "_explode" (entlast) "" )	   
	
	(command "_insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/corte.dwg") "_non" pl1 1 1 "_non" pl3)
	(command "_insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/corte.dwg") "_non" pl2 1 1 "_non" pl4)

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
	(command "_insert" (strcat "Blocos/Arquitetonico/Cortes/beiralmadeiraFrente.dwg") pause 1 pause pause "_explode" (entlast) "")
	(devolve_status)
)

(defun c:beirallajefrente ()
	(command "_insert" (strcat "Blocos/Arquitetonico/Cortes/BeiralLajeFrente.dwg") pause 1 pause pause "_explode" (entlast) "")
	(devolve_status)
)

(defun c:beirallajelado ()
	(command "_insert" (strcat "Blocos/Arquitetonico/Cortes/BeiralLajeLado.dwg") pause 1 pause pause "_explode" (entlast) "")
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
 
  (command "._insert" (strcat "Blocos/Arquitetonico/Cortes/BeiralLaje.dwg") p1 1 x p2 "_explode" (entlast) "")
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


;+==========================================

(defun c:elevacao ()

	(initget 128)
    (setvar "osmode" 567)
	(setq pinicial (getpoint "\n [D]detalhes / < ou Clique para uma nova elevacao - da direita para esquerda > :"))
  
	(cond
		((= 'LIST (type pinicial)) (novaelevacao))
		((= 'STR (type pinicial))
		(cond
			((= (strcase pinicial) "C") (exit))
			((= (strcase pinicial) "D") (painelelevacao))
		)
		)
	)
	(princ)

)

(defun painelelevacao()
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

(defun novaelevacao ()
    (command "_undo" "_begin")
	(guarda_status)
	(setq tamVigaBaldrame 0.30)
	(setq tamVigaRespaldo 0.30)
	(setq tamBeiral 0.70)
	(setq espessuraLaje 0.10)	
	(setq pedireito 3.00)
	(setq tipopavimento "t")
	(setvar "osmode" 128)
	(setq pfinal (getpoint pinicial "\n Linha Final da elevacao"))
	(setq p1(getpoint pinicial "\n Posição da base da elevação"))
	
	


	
	(if (= nil pedireito) (setq pedireito 3.00))
	
	(setq dist (distance pinicial p1))
	(setq tamanho (distance pinicial pfinal))

	(setq dir (angle pinicial pfinal))
	(setq dir2 (angle pinicial p1))	
	
	(setq p2 (polar p1 dir tamanho))
	
	(setq p3 (polar p1 dir2 pedireito))
	(setq p4 (polar p3 dir tamanho))
		

    (setvar "clayer" "021")
	(command "_line" "_non" p1 "_non" p2 "_non" p4 "_non" p3 "_non" p1 "")
   
   
   (command "_undo" "_end")
   (devolve_status)


	


	(guarda_status)


   
   	(crl "05" 5)
	(setvar "clayer" "05")

    (setvar "osmode" 567)
	
	(painelelevacao)
 
    (devolve_status)
	
	(command "_undo" "_end")
	
)


(defun ApagarSelecaoCotas()
    (setq contador 0)
    (setq sel (ssget "all" '((0 . "INSERT"))))
    (if (/= nil sel) 
		(progn
			(setq qtd (sslength sel))
			(while (< contador qtd)
				(setq nome (ssname sel contador))
				(setq obj (entget nome))
				(setq pegar (cdr (assoc 2 obj)))
				(if (= pegar "SelecaoObjetos") (entdel nome))
				(setq contador (+ contador 1))
			)
		)
	)
)

(defun BuscaPortas()
    (setq contador 0)
    (setq sel (ssget "all" '((0 . "INSERT"))))
    (setq qtd (sslength sel))
	(while (< contador qtd)
	    (setq nome (ssname sel contador))
        (setq obj (entget nome))
		(setq pegar (cdr (assoc 2 obj)))
		(if (= pegar "porta1")
		   (limpa)
		)
		(setq contador (+ contador 1))
	)
)

(defun c:CBloco()

(ContaBloco "Estacas")
(setq TotalEstacas qtdbloco)

(ContaBloco "Coluna")
(setq TotalColunas qtdbloco)


)

(defun ContaBloco(NomeBloco)
    (setq contador 0)
	(setq qtdbloco 0)
    (setq sel (ssget "all" '((0 . "INSERT"))))
	
    (setq qtd (sslength sel))
	(while (< contador qtd)
	    (setq nome (ssname sel contador))
        (setq obj (entget nome))
		(setq pegar (cdr (assoc 2 obj)))
		(if (= pegar NomeBloco)
		(progn
		(setq qtdbloco (+ qtdbloco 1))
		)
		)
		
		(setq contador (+ contador 1))
	)
)


;Cria janela parametrizada
(defun c:janela ()
  (guarda_status)
  (command "_undo" "_begin")
  
  (setvar "osmode" 4755)
  (setq p1 (getpoint "\ Selecione o ponto central da Janela: "))

  (setvar "osmode" 128)
  (setq p2 (getpoint p1 "\n Selecione a linha Externa da parede: "))

  
  
  (setq sel (ssget p1 p2))
  
  (setq nome (ssname sel 0))
  
  (setq lista_linha (entget nome))
  (setq layer_parede (cdr (assoc 8 lista_linha)))  
  

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
  
  (setvar "clayer" layer_parede)
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
  (command "._insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/janela.dwg") "_non" p1 largjanela espessura angulo (rtos largjanela 2 2) "JANELA DE BLINDEX" altjanela)
  (command "_.insert" (strcat path "Blocos/Arquitetonico/PlantaBaixa/CotaJanela.dwg") "_non" p4 "1" "1" angulo2 (strcat (rtos largjanela 2 2) " x " (rtos altjanela 2 2)))
  (command "_attdia" "1")
  (devolve_status)
  (prompt "\n Janela inserida com sucesso!")
  (command "_undo" "_end")
  
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
(defun c:blocos ()

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

(defun c:CriaEstacas ()
	;Seleciona todos blocos
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

(defun c:cotar()
(setq p1 (getpoint "Selecione o ponto inicial"))
(setq p2 (getpoint p1 "selecione o segundo ponto"))
(setq dir (angle p1 p2))
(setq dir2 (- dir (/ pi 2)))	
(setq p3 (polar p1 dir (/ (distance p1 p2) 2)))
(setq p4 (polar p3 dir2 0.50))
(command "dimlinear" "non" p1 "non" p2 "non" p4)
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

(defun c:t100()
	
(setq lista (entget (car (entsel))))
;Seleciona uma instancia de algum bloco

(setq ENT1 (entget (entnext (entnext (cdr (assoc '-1 lista))))))
;Com isso pego o primeiro item dentro do bloco
	
)


;L1 - Parede
;L2 - Linhas finas
;L3 - linha pontilhada
;L4 - Linha 025



(defun c:L1 ()
	(guarda_status)
	(crl "05" 5) 
	(setvar "clayer" "05")
	(setvar "osmode" 0)
	(setq SELOBJETO (ssget)) 
	(if (NULL selOBJETO) 
		(while (NULL SELOBJETO)
			(princ "\nObjeto Selecione a linha: ") 
			(setq SELOBJETO (ssget))
		)
	)
	(command "chprop" SELOBJETO "" "LA" "05" "") 			
  (devolve_status)
  (princ)
  
)

(defun c:L2 ()
	(guarda_status)
	(crl "021" 2) 
	(setvar "clayer" "021")
	(setvar "osmode" 0)
	(setq SELOBJETO (ssget)) 
	(if (NULL selOBJETO) 
		(while (NULL SELOBJETO)
			(princ "\nObjeto Selecione a linha: ") 
			(setq SELOBJETO (ssget))
		)
	)
	(command "chprop" SELOBJETO "" "LA" "021" "") 			
  (devolve_status)
  (princ)
  
)

(defun c:L3 ()
	(guarda_status)
	(crl "021" 1) 
	(setvar "clayer" "021")
	(setvar "osmode" 0)
	(setq SELOBJETO (ssget)) 
	(if (NULL selOBJETO) 
		(while (NULL SELOBJETO)
			(princ "\nObjeto Selecione a linha: ") 
			(setq SELOBJETO (ssget))
		)
	)
   
	(setq sc (getreal "/n Digite a escala do pontilhado"))
   
	(command "chprop" SELOBJETO "" "LA" "021" "") 			
	(command "chprop" SELOBJETO "" "LT" "hidden" "") 			
	(command "chprop" SELOBJETO "" "S" sc "") 			
		
	(if (null sc)
		(setq sc 0.5)
	)	 	
  
  (devolve_status)
  (princ)
  
)

(defun c:L4 ()
	(guarda_status)
	(crl "025" 2) 
	(setvar "clayer" "025")
	(setvar "osmode" 0)
	(setq SELOBJETO (ssget)) 
	(if (NULL selOBJETO) 
		(while (NULL SELOBJETO)
			(princ "\nObjeto Selecione a linha: ") 
			(setq SELOBJETO (ssget))
		)
	)
	(command "chprop" SELOBJETO "" "LA" "025" "") 			
  (devolve_status)
  (princ)
  
)

