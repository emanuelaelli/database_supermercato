<html>
	<head>
		<title>Inserimento e cancellazione di un REPARTO</title>
		<link rel="stylesheet" type="text/css" href="stile.css">
	</head>

	<body>
	<p class="form">
	<?php
		if(isset($_POST['idata']) and $_POST['idata']=='View'){
			$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");

			if (!$conn){
				echo 'Connessione al database fallita.';
				exit();
				//die('Connessione al database fallita.');
			} else {
				//echo "Connessione riuscita."."<br/>";
				$query1="SELECT * FROM Reparto";
				$result1 =  pg_query($conn, $query1);
				echo '<table>
						<tr>
						<th>Nome</th>
						<th>Via del supermercato</td>
						<th>Numero civico del supermercato</th>
						</tr>';

				while($array=pg_fetch_assoc($result1)){
					echo '<tr>
						<td>'. $array['nome'].'</td>
						<td>'. $array['viasupermercato'].'</td>
						<td>'. $array['numcivsupermercato'].'</td>       		
					</tr>';
				}
				echo '</table>';
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
				echo "</form>";
				
			}
		}
		
		else if(isset($_POST['idata']) and $_POST['idata']=='Insert') {
			print("<table>");
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" required pattern=\"[a-zA-Z]{1,20}\" title=\"Sono ammessi solo caratteri\"></td></tr>");
			print("<tr><th>Via del supermercato</th><td><input type=\"text\" name=\"viasupermercato\" required pattern=/^[a-zA-Z_-.]{1,20}$ title=\"Sono ammessi solo caratteri\"></td></tr>");
			print("<tr><th>Numero civico del supermercato</th><td><input type=\"text\" name=\"numcivsupermercato\" required pattern=\"[0-9]{1,3}\" title=\"Sono ammessi solo numeri interi\"></td></tr>");
			print("<tr><td><input type=\"submit\" name=\"idata\" value=\"Send\"></td></tr>");
			print("</form>");
			print("</table>");
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
			echo "</form>";
    
		}
		
		else if( isset($_POST['idata']) and $_POST['idata']=='Send') {   
			$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");

			if (!$conn){
				echo 'Connessione al database fallita.';
				exit();
				//die('Connessione al database fallita.');
			} else {
				$nome=isset($_POST['nome'])?$_POST['nome']:'';
				$viasupermercato=isset($_POST['viasupermercato'])?$_POST['viasupermercato']:'';
				$numcivsupermercato=(isset($_POST['numcivsupermercato'])and is_numeric($_POST['numcivsupermercato']))?$_POST['numcivsupermercato']:0;

				$query2="INSERT INTO Reparto (nome, viasupermercato, numcivsupermercato) VALUES ('$nome','$viasupermercato',$numcivsupermercato)";
				$result2 = pg_query($conn,$query2);
				if ($result2){
					echo "Inserimento avvenuto con successo<br>";
				} else{
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					//exit();
				}
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<input type=\"submit\" name=\"idata\" value=\"View\">");
				print("<input type=\"submit\" name=\"idata\" value=\"Insert\">");
				print("<input type=\"submit\" name=\"idata\" value=\"Delete\">");

				print("</form>");
				print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");
    
			}
		} 

		else if(isset($_POST['idata']) and $_POST['idata']=='Delete') {
			$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
			if (!$conn){
				echo 'Connessione al database fallita.';
				exit();
				//die('Connessione al database fallita.');
			} else {
				//echo "Connessione riuscita."."<br/>";
				$query3="SELECT * FROM Reparto";
				$result3 =  pg_query($conn, $query3);
				
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"deletev\" onchange=\"myfunction();\">");
				while ($row = pg_fetch_array($result3)) {
					print("<option value=\"".htmlspecialchars($row["nome"]." ".$row["viasupermercato"])."\">");
					echo $row["nome"]." ".$row["viasupermercato"];
					print("</option>");					
				};
				print("<input id=\"idata\" type=\"submit\" name=\"idata\" value=\"Cancella\">");

				print("</form>"); 
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
				echo "</form>";
	 
				
			}
		}
		
		else if(isset($_POST['idata']) and $_POST['idata']=='Cancella') {

			$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
			if (!$conn){
				echo 'Connessione al database fallita.';
				exit();
				//die('Connessione al database fallita.');
			} else {
				//echo "Connessione riuscita."."<br/>";
				echo $_POST['deletev'];
				$selected=$_POST['deletev'];

				$query="DELETE FROM Reparto WHERE CONCAT(nome,' ',viasupermercato)='".$selected."';";
				$result = pg_query($query);
				if ($result){
					//$cmdtuples = pg_affected_rows($result);
					echo "Cancellazione avvenuta con successo<br>";
				}else{
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					//exit();
				}
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<input type=\"submit\" name=\"idata\" value=\"View\">");
				print("<input type=\"submit\" name=\"idata\" value=\"Insert\">");
				print("<input type=\"submit\" name=\"idata\" value=\"Delete\">");
				print("</form>");
				print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");
   
			}
		} else { //menu iniziale
			print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
			print("<input type=\"submit\" name=\"idata\" value=\"View\">");
			print("<input type=\"submit\" name=\"idata\" value=\"Insert\">");
			print("<input type=\"submit\" name=\"idata\" value=\"Delete\">");
			print("</form>");
			print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");    
		} 
			
	?>

		</p>
	</body>
</html>