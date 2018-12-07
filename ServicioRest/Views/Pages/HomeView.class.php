<?php 

/**
 * 
 */
class HomeView extends View {
	
	function __construct(){
		parent::__construct();
		$this->login = new View();
		//$this->panel1 = new CardOptionView();
		//$this->panel2 = new CardOptionView();
		//$this->panel2->block = true;
	}

	public function printview(){
		if (!$this->checkAccess()) {
			return false;
		}
		?>
		
		
  <nav class="BG--default-primary-color">
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo" style="padding-left:10px;">
      	PetLover <img src="../Assets/img/logo.png" style="max-width:20px;"></img>
      </a>
      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="fas fa-bars"></i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="#">Notificaciones</a></li>
      </ul>
    </div>
  </nav>

  <ul class="sidenav" id="mobile-demo">
    <li><a href="#">Notificaciones</a></li>
  </ul>
  
  <script type="text/javascript" >
  	document.addEventListener('DOMContentLoaded', function() {
	    var elems = document.querySelectorAll('.sidenav');
	    var instances = M.Sidenav.init(elems, {});
	  });
  </script>
        
		
		
		<div class="row" style="
			margin-bottom: 0px;
    		padding-bottom: 0px;
    		margin-top: 20px
		">
			<div class="col s1 m3 l4"></div>
			<div class="col s10 m6 l4">
				<img src="../Assets/img/fondo.jpg" class="responsive-img"></img>
			</div>
			<div class="col s1 m3 l4"></div>
		</div>
		
		<div class="row">
			<div class="col s1 m3 l4"></div>
			<div class="col s10 m6 l4">
				<h5 class="center COLOR--accent-color" style="
				font-size: 52px;
    			font-weight: bold;
    			margin: 0px;
				">PetLover</h5>
			</div>
			<div class="col s1 m3 l4"></div>
		</div>
		
		<div class="row">
			
			<div class="col s12">
				
				<div class="row">
			
					<?php
					
					$ruta = "../Assets/img/mockup";
					$arreglo = ["SplashScreen" => "00.png",
								"Login" => "01.png",
								"Registro" =>"02.png",
								"Inicio" => "03.png",
								"Mis Anuncios" => "04.png",
								"Mensajes" => "05.png",
								"Nuevo Anuncio" => "06.png",
								"Registro de Coordenadas" => "07.png"];
					foreach ($arreglo as $key => $value) {
						$archivo = $value;
						?>
					    		<div class="col s6 m4 l3 xl2">
					    	<?php
					    	echo "<img src='{$ruta}/{$archivo}' class='materialboxed responsive-img' />";
					    	echo "<h5 class='center'><a href='{$ruta}/{$archivo}' target='_BLANK' class='COLOR--accent-color'>{$key} <i class='far fa-share-square'></i> </a></h5>";

					        ?>
					    		</div>
					    	<?php
					}

					?>
					<script type="text/javascript">
						document.addEventListener('DOMContentLoaded', function() {
						    var elems = document.querySelectorAll('.materialboxed');
						    var instances = M.Materialbox.init(elems, {});
						  });
					</script>
				</div>
				
			</div>
			
		</div>
		
		<footer class="page-footer BG--default-primary-color">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">PetLover</h5>
                <p class="grey-text text-lighten-4">Descarga la app de manera gratuita en fase Beta!</p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Descarga</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">Mirror 1</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Mirror 2</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Mirror 3</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Mirror 4</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            &copy; 2018 PetLover
            
            </div>
          </div>
        </footer>
		<?php
	}
}

?>