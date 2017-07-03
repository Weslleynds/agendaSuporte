<?php

namespace CNAB\Entity;

use Doctrine\ORM\EntityManager;


class Documento
{
    protected $em;
	
    public function setEntityManager(EntityManager $em)
    {
            $this->em = $em;
    }
    
    public function getDocumentosEmAtraso()
    {
        $qb = $this->getEntityManager()->createNativeQuery(
        'exec dbo.GetFinanceiro :cod_emp, :cod_sub, null, "AT", "R", null, null, null, null,  
         null, null, null, null, :codPessoa, "CL", null, null, 0, null, null, 0, 1, null, null',  new ResultSetMapping());
        $qb->setParameters(array(
            'cod_emp' => 1,
            'cod_sub' => 1,
            'codPessoa' => 1
        ));
        
        $qb->execute();
        $em->flush();   
        
        return ResultSetMapping 
    }
    
    public function getEntityManager()
    {
        if($this->em === null){
                $this->em = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        }
        return $this->em;
    }
}

?>
