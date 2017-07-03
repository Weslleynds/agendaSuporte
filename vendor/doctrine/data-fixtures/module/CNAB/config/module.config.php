<?php

	
	return array(
			'controllers' => array(
					'invokables' => array(
							'CNAB\Controller\CNAB' => 'CNAB\Controller\CNABController',
					),
			),
			'router' => array(
					'routes' => array(
							'cnab' => array(
									'type' => 'segment',
									'options' => array(
											'route' => '/cnab[/:action][/:id]',
											'constraints' => array(
													'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
													'id' => '[0-9]+',
											),
											'defaults' => array(
													'controller' => 'CNAB\Controller\CNAB',
													'action' => 'index',
											),
									),
							),
					),						
			),
			'view_manager' => array(
					'template_path_stack' => array(
							'admin' => __DIR__ . '/../view',
					),
			),
                        'doctrine' => array(
				'driver' => array(
						__NAMESPACE__.'_driver' => array(
								'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
								'cache' => 'array',
								'paths' => array(
										__DIR__.'/../src/'.__NAMESPACE__.'/Entity'
										)
								),
						'orm_default' => array(
								'drivers' => array(
										__NAMESPACE__.'\Entity' => __NAMESPACE__.'_driver' 
										)
								)
						)
				)
	);
?>