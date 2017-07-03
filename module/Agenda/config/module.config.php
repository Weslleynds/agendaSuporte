<?php

namespace Agenda;

return array(
    'controllers' => array(
        'invokables' => array(
            'Agenda\Controller\Contato' => 'Agenda\Controller\ContatoController',
            'Agenda\Controller\Telefone' => 'Agenda\Controller\TelefoneController',
        ),
    ),

    // A seção a seguir é nova e deve ser adicionada ao arquivo
    'router' => array(
        'routes' => array(
            'contato' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '/contato[/][:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Agenda\Controller\Contato',
                        'action'     => 'index',
                    ),
                ),
            ),
            'telefone' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '[/contato/:id_contato]/telefone[/][:action][/:id]',
                    'constraints' => array(
                        'id_contato'     => '[0-9]+',
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Agenda\Controller\Telefone',
                        'action'     => 'index',
                    ),
                ),
            ),
            
            
        ),
    ),

    'view_manager' => array(
        'template_path_stack' => array(
            'agenda' => __DIR__ . '/../view',
        ),
    ),
    
   'doctrine' => array(
        'driver' => array(
            'Agenda_driver' => array(
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'array',
                'paths' => array(__DIR__ . '/src/Agenda/Entity')
            ),
            'orm_default' => array(
                'drivers' => array(
                    'Agenda\Entity' => 'Agenda_driver'
                )
            )
        )
    ),
);