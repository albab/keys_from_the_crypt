 <?php
 //pass email through url from iphone app = ababich@asu.edu
  $email = $_GET['email'];
  $url = 'http://pgp.mit.edu/pks/lookup?search='.$email.'&fingerprint=on';
  $output = file_get_contents($url);
  preg_match("'Fingerprint=(.*)'", $output, $match);
  echo $match[1];
?>