<?php 

/**
 * 
 */
class WorkStationLayout extends Layout{
	
	function __construct(){
		parent::__construct();
		$this->title = __CLASS__;
		$this->view = new HomeView();
		$this->menu_v = new VerticalMenuView();
		$this
			->setCss(["Comun","Home","MatDes","awfo5/css/all","jqd","WorkStation"])
			->setJs(["Home","MatDes","jq","noti","is","jqd"])
			->setJsFooter(["HomeEnd","WorkStationEnd"]);
	}

	public function putBody(){
		?>
			<body>
				<div id="panel-menu">
					<?php $this->menu_v->printview(); ?>
				</div><div id="panel-content">
						<div id="content-1">
							<div class="row margin-bottom-cero">
								<div class="col s12">
									<div class="card margin-bottom-cero">
										Sistema contable &copy;2018
									</div>
								</div>
							</div>
							<?php $this->view->namepanel->printview(); ?>
							
						</div>
						<div id="content-2">
							<?php 
							$this->showErrors();
							$this->putHeader();
							$this->putContent();
							$this->putFooter();
							?>
						</div>
					
				</div>
				<script>
					$("#panel-content").height($( window ).height());
					$("#panel-menu").height($( window ).height());
					$("#content-2").height($( window ).height()-$("#content-1").height());
				</script>
			</body>
		<?php
	}



}

?>