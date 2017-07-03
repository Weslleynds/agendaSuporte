<?php

namespace Agenda\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Agenda\Model\Telefone as telefonemodel;
use Agenda\Entity\Telefone as telefoneentidade;
use Agenda\Form\TelefoneForm as telefoneform;

class TelefoneController extends AbstractActionController {
/*
    public function indexAction() {
    
        $id_contato = (int) $this->params()->fromRoute('id_contato', 0);
        if (!$id_contato) {
            return $this->redirect()->toRoute('contato', array('action' => 'index'));
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $contato = $em->getRepository('Agenda\Entity\Contato')->find($id_contato);
            
            if (!$contato){
                return $this->redirect()->toRoute('contato', array('action' => 'index'));
            }
            $telefones = $em->getRepository('Agenda\Entity\Telefone')->findBy(array ( 'id_contato'  =>  $id_contato ));
            
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('contato', array('action' => 'index'));
        }
        
        return new ViewModel(array('telefones' => $telefones));
    }
*/
    
    public function indexAction(){

        $id_contato = (int) $this->params()->fromRoute('id_contato', 0);
        if (!$id_contato) {
                    $viewModel = new ViewModel();
                    $viewModel->setTerminal(true); // desabilita a renderizacao do layout
                    return $viewModel;
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $contato = $em->getRepository('Agenda\Entity\Contato')->find($id_contato);
            
            if (!$contato){
                    $viewModel = new ViewModel();
                    $viewModel->setTerminal(true); // desabilita a renderizacao do layout
                    return $viewModel;
            }
            
            $telefones = $em->getRepository('Agenda\Entity\Telefone')->findBy(array ( 'id_contato'  =>  $id_contato ));
            
        } catch (\Exception $ex) {
            $viewModel = new ViewModel();
            $viewModel->setTerminal(true); // desabilita a renderizacao do layout
            return $viewModel;
        }
        
        if($this->getRequest()->isXmlHttpRequest()) {
            $viewModel = new ViewModel(array('telefones' => $telefones));
            $this->layout('agenda/layout/ajax-layout');
            $viewModel->setTerminal(false);
            return $viewModel;
        }
     
        $viewModel = new ViewModel(array('telefones' => $telefones));
        $viewModel->setTerminal(true); // desabilita a renderizacao do layout
        return $viewModel;
        
    }
    
    
    public function addAction() {

        $form = new telefoneform();
        $form->get('submit')->setValue('Adicionar');
        $form->get('id_contato')->setValue($id_contato = (int) $this->params()->fromRoute('id_contato', 0));
        $request = $this->getRequest();

        if ($request->isPost()) {
            $telefone_entidade = new telefoneentidade();
            $telefone_model = new telefonemodel();
            $form->setInputFilter($telefone_model->getInputFilter());
            $form->setData($request->getPost());
            

            if ($form->isValid()) {
                error_log(print_r($form->getData(),true));
                $telefone_entidade->exchangeArray($form->getData());
                $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
                $em->persist($telefone_entidade);
                $em->flush();
                return $this->redirect()->toRoute('contato');
            }
        }

        return array('form' => $form,
            'id_contato' => $id_contato
            
                    );
    }

    public function editAction() {

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->redirect()->toRoute('telefone', array('action' => 'add'));
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $telefone = $em->getRepository('Agenda\Entity\Telefone')->find($id);
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('telefone', array('action' => 'index'));
        }

        $telefone_array = array("id"=>$telefone->getId(), "id_contato"=>$telefone->getId_Contato(), 
                                "descricao"=>$telefone->getDescricao(),"numero"=>$telefone->getNumero());

        $json_telefone_array = json_encode($telefone_array);
        
        $request = $this->getRequest();

        if ($request->isPost()) {
            
            $form = new telefoneform();
            $form->bind($telefone);
            $telefone_model = new telefonemodel();
            $form->setInputFilter($telefone_model->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
                $em->merge($telefone);
                $em->flush();
                return $this->redirect()->toRoute('contato');
            }
        }
        return die (json_encode($json_telefone_array));
    }

    public function deleteAction() {

        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute('contato');
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $telefone = $em->getRepository('Agenda\Entity\Telefone')->find($id);
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('contato', array('action' => 'index'));
        }
        $request = $this->getRequest();
        if ($request->isPost()) {
                $em->remove($telefone);
                $em->flush();
            }
            return $this->redirect()->toRoute('contato');
        
        return array(
            'id' => $id
        );
    }
}
