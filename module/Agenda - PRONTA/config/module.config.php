<?php

namespace Agenda;

return array(
    'controllers' => array(
        'invokables' => array(
            'Agenda\Controller\Contato' => 'Agenda\Controller\ContatoController',
        ),
    ),

    // A seção a seguir é nova e deve ser adicionada ao arquivo
    'router' => array(
        'routes' => array(
            'agenda' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '/agenda[/][:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Agenda\Controller\Agenda',
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