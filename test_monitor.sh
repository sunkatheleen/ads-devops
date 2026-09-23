#!/bin/bash
erros=0

echo "Teste 1: O ficheiro monitor.sh existe?"
if [ -f "monitor.sh" ]; then echo "PASSOU"; else erros=$((erros+1)); fi

echo "Teste 2: O ficheiro monitor.sh possui permissão de execução?"
if [ -x "monitor.sh" ]; then echo "PASSOU"; else erros=$((erros+1)); fi

echo "Teste 3: O ficheiro monitor.sh contém o Shebang Bash?"
if grep -q "^#!/bin/bash" monitor.sh; then echo "PASSOU"; else erros=$((erros+1)); fi

echo "Teste 4: O script contém loop de proteção de CPU (sleep)?"
if grep -q "sleep" monitor.sh; then echo "PASSOU"; else erros=$((erros+1)); fi

echo "Teste 5: O manifesto Dockerfile está presente na diretoria?"
if [ -f "Dockerfile" ]; then echo "PASSOU"; else erros=$((erros+1)); fi

if [ $erros -eq 0 ]; then
  echo "Sucesso: Todos os 5 testes unitários passaram."
  exit 0
else
  echo "Falha: $erros teste(s) reprovou(aram)."
  exit 1
fi
