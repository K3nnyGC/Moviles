<?php 

/**
 * 
 */
class AdvertisementView extends View {
	
	function __construct(){
		parent::__construct();
	}

	public function printview(){
	    /*
		if (!$this->checkAccess()) {
			return false;
		}
		if (!$this->error) {
			return false;
		}
		*/
		?>
		<div class="row">
		    <?php
		        foreach ($this->getData() as $value) {
		            ?>
		            <div class="col s12 m7">
		                <div class="card">
                            <div class="card-image">
                              <img src="data:image/png;base64,<?php echo $value->image; ?>">
                              <span class="card-title"><?php echo $value->title; ?></span>
                            </div>
                            <div class="card-content">
                              <p><?php echo $value->description; ?></p>
                            </div>
                            
                          </div>
		            </div>
		            <?php
		        }
		    ?>
		    
		</div>
		<?php
	}

	private function getData(){
	    $am = new AdvertisementManager();
	    return $am->show();
	}
}


?>