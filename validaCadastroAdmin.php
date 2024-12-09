<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "jobs";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}


$email = $_POST['email'];
$sql = "SELECT id FROM admin WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo "<div class='cadastrado'>E-mail já cadastrado!<button class='btn-cadastrado' onclick='window.history.back()'>Voltar</button></div>";
    echo "";
} else {
    
    $sql = "INSERT INTO admin (nome, email, senha, cpf, rg, dtNascimento, celular)
            VALUES (?, ?, ?, ?, ?, ?, ?)";

   
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die("Falha na preparação da declaração: " . $conn->error);
    }

    $stmt->bind_param("sssssss", $nome, $email, $senha, $cpf, $rg, $dt_nascimento, $celular);

    
    $nome = $_POST['nome'];
    $senha = $_POST['senha'];
    $cpf = $_POST['cpf'];
    $rg = $_POST['rg'];
    $dt_nascimento = $_POST['dtNascimento'];
    $celular = $_POST['celular'];

 
    if ($stmt->execute()) {

        echo "<script>setTimeout(function(){window.location.href='loginAdmin.php';}, 3000);</script>";
        echo "<div class='success'>Cadastro realizado com sucesso!</div>";
        echo "<div class='loader'></div>";
        echo "<div class='text'>Você será redirecionado para tela de login</div>";
    } else {
        echo "Erro ao cadastrar: " . $stmt->error;
    }

    $stmt->close();
}


$conn->close();
?>


<style>
.cadastrado{color:white;
    font-size:30px;
    text-align:center;
    margin:100px auto;
    display:flex;
    justify-content:center;
    flex-direction:column;
    align-items:center;
}
.btn-cadastrado{
    background:white;
    height:40px;
    width:150px;
    color:black;
    border:none;
    border-radius:10px;
    text-align:center;
    margin:40px auto;
    font-weight:600;
    
}
    body{background:black;}
    .loader {
    border: 16px solid #f3f3f3;
    border-top: 16px solid #3498db;
    border-radius: 50%;
    width: 120px;
    height: 120px;
    animation: spin 2s linear infinite;
    margin: 20px auto;
}


@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.success {
    font-size:30px;
    color: #00A6ED;
    padding: 10px;
    margin: 20px 0;
    text-align: center;
    margin-top:200px;
    font-weight:600;
    font-family:Roboto;
}

.text{
    font-size:30px;
    color: #00A6ED;
    padding: 10px;
    margin: 20px 0;
    text-align: center;
    margin-top:20px;
    font-weight:600;
    font-family:Roboto;
}

</style>

