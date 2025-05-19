# Escolhendo a imagem do python pois utilizarei o flask
FROM python:3.13.2-alpine3.20

# Criando uma pasta na raiz chamada app
WORKDIR /app

# Copiando os arquivos necessários na pasta app
COPY requirements.txt .
COPY app.py .
# Copiando a pasta templates para a pasta templates no container
COPY ./templates ./templates

# Instalando sem salvar arquivos temporários (--no-cache-dir)
RUN pip install --no-cache-dir -r requirements.txt

# Executando o flask na porta 5000 
# e aceitando conexão em todas as interfaces (--host=0.0.0.0)
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
