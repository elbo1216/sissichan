<?php /**/ ?><?php
$headers  = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

$senderName      = $_POST['name'];
$senderPhone     = $_POST['phone'];
$senderEmail     = $_POST['email'];
$senderSubject   = $_POST['subject'];
$senderEventDate = $_POST['eventDate'];
$senderMsg       = nl2br($_POST['body']);
$sitename        = "www.sissichan.com";
$to              = "sissichan@gmail.com";
$ToName          = "Your name";
$date            = date("m/d/Y H:i:s");
$ToSubject       = "Email From $senderName via $sitename";
$comments        = $msgPost;
$EmailBody       = "A visitor to $sitename has left the following information<br />
                Sent By: $senderName<br />
                                Phone: $senderPhone
                                <br /><br />
                                Message Sent:
                                <br /><br />
                                Event Date: $senderEventDate
                                <br /><br />
                                Subject: $senderSubject
                                <br />$senderMsg<br /><br />


                                <br />";
$EmailFooter    = "<br />Sent: $date<br /><br />";
$Message                = $EmailBody.$EmailFooter;
//$ok = mail($to, $ToSubject, $Message, $headers . "From:$senderName <".$to.">");
$ok = mail($to, $ToSubject, $Message, $headers . "From:$senderName <".$senderEmail.">");
if($ok){
        echo "retval=1";
}else{
        echo "retval=0";
}

?>

