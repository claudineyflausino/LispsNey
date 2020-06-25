;Especifique o diretório padrão onde a pasta lisps estão salvas
;(setq path "g:/Programacao/LISP/LispsNey/")
(setq path "C:/LispsNey/")


(load (strcat path "Blocos.lsp"))
(load (strcat path "ControleDialogos.lsp"))

(defun c:k ()
  (load (strcat path "Blocos.lsp"))
  (load (strcat path "ControleDialogos.lsp"))
  (load (strcat path "Eletrico.lsp"))
)

(defun c:CarregaEletrico()
 (load (strcat path "Eletrico.lsp"))
)