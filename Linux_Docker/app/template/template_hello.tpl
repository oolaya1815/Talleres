<!DOCTYPE html>
<html lang="es">
<head>
<title>Hola, que tal {{nombre}}</title>
<meta charset="utf-8" />
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
    <header>
       <h1>Mi sitio web</h1>
       <p>Mi sitio web creado en html5</p>
    </header>
    <h2>Vamos a saludar</h2>
    % if nombre=="Mundo":
      <p> Hola <strong>{{nombre}}</strong></p>
    %else:
      <h1>Hola {{nombre.title()}}!</h1>
      <p>¿Cómo estás?
    %end
</body>
</html>