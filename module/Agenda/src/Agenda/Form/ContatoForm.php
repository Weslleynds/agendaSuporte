<?php
namespace Agenda\Form;

use Zend\Form\Form;

class ContatoForm extends Form
{
    public function __construct($name = null)
    {
        // Nos iremos ignorar o nome passado
        parent::__construct('contato');
        $this->setAttribute('method', 'post');
        $this->add(array(
            'name' => 'id',
            'type' => 'Zend\Form\Element\Hidden',
        ));
        $this->add(array(
            'name' => 'nome',
            'type' => 'Zend\Form\Element\Text',
            'options' => array(
                'label' => 'Nome',
            ),
        ));
        $this->add(array(
            'name' => 'empresa',
            'type' => 'Zend\Form\Element\Text',
            'options' => array(
                'label' => 'Empresa',
            ),
        ));
        $this->add(array(
            'name' => 'submit',
            'type' => 'Zend\Form\Element\Submit',
            'attributes' => array(
                'value' => 'Go',
                'id' => 'submitbutton',
                'class' => 'btn btn-default btn-small',
            ),
        ));
    }
}