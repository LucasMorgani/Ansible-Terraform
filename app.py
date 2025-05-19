import os
import psycopg2
from flask import Flask, render_template

app = Flask(__name__)

# Pega as variáveis de ambiente do .env
DB_HOST = os.getenv('DB_HOST', 'localhost')
DB_NAME = os.getenv('DB_NAME', 'testedb')
DB_USER = os.getenv('DB_USER', 'docker')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'password')
DB_PORT = os.getenv('DB_PORT', '5432')

def get_usuarios():
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT
    )
    cur = conn.cursor()
    cur.execute('SELECT id, nome FROM usuarios')
    dados = cur.fetchall()
    conn.close()
    return dados

@app.route('/')
def index():
    usuarios = get_usuarios()
    return render_template('index.html', usuarios=usuarios)

if __name__ == '__main__':
    app.run(debug=True)
