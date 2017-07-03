<?php

namespace Agenda\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Agenda\Model\Contato as contatomodel;
use Agenda\Entity\Contato as contatoentidade;
use Agenda\Form\ContatoForm as contatoform;
use Agenda\Entity\Telefone as telefoneentidade;
use Agenda\Form\TelefoneForm as telefoneform;

class ContatoController extends AbstractActionController {

    public function indexAction() {

        $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
        $contatos = $em->getRepository('Agenda\Entity\Contato')->findAll();
        return new ViewModel(array('contatos' => $contatos));
    }

    public function addAction() {

        $form = new contatoform();
        $form->get('submit')->setValue('Salvar');
        $request = $this->getRequest();

        if ($request->isPost()) {
            $contato_entidade = new contatoentidade();
            $contato_model = new contatomodel();

            $form->setInputFilter($contato_model->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $contato_entidade->exchangeArray($form->getData());
                $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
                $em->persist($contato_entidade);
                $em->flush();
                return $this->redirect()->toRoute('contato',array('action' => 'edit', 'id' => $contato_entidade->getId()));
            }
        }
        return array('form' => $form);
    }

    public function editAction() {

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->redirect()->toRoute('contato', array('action' => 'add'));
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $contato = $em->getRepository('Agenda\Entity\Contato')->find($id);
            
            if (!$contato)
            {
                return $this->redirect()->toRoute('contato', array('action' => 'add'));
            }
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('contato', array('action' => 'index'));
        }

        $form = new contatoform();
        $form->bind($contato);
        $form->get('submit')->setAttribute('value', 'Salvar');

        $request = $this->getRequest();

        if ($request->isPost()) {
            $contato_model = new contatomodel();
            $form->setInputFilter($contato_model->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
                $em->merge($contato);
                $em->flush();
                return $this->redirect()->toRoute('contato');
            }
        }
        
        return new ViewModel(array(
            'id' => $id,
            'form' => $form
        ));
    }

    public function deleteAction() {

        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute('contato');
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $contato = $em->getRepository('Agenda\Entity\Contato')->find($id);
            $telefones = $em->getRepository('Agenda\Entity\Telefone')->findBy(array('id_contato' => $id));
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('contato', array('action' => 'index'));
        }
        $request = $this->getRequest();
        if ($request->isPost()) {
            $del = $request->getPost('del', 'Não');
            if ($del == 'Sim') {
                $id = (int) $request->getPost('id');
                for ($i = 0; $i < count($telefones); $i++) {
                    $em->remove($telefones[$i]);
                    $em->flush();
                }
                $em->remove($contato);
                $em->flush();
            }
            return $this->redirect()->toRoute('contato');
        }
        return array(
            'id' => $id,
            'contato' => $contato
        );
    }

}
