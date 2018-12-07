<?php


/**
 * 
 */
class WebController extends Controller {
    
    /**
     * 
     */
    public function __construct(){
        parent::__construct();
        $this->layout = new HomeLayout();
        $this->layout->title = "PetLover";
    }
}

?>