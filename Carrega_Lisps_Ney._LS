;Especifique o diret�rio padr�o onde a pasta lisps est�o salvas
(setq path "e:/LispsNey/")

(load (strcat path "Blocos.lsp"))
(load (strcat path "ControleDialogos.lsp"))

(defun c:k ()
  (load (strcat path "Blocos.lsp"))
  (load (strcat path "ControleDialogos.lsp"))
)