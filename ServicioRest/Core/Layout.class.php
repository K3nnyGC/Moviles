<?php 

/**
 * 
 */
class Layout {
	
	function __construct(){
		$this->cssFiles = [];#Hojas de estilo por defecto
		$this->jsFiles = [];#Java Script por defecto
		$this->jsFilesFooter = [];#Java Script por defecto al final del documento
		$this->title = __CLASS__;
		$this->view = new View();
		$this->errors = [];
		
	}

	public function deploy(){
		?>
		<!DOCTYPE html>
		<html>
			<?php
				$this->putHead();
				$this->putBody();
			?>
		</html>
		<?php
	}

	public function putHead(){
		?>
		<head>
			<title><?php echo $this->title; ?></title>
			<meta name='viewport' content='width=device-width, initial-scale=1'/>
			<link rel="icon" type="image/png" href="../Assets/img/icon.png" />
			<?php
				$this->putCss();
				$this->putJs();
			?>
		</head>
		<?php
	}

	public function setCss($cssFiles=[]){
		foreach ($cssFiles as $key => $value) {
			$this->cssFiles[]=$value;
		}
		return $this;
	}

	public function setJs($jsFiles=[]){
		foreach ($jsFiles as $key => $value) {
			$this->jsFiles[]=$value;
		}
		return $this;
	}

	public function setJsFooter($jsFiles=[]){
		foreach ($jsFiles as $key => $value) {
			$this->jsFilesFooter[]=$value;
		}
		return $this;
	}


	public function putCss(){
		foreach ($this->cssFiles as $key => $value) {
			?>
			<link rel="stylesheet" href="../Assets/css/<?php echo $value;?>.css">
			<?php
		}
	}

	public function putJs(){
		foreach ($this->jsFiles as $key => $value) {
			?>
			<script src="../Assets/js/<?php echo $value;?>.js"></script>
			<?php
		}
	}

	public function putJsFooter(){
		foreach ($this->jsFilesFooter as $key => $value) {
			?>
			<script src="../Assets/js/<?php echo $value;?>.js"></script>
			<?php
		}
	}

	public function putHeader(){
		?>
			<header></header>
		<?php
	}

	public function putFooter(){
		?>
			<footer>
				<?php $this->putJsFooter(); ?>
			</footer>
		<?php
	}

	public function putContent(){
		$this->view->printview();
		?>
			
		<?php
	}

	public function putBody(){
		?>
			<body>
				<?php 
				$this->showErrors();
				$this->putHeader();
				$this->putContent();
				$this->putFooter();
				?>
			</body>
		<?php
	}

	public function setTitle($title){
		$this->title=$title;
		return $this;
	}

	public function changeView($view){
		$this->view = $view;
	}

	public function addError($error){
		$this->errors[]=$error;
	}

	public function showErrors(){
		$view = new ErrorView();
		foreach ($this->errors as $key => $value) {
			$view->setError($value);
			$view->printview();
		}
	}
}

?>