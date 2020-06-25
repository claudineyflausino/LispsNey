;Especifique o diretório padrão onde a pasta lisps estão salvas
(setq path "e:/LispsNey/LispPronto/")

(load (strcat path "LispNey.VLX"))

(defun c:k ()
  (load (strcat path "LispNey.VLX"))
)