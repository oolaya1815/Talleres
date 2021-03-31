import os, sys, pymysql
from bottle import Bottle,route,run,request,template, static_file, redirect

# Conexion base de datos

db = pymysql.connect(host='db1', user='root', password='1234', database='appdb', charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor)
cursor = db.cursor()

# pantalla de inicio

@route('/static/<filename:re:.*\.css>')
def send_css(filename):
	return static_file(filename, root='static/asset/css')

@route('/static/<filename:re:.*\.js>')
def send_js(filename):
	return static_file(filename, root='static/asset/js')

@route('/')
def index():
	data = {"developer_name":"ADNBIT",
			"developer_organization":"ADNBIT"}
	return template('template/index.tpl', data = data)

# Prueba del servidor
@route('/<name>')
def hello(name='Mundo'):
    return template('template/template_hello.tpl', nombre=name)

# Version del backend para IA
@route('/version')
def version():
    return template('template/iaversion.tpl')

# Conexion DB
@route('/db')
def datos():
    return redirect('http://192.168.100.10:8081')

# para que se vea archivos estaticos de imagenes
@route('/images/<filename>')
def server_static(filename):
    return static_file(filename, root='images')

# Acceso a la apliacion

@route('/acceso')
def acceso():
    return template('template/acceso.tpl')

@route('/acceso',method='POST')
def acceso():
    username = request.forms.get('username')
    password = request.forms.get('password')
    sql = "SELECT `password` FROM `user` WHERE `username`=%s"
    if cursor.execute(sql, (username,)) == 1 :
        result = cursor.fetchone()
        if password == result.get('password'):
            return template('template/bienvenido.tpl', data = username)
        else:
            return "<p>Login failed.</p>"
    else:
        return "<p>Login failed.</p>"

# Registrar usuarios

@route('/register')
def register():
    return template('template/register.tpl', mensaje="")

@route('/register',method='POST')
def do_register():
    username = request.forms.get('username')
    password = request.forms.get('password')
    email = request.forms.get('email')

    ''' Si alguno de los campos ingresados es vacio, se enviara a registrarse
    nuevamente, ademas con el mensaje de campo vacio, en caso contrario se
    procedera a grabar los campos en la base de datos'''

    if username != "" and password != "" and email != "" :
        sql = "insert into user(username, password, email) values (%s,%s,%s)" # secuencia para insertar valores en la base de datos
        val = (username,password,email) # valores a insertar
        cursor.execute(sql,val) # comando para generar el comando
        db.commit() # ejecucion del comando en la base de datos
        return template('template/bienvenido.tpl', data = username) # se envia data con el valor que contiene username al template
    else:
        return template('template/register.tpl', mensaje="Se ingreso un campo vacio, vuelva a intentarlo")

# Subir archivos

@route('/upload', method='POST')
def do_upload():
    category = request.forms.get('category') # se almacena el nombre de la categoria
    upload = request.files.get('upload') # se almacena el archivo
    name, ext = os.path.splitext(upload.filename) # se separa el nombre y extencion
    if ext not in ('.png', '.jpg', '.jpeg'):
        return "File extension not allowed."

    save_path = "images/{category}".format(category=category)
    if not os.path.exists(save_path):
        os.makedirs(save_path)

    file_path = "{path}/{file}".format(path=save_path, file=upload.filename)
    upload.save(file_path)
    if category == "": # si la categoria es vacia
        print(save_path+upload.filename) # nos da la ruta con nombre completa del archivo
    else: # si hay categoria
        print(save_path+"/"+upload.filename) # nos da la ruta con nombre completa del archivo

    return template('template/cargar.tpl', figura=upload.filename)

run(host='0.0.0.0', port=8080, reloader=True)
