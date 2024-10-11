# Variáveis de configuração
GCCFLAGS = -g -Wall -Wfatal-errors 
ALL = identifier
GCC = gcc

# Compilação do projeto principal
all: 
	$(GCC) $(GCCFLAGS) -o app src/quick_sort.c src/merge_sort.c src/heap_sort.c src/selection_sort.c src/insertion_sort.c src/bubble_sort.c src/radix_sort.c src/counting_sort.c src/sort.c main.c

# Limpeza dos arquivos gerados
clean:
	rm -f app
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov

# Compilação do identificador
identifier: identifier.c
	$(GCC) $(GCCFLAGS) -o $@ $@.c

# Compilação básica com gcc
gcc:
	$(GCC) $(GCCFLAGS) -o $@ $@.c

# Sanitização de endereço
address:
	$(GCC) $(GCCFLAGS) -fsanitize=address $@.c -o $@

# Verificação de memória com Valgrind
valgrind:
	$(GCC) $(GCCFLAGS) $@.c -o $@
	valgrind --leak-check=full --show-leak-kinds=all ./$@

# Análise estática de código com cppcheck
cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem $@.c
