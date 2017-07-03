<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController
{
public function indexAction()
      {
          $request = $this->getRequest();
          $result = array();
          if($request->isPost())
          {
              try{
                  $nome = $request->getPost("nome");
                  $cpf = $request->getPost("cpf");
                  $salario = $request->getPost("salario");
   
                  $funcionario = new \Application\Model\Funcionario();
                  $funcionario->setNome($nome);
                  $funcionario->setCpf($cpf);
                  $funcionario->setSalario($salario);
   
                  $em = $this->getServiceLocator()->get('DoctrineORMEntityManager');
                  $em->persist($funcionario);
                  $em->flush();
   
                  $result["resp"] = $nome. ", enviado corretamente!";
              }  catch (Exception $e){
                  
              }
          }
          
          return new ViewModel($result);
      }
}
