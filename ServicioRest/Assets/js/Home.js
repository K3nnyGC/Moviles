function tc(id,color,p){
	$("#"+id+p).css("color",color);
}

function pintar(matriz,color){
	for (var i = matriz.length - 1; i >= 0; i--) {
		tc(matriz[i],color);
	}
}

function vyp(matriz,c1,c2,p){
	for (var i = matriz.length - 1; i >= 0; i--) {
		if (is.empty($("#"+matriz[i]).val())) {
			tc(matriz[i],c1,p);
		} else {
			tc(matriz[i],c2,p);
		}
	}
}

function vya(a,c1,c2,m){
	b = 0;
	for (var i = a.length - 1; i >= 0; i--) {
		if (is.empty($("#"+a[i]).val())) {
			tc(a[i],c1,"");$("#"+a[i]).notify(m);b=b+1;
		} else {
			tc(a[i],c2,"");
		}
	}
	if (b>0) {
		return false;
	} else {
		return true;
	}
}


function valruc(valor){
  valor = trim(valor)
  if ( is.number( parseInt(valor) ) ) {
    if ( valor.length == 8 ){
      suma = 0
      for (i=0; i<valor.length-1;i++){
        digito = valor.charAt(i) - '0';
        if ( i==0 ) suma += (digito*2)
        else suma += (digito*(valor.length-i))
      }
      resto = suma % 11;
      if ( resto == 1) resto = 11;
      if ( resto + ( valor.charAt( valor.length-1 ) - '0' ) == 11 ){
        return true
      }
    } else if ( valor.length == 11 ){
      suma = 0
      x = 6
      for (i=0; i<valor.length-1;i++){
        if ( i == 4 ) x = 8
        digito = valor.charAt(i) - '0';
        x--
        if ( i==0 ) suma += (digito*x)
        else suma += (digito*x)
      }
      resto = suma % 11;
      resto = 11 - resto
      
      if ( resto >= 10) resto = resto - 10;
      if ( resto == valor.charAt( valor.length-1 ) - '0' ){
        return true
      }      
    }
  } else {
  	return valor;
  }
  return false
}

function trim(cadena){
  cadena2 = "";
  len = cadena.length;
  for ( var i=0; i <= len ; i++ ) if ( cadena.charAt(i) != " " ){cadena2+=cadena.charAt(i);	}
  return cadena2;
}


function onlynum(e){
          tecla = (document.all) ? e.keyCode : e.which;

          //Tecla de retroceso para borrar, siempre la permite
          if (tecla==8){
              return true;
          }
              
          // Patron de entrada, en este caso solo acepta numeros
          patron =/[0-9.]/;
          tecla_final = String.fromCharCode(tecla);
          return patron.test(tecla_final);
      }
