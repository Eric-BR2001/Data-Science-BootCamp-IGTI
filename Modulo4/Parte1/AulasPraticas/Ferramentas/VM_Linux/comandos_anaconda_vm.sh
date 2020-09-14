# Baixar o diretório Streaming para o seguinte caminho
/home/igti/Downloads

# JUPYTER-NOTEBOOK
# Acessar o link https://www.anaconda.com/products/individual para baixar a última versão do Anaconda

# Instalar o Anaconda
bash Anaconda3-2020.07-Linux-x86_64.sh
ENTER # aceitar os termos
yes # aceitar a instalação
ENTER # aceitar o diretório padrão /home/igti/anaconda3

# Atualizar o conda
conda update conda

# Atualizar o Anaconda
conda update anaconda

# Instalar o pyspark no Anaconda
conda install -c conda-forge pyspark

# Chamar o Jupyter-Notebook no console
jupyter-notebook

# OBSERVAÇÃO 1: Para executar o Spark no jupyter, basta baixar o Anaconda e instalar as dependências

# OBSERVAÇÃO 2: Eventualmente, em outro terminal, deverá ser chamado o seguinte comando de comunicação de portas
nc -lk 9999

# OBSERVAÇÃO 3: Para executar alguns dos comandos nos notebooks, as biblioteca utilizadas nas aulas práticas para Spark Streaming no Linux devem ser instaladas, através do seguinte(s) comando(s):
conda install -c conda-forge textblob
conda install -c conda-forge googletrans
conda install -c conda-forge unidecode
conda install -c conda-forge tweepy

# OBSERVAÇÃO 4: Para executar o exemplo do Twitter, deve ser aberto outro terminal e executado o(s) seguinte(s) comando(s):
source activate base
python /home/igti/Downloads/Streaming/Streaming Twitter
