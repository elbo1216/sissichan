<?php /**/ ?><?php
$headers  = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

if($_POST['unique_id'] != "aWdvsFwevcrg42grw23WDF"){
       echo"not sent";
       exit;
}

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
$EmailBody       = "<i>A visitor to $sitename has left the following information</i><br />
                <b>Sent By:</b> $senderName<br />
                                <b>Phone:</b> $senderPhone
                                <br />
                                <b>Event Date:</b> $senderEventDate
                                <br />
                                <b>Message Sent:</b>
                                <br /><br />
                                <b>Subject:</b> $senderSubject
                                <br /><br />
                                <br />$senderMsg<br /><br />


                                <br />";
$EmailFooter    = "<br />Sent: $date<br /><br />";
$Message                = $EmailBody.$EmailFooter;
//$ok = mail($to, $ToSubject, $Message, $headers . "From:$senderName <".$to.">");
$ok = mail($to, $ToSubject, $Message, $headers . "From: $senderName\r\nReply-To: " .$senderEmail);
//$ok = mail("elbo1216@gmail.com", "test", $_POST['unique_id'], $headers);
if($ok){
        echo "retval=1";
}else{
        echo "retval=0";
}

?>

