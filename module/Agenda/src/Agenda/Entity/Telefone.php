<?php
  namespace Agenda\Entity;
   
  use Doctrine\ORM\Mapping as ORM;
   
  /**
   * @ORM\Entity
   */
  class Telefone {
   
      /**
       * @ORM\Id
       * @ORM\GeneratedValue("AUTO")
       * @ORM\Column(type="integer")
       */
      private $id;
      
       /**
       * @ORM\Column(type="integer")
       */
      private $id_contato;
      
      /**
       * @ORM\Column(type="string", length=50)
       */
      private $descricao;
      /**
       * @ORM\Column(type="string", length=15)
       */
      private $numero;
      /**
       * @ORM\Column(type="decimal")
       */
      
      public function getId() {
          return $this->id;
      }
   
      public function setId($id) {
          $this->id = $id;
      }
      
      public function getId_Contato() {
          return $this->id_contato;
      }
   
      public function setId_Contato($id_contato) {
          $this->id_contrato = $id_contato;
      }
   
      public function getDescricao() {
          return $this->descricao;
      }
   
      public function setDescricao($descricao) {
          $this->descricao = $descricao;
      }
   
      public function getNumero() {
          return $this->numero;
      }
   
      public function setNumero($numero) {
          $this->numero = $numero;
      }
   
    public function exchangeArray($data)
    {
        $this->id     = (isset($data['id']))     ? $data['id']     : null;
        $this->id_contato     = (isset($data['id_contato']))     ? $data['id_contato']     : null;
        $this->descricao = (isset($data['descricao'])) ? $data['descricao'] : null;
        $this->numero  = (isset($data['numero']))  ? $data['numero']  : null;
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
     
  }