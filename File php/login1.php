<HTML>
    <HEAD>
		<style>
			input.left {
				float:left;
				border-radius: 12px;
			}
			input.right {
				float:right;
				border-radius: 12px;
			}
		</style>
    </HEAD>
    <BODY> 

	<?php 
		session_start();
		if(isset($_SESSION['usr'])) {
			$now=<<<NOW
			<form action="home.php" method="POST">
			<input class="left" type="submit" value="Accedi">
			</form>
NOW;
			echo "Premi il pulsante per accedere al sito";
			print($now);
		} else {
            $conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
            if (!$conn){
                echo 'Connessione al database fallita.';
                exit();
                //die('Connessione al database fallita.');
            } else if (isset($_POST['username']) and isset($_POST['pwd'])) {
                //echo "Connessione riuscita."."<br/>";
                $u = $_POST["username"];
                $p = $_POST["pwd"];

                $query="SELECT * FROM Login WHERE username = '$u' AND password = '$p'";
                $result =  pg_query($conn, $query);
                
                if (!$result) {
                    echo "Si è verificato un errore.<br/>";
                    echo pg_last_error($conn);
                    exit();
                } else {
                    $bdu = '';

                    while($row = pg_fetch_array($result)) {
                        $bdu = $row['username'] . $row['password'];
                    } ;
                    echo trim($bdu);

                    $v = '';
                    $v = $u . " " . $p;

                    echo trim($v);

                    if (trim($v) == trim($bdu) ) {
                        $username = $_POST["username"];
                        $_SESSION['usr']=$username;
                        $now=<<<NOW
                        <form action="home.php" method="POST">
                        <input class="left" type="submit" value="Continua">
                        </form>
        NOW;
                        echo "Premi il pulsante per accedere al sito";
                        print($now);
                    } else {
                        $name = $_POST['username']; 
                        echo "Utente ".$name." la password o lo username che hai inserito non risultano essere valide.<br>";
                        echo "Se vuoi puoi <a href='login.html'>riprovare</a> ad accedere.";
                    } 
                }
            }  else {
                echo "Non risultano dati passati o memorizzati in una variabile di sessione valida<br>";
                echo "Se vuoi puoi <a href='login.html'>riprovare</a> ad accedere";
            }
		}
	?> 
    </BODY>
</HTML>
