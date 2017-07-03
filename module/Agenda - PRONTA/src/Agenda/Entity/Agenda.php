<?php
  namespace Agenda\Entity;
   
  use Doctrine\ORM\Mapping as ORM;
   
  /**
   * @ORM\Entity
   */
  class Agenda {
   
      /**
       * @ORM\Id
       * @ORM\GeneratedValue("AUTO")
       * @ORM\Column(type="integer")
       */
      private $id;
      /**
       * @ORM\Column(type="string", length=50)
       */
      private $nome;
      /**
       * @ORM\Column(type="string", length=15)
       */
      private $empresa;
      /**
       * @ORM\Column(type="decimal")
       */
      
      public function getId() {
          return $this->id;
      }
   
      public function setId($id) {
          $this->id = $id;
      }
   
      public function getNome() {
          return $this->nome;
      }
   
      public function setNome($nome) {
          $this->nome = $nome;
      }
   
      public function getEmpresa() {
          return $this->empresa;
      }
   
      public function setEmpresa($empresa) {
          $this->empresa = $empresa;
      }
   
    public function exchangeArray($data)
    {
        $this->id     = (isset($data['id']))     ? $data['id']     : null;
        $this->nome = (isset($data['nome'])) ? $data['nome'] : null;
        $this->empresa  = (isset($data['empresa']))  ? $data['empresa']  : null;
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
     
  }