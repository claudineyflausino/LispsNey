
//configuracao de portas

ConfigPt:dialog {
	        label = "Configuração de Portas";
	        :boxed_column {
	        	label = "Parametros de tamanho";
        		:edit_box {
	        		label = "Tipo de Porta";
	        		key = "txt_Tipo";
        			width = 50;
        		}
        		:row {
        		:edit_box {
        			label = "Boneca:";
        			key = "txt_Boneca";
        			width = 15;
        		}
        		:edit_box {
       			label = "Largura:";
	        		key = "txt_Largura";
	        		width = 15;
	        	}

	        	:edit_box {
	        		label = "Altura:";
	        		key = "txt_Altura";
	        		width = 15;
	        	}
	        	}
        		spacer;


        		:row {
        			:column {
					:row {
						:edit_box {
			      				label = "Layer arco  :";
			       				key = "txtLayerArco";
			       				width = 50;
						}
						:edit_box {
							label = "Cor";
							key = "txtCorArco";
							width = 10;

						}
					}
					
	        		}
        		}
  	        
        	}
	        	

	        :boxed_row {
	        	label = "Opções no momento da inserção";
			:column {
	        		:toggle {
		        		label = "Inserir cota?";
		        		key = "ch_Cota";
		        	
			        }
	        
		        }
		        :column {
	        		:toggle {
			        	label = "Arco?";
			        	key = "ch_Arco";
			        }


		        }

		        :column {
	        		:toggle {
			        	label = "Linha Reta?";
			        	key = "ch_Linha";
			        }


		        }		        

		        :column {
	        		:toggle {
			        	label = "Codificar?";
			        	key = "ch_Codificar";
			        }


		        }
		        
		        spacer;
		        spacer;
		        
	        }

	        spacer;
	        spacer;
	        
	        ok_cancel;
}

//;;this is the blinklayers.dcl
seleciona_layer : dialog {
  	label = "Selecione a Layer";
  	: row {
    		: list_box {
      			key = "txt_layer";
      			multiple_select = true;
      		}
  	}
	spacer;
	spacer;
	ok_cancel;
}

//para digitar texto na tela
texto_tela : dialog {
		label = "Digite o Texto";
		key = "txtTitulo";

		:row {
			:edit_box {
				label = "Digite:";
				key = "txtTexto";
				width = 50;
				allow_accept = true;

			}
			
		}
		spacer;
		ok_cancel;
	}



//Configurações ListNey
config_lisp : dialog {
   initial_focus = "txtFatorEscalaTextos"; 
	label = "Configurações LispNey";
		:row {
		:boxed_column {
			label = "Fator de escala em inserções";
	
		
					
			//campos
			:column {
				:edit_box {
					label = "Textos e cotas de Blocos:";
					key = "txtFatorEscalaTextos";
					edit_width = 3;
					fixed_width = true;
					alignment = right;
					//allow_accept = false;					

				}
						
				:edit_box {
					label = "Inserção de Blocos:";
					key = "txtFatorEscalaBlocos";
					edit_width = 3;
					fixed_width = true;
					alignment = right;					
					
				}
				spacer;
			}
			
		}
		
		:boxed_row {
			label = "Layers:";
			
			:column {
				:edit_box {
					label = "layer Paredes";
					key = "txtLayerParede";
					edit_width = 10;
					fixed_width = true;
					alignment = right;	
				}

				:edit_box {
					label = "Layer Detalhes";
					key = "txtLayerDetalhes";
					edit_width = 10;
					fixed_width = true;
					alignment = right;	
				}
			spacer;
		    }
						
			:column {
				:edit_box {
					label = "Cor:";
					key = "txtCorParede";
					edit_width = 3;
					fixed_width = true;
					alignment = right;	
				}

				:edit_box {
					label = "Cor:";
					key = "txtCorDetalhes";
					edit_width = 3;
					fixed_width = true;
					alignment = right;	
				}
			spacer;
			}
		}
		
		: column {
            : image {          // Drawing icon image will go here
                key = "icon";
                color = dialog_background;    // Invisible
                alignment = centered;
                height = 4;
                aspect_ratio = 1.4;
                fixed_height = true;
                fixed_width = true;
            }
            spacer_1;

        }
				
	}
	
spacer;
ok_cancel;
}




samp5 : dialog {				//dialog name
    label = "Configuração Lisp" ;		//Da o nome da Janela
 
    : row {					//Define uma Linha
 
       :boxed_radio_column {			//define radio column
       label = "Type" ;				//give it a label
 
        : radio_button {			//define radion button
     	  key = "rb1" ;				//give it a name
     	  label = "Bolt Holes &Site" ;		//give it a label
     	  value = "1" ;				//switch it on
        }					//end definition
 
     	: radio_button {			//define radio button
     	  key = "rb2" ;				//give it a name
     	  label = "Bolt Holes Sho&p" ;		//give it a label
     	}					//end definition
 
     	: radio_button {			//define radio button
     	  key = "rb3" ;				//give it a name
     	  label = "Bolt Holes &Hidden" ;	//give it a label
     	  }					//end definition
 
     	: radio_button {			//define radio button
     	  key = "rb4" ;				//give it a name
     	  label = "Bolt Holes &Ctsnk" ;		//give it a label
     	}					//end definition
 
     	: radio_button {			//define radio button
     	  key = "rb5" ;				//give it a name
     	  label = "Bolt Holes &Elevation" ;	//give it a label
     	  }					//end definition
 
     	: radio_button {			//define radion button
     	  key = "rb6" ;				//give it a name
     	  label = "Bolt Holes &Slotted" ;	//give it a label
     	}					//end definition
 
        }					//end radio column
 
        : boxed_column {			//define boxed column
        label = "&Layers";			//give it a label
 
     	: popup_list {				//define popup list
        key = "selections";			//give it a name
        value = "2" ;				//initial value
        }					//end list
 
       }					//end boxed column
 
       }					//end row
 
     ok_cancel ;				//predifined OK/Cancel
 
     : row {					//define row
		 : image {					//define image tile
		 key = "im" ;				//give it a name
		 height = 2.0 ;				//and a height
		 width = 1.0 ;				//and now a width
		 }						//end image
	 
		 : paragraph {				//define paragraph
	 
		 : text_part {				//define text
		 label = "Layer Selecionada";		//give it some text
		 }						//end text
	 
		 : text_part {				//define more text
		 label = "Continuação do Texto asdf";			//some more text
		 }						//end text
	 
		 }						//end paragraph
	 
     }						//end row
					
     }	
	 
	 
fabi : dialog{
	label= "Biblioteca 1.0 - ca.flausino@bol.com.br";
	:boxed_column{
		label= "Autor:";
		:text{
			label= "CLAUDINEY FLAUSINO";
		}
	:text{
		label= "Blocos para Arquitetura";
		key= "lbl_descricao";
		}
	:text{
		label= "(043) 9 8805-7567 - whatsap";
		}
	}
	spacer;
	:boxed_row{
		label= "SELECIONE O BLOCO :";
		key= "lbl_titulo";
		
		:column{
			:list_box{
				width= 20 ;
				key= "grupo";
				alignment = top;
			}
			
			:list_box{
				width = 20;
				key = "categoria";
				alignment = top;
			}
		}

		:list_box{
			width= 20 ;
			key= "bloco";
			fixed_width = true;
			alignment = top;
		}

		:image{
			height = 10;
			aspect_ratio= 1.5 ;
			key= "img1";
			fixed_height = true;
			alignment= top;
		}
		
		:column{
			:image{
				height = 5;
				aspect_ratio= 1.5 ;
				key= "img2";
				fixed_height = true;
				alignment= top;
			}
			:image{
				height = 5;
				aspect_ratio= 1.5 ;
				key= "img3";
				fixed_height = true;
				alignment= top;
			}
			:image{
				height = 5;
				aspect_ratio= 1.5 ;
				key= "img4";
				fixed_height = true;
				alignment= top;
			}
		}
		
	}
	spacer ;
ok_cancel ;
}

