<?php
	namespace CNAB\Controller;
	
	use Zend\Mvc\Controller\AbstractActionController;
	use Zend\View\Model\ViewModel;
	
	class CNABController extends AbstractActionController
	{	
		public function indexAction()
		{
			return new ViewModel();
		}
		
	}
?>