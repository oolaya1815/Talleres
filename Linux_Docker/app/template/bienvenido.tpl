<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Bottle web project template">
	<meta name="author" content="datamate">
	<link rel="icon" href="/static/favicon.ico">
	<title>Project</title>
	<link rel="stylesheet" type="text/css" href="/static/bootstrap.min.css">
	<script type="text/javascript" src="/static/jquery.min.js"></script>
	<script type="text/javascript" src="/static/bootstrap.min.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="https://github.com/oolaya1815/Talleres/tree/main/Linux_Docker/Instalacion">Project</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="../">Home</a></li>
						<li><a href="../register">Registrarse</a></li>
						<li><a href="../acceso">Acceder</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
			<h2>Bienvenido  {{data}}</h2><p></p>
				<form action="/upload" method="post" enctype="multipart/form-data">
				<div>
				Id del Paciente:      <input type="text" name="category" /></div><p></p>
				<div>
				<!-- Seleccione su archivo:--> <input type="file" name="upload" /></div><p></p>
				<div>
				<input type="submit" value="Subir foto" /></div>
				</form>
			</div>
		</div>
		<!--./row-->
		<div class="row">
			<hr>
			<footer>
				<p>&copy; 2021 ADNBIT.</p>
			</footer>
		</div>
	</div>
	<!-- /container -->
</body>
</html>
