<?php
namespace Agenda\Form;

use Zend\Form\Form;

class TelefoneForm extends Form
{
    public function __construct($name = null)
    {
        // Nos iremos ignorar o nome passado
        parent::__construct('telefone');
        $this->setAttribute('method', 'post');
        $this->add(array(
            'name' => 'id',
            'type' => 'Zend\Form\Element\Hidden',
        ));
        
        $this->add(array(
            'name' => 'id_contato',
            'type' => 'Zend\Form\Element\Hidden',
        ));
                
        $this->add(array(
            'name' => 'descricao',
            'type' => 'Zend\Form\Element\Text',
            'options' => array(
                'label' => 'Descricao',
            ),
        ));
        $this->add(array(
            'name' => 'numero',
            'type' => 'Zend\Form\Element\Text',
            'options' => array(
                'label' => 'Numero',
            ),
        ));
        $this->add(array(
            'name' => 'submit',
            'type' => 'Zend\Form\Element\Submit',
            'attributes' => array(
                'value' => 'Go',
                'id' => 'submitbutton',
            ),
        ));
    }
}