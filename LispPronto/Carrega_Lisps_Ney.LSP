;Especifique o diret�rio padr�o onde a pasta lisps est�o salvas
(setq path "e:/LispsNey/LispPronto/")

(load (strcat path "LispNey.VLX"))

(defun c:k ()
  (load (strcat path "LispNey.VLX"))
)