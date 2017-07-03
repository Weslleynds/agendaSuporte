<?php

namespace Agenda\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Agenda\Model\Agenda as agendamodel;
use Agenda\Entity\Agenda as agendaentidade;
use Agenda\Form\AgendaForm as agendaform;

class AgendaController extends AbstractActionController {

    public function indexAction() {

        $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
        $agendas = $em->getRepository('Agenda\Entity\Agenda')->findAll();
        return new ViewModel(array('agendas' => $agendas));
    }

    public function addAction() {

        $form = new agendaform();
        $form->get('submit')->setValue('Adicionar');
        $request = $this->getRequest();

        if ($request->isPost()) {
            $agenda_entidade = new agendaentidade();
            $agenda_model = new agendamodel();

            $form->setInputFilter($agenda_model->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $agenda_entidade->exchangeArray($form->getData());
                $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
                $em->persist($agenda_entidade);
                $em->flush();
                return $this->redirect()->toRoute('agenda');
            }
        }

        return array('form' => $form);
    }

    public function editAction() {

        $id = (int) $this->params()->fromRoute('id', 0);

        if (!$id) {
            return $this->redirect()->toRoute('agenda', array('action' => 'add'));
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $agenda = $em->getRepository('Agenda\Entity\Agenda')->find($id);
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('agenda', array('action' => 'index'));
        }

        $form = new agendaform();
        $form->bind($agenda);
        $form->get('submit')->setAttribute('value', 'Editar');

        $request = $this->getRequest();

        if ($request->isPost()) {

            $agenda_model = new agendamodel();
            $form->setInputFilter($agenda_model->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
                $em->merge($agenda);
                $em->flush();
                return $this->redirect()->toRoute('agenda');
            }
        }
        return array(
            'id' => $id,
            'form' => $form
        );
    }

    public function deleteAction() {

        $id = (int) $this->params()->fromRoute('id', 0);
        if (!$id) {
            return $this->redirect()->toRoute('agenda');
        }
        try {
            $em = $this->getServiceLocator()->get('Doctrine\ORM\Entity\Manager');
            $agenda = $em->getRepository('Agenda\Entity\Agenda')->find($id);
        } catch (\Exception $ex) {
            return $this->redirect()->toRoute('agenda', array('action' => 'index'));
        }
        $request = $this->getRequest();
        if ($request->isPost()) {
            $del = $request->getPost('del', 'Não');
            if ($del == 'Sim') {
                $id = (int) $request->getPost('id');
                $em->remove($agenda);
                $em->flush();
            }
            return $this->redirect()->toRoute('agenda');
        }
        return array(
            'id' => $id,
            'agenda' => $agenda
        );
    }

}
