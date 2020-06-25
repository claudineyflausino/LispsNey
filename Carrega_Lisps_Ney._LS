;Especifique o diretório padrão onde a pasta lisps estão salvas
(setq path "e:/LispsNey/")

(load (strcat path "Blocos.lsp"))
(load (strcat path "ControleDialogos.lsp"))

(defun c:k ()
  (load (strcat path "Blocos.lsp"))
  (load (strcat path "ControleDialogos.lsp"))
)