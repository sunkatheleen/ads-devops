FROM ubuntu:latest
# Define o diretório de trabalho dentro do container
WORKDIR /app
# Copia o script do host para dentro do container
COPY monitor.sh .
# Concede permissão de execução
RUN chmod +x monitor.sh
# Comando que mantém o container vivo
CMD ["./monitor.sh"]
