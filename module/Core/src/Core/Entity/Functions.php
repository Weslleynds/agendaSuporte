<?php

namespace Core\Entity;

use Zend\Mail;
use Zend\Mime\Message as MimeMessage;
use Zend\Mime\Part as MimePart;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
use Zend\Mime;

class Functions
{
    public static function convertDate($date, $showtime = false)
    {
            $date_str = substr($date,8,2)."/".substr($date,5,2)."/".substr($date,0,4);
            if( $showtime ) $date_str .= " ".substr($date,11,8);
            return $date_str;
    }
    
    public static function convertDateMSSQL($date, $showtime = false)
    {
            if ((substr($date, 2,1) == '/') && (substr($date, 5,1) == '/'))
            {
                $date_str = substr($date,6,4)."-".substr($date,3,2)."-".substr($date,0,2);
                if( $showtime ) $date_str .= " ".substr($date,11,8);
                return $date_str;
            }
            else
                return $date;
    }
    
    public static function numToStr(&$field)
    {
            if(!strstr($field,','))
            {
                    $field = number_format($field,2,',','.');
            }
            return $field;
    }
    
    
    /*TODO: Tornar parametrizável o tipo do anexo do e-mail*/
    public static function sendMail($smtp, $port, $userName, $password, $fromMessage, $fromMessageName, $toMessage, $toMessageName, $subject, $body, $pathToAttachment, $type)
    {
        try
        {
            $mail = new Mail\Message();

            $bodyPart = new MimeMessage();
                
            if($pathToAttachment != '')
            {
                $attachment = new MimePart(fopen($pathToAttachment, 'r'));
                $attachment->type = $type;
                $attachment->filename = $pathToAttachment;
                $attachment->disposition = 'attachment';
                $attachment->encoding = Mime\Mime::ENCODING_BASE64;
                $attachment->charset = 'iso-8859-1';
            }

            $bodyMessage = new MimePart($body);
            $bodyMessage->type = 'text/html';

            $bodyPart->setParts(array($bodyMessage, $attachment));
            
            $mail->setTo($toMessage, $toMessageName)
                 ->setFrom($fromMessage, $fromMessageName)
                 ->setSubject($subject)
                 ->setBody($bodyPart); 
            
            $transport = new SmtpTransport();
            $options   = new SmtpOptions(array(
                'name'              => $smtp,
                'host'              => $smtp,
                'port'              => $port,
                'connection_class'  => 'login',
                'connection_config' => array(
                    'username' => $userName,
                    'password' => $password,
                ),
            ));
            $transport->setOptions($options);
            $transport->send($mail);
            
            return 'E-mail enviado com sucesso';
        }
        catch (\Exception $e)
        {
            return "Falha ao enviar o e-mail. Erro: ".$e->getMessage();
        }
    }
    
    public static function createFile($filename, $content)
    {
        // Abre o arquivo para leitura e escrita
        $f = fopen($filename, "w+");

        // Escreve no arquivo
        fwrite($f, $content);

        // Libera o arquivo
        fclose($f);
    }
    
    public static function deleteFile($filename)
    {
        if(file_exists($filename))
            unlink($filename);
    }
}
?>
