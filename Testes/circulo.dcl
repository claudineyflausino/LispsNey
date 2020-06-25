circulo :dialog {
    label = "Desenhar circulo";
    initial_focus= "raio";
  :boxed_column {label = "Powered by Neyton";    
    :edit_box {label = "raio"; key = "raio" ;}
    :edit_box {label = "layer"; key = "layer" ;}
    :button {label = "pegar um ponto >"; key = "botao";}
    :text {key="coord"; label = "clique o botao";}}
  ok_cancel;
}