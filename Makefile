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


# Sanitização de endereço
address:
	$(GCC) $(GCCFLAGS) -fsanitize=address src/quick_sort.c src/merge_sort.c src/heap_sort.c src/selection_sort.c src/insertion_sort.c src/bubble_sort.c src/radix_sort.c src/counting_sort.c src/sort.c main.c -o main


# Verificação de memória com Valgrind
valgrind:
	$(GCC) $(GCCFLAGS) src/quick_sort.c src/merge_sort.c src/heap_sort.c src/selection_sort.c src/insertion_sort.c src/bubble_sort.c src/radix_sort.c src/counting_sort.c src/sort.c main.c -o main
	valgrind --leak-check=full --show-leak-kinds=all ./main

# Análise estática de código com cppcheck
cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem src/quick_sort.c src/merge_sort.c src/heap_sort.c src/selection_sort.c src/insertion_sort.c src/bubble_sort.c src/radix_sort.c src/counting_sort.c src/sort.c main.c

# Cobertura de código com gcov
cov: all
	./app  # Executa o programa para gerar dados de cobertura
	gcov main.c
	gcov src/quick_sort.c 
	gcov src/merge_sort.c 
	gcov src/heap_sort.c 
	gcov src/selection_sort.c 
	gcov src/insertion_sort.c
	gcov src/bubble_sort.c
	gcov src/radix_sort.c
	gcov src/counting_sort.c
	gcov src/sort.c  # Gera os relatórios de cobertura de código
