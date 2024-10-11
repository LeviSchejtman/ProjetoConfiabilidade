# Variáveis de configuração
GCCFLAGS = -g -Wall -Wfatal-errors -fprofile-arcs -ftest-coverage
ALL = identifier
GCC = gcc


# Compilação do projeto principal
all: 
	$(GCC) $(GCCFLAGS) -o app srco/quick_sort.c srco/merge_sort.c srco/heap_sort.c srco/selection_sort.c srco/insertion_sort.c srco/bubble_sort.c srco/radix_sort.c srco/counting_sort.c srco/sort.c main.c
# Limpeza dos arquivos gerados
clean:
	rm -f app
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov
	

# Compilação do identificador
identifier: identifier.c
	$(GCC) $(GCCFLAGS) -o $@ $@.c


# Sanitização de endereço
address:
	$(GCC) $(GCCFLAGS) -fsanitize=address srco/quick_sort.c srco/merge_sort.c srco/heap_sort.c srco/selection_sort.c srco/insertion_sort.c srco/bubble_sort.c srco/radix_sort.c srco/counting_sort.c srco/sort.c main.c -o main


# Verificação de memória com Valgrind
valgrind:
	$(GCC) $(GCCFLAGS) srco/quick_sort.c srco/merge_sort.c srco/heap_sort.c srco/selection_sort.c srco/insertion_sort.c srco/bubble_sort.c srco/radix_sort.c srco/counting_sort.c srco/sort.c main.c -o main
	valgrind --leak-check=full --show-leak-kinds=all ./main

# Análise estática de código com cppcheck
cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem srco/quick_sort.c srco/merge_sort.c srco/heap_sort.c srco/selection_sort.c srco/insertion_sort.c srco/bubble_sort.c srco/radix_sort.c srco/counting_sort.c srco/sort.c main.c

# Cobertura de código com gcov
cov: all
	./app  # Executa o programa para gerar dados de cobertura
	gcov -b main.c
	gcov -b cov-identifier.gcda
	gcov -b srco/quick_sort.c 
	gcov -b srco/merge_sort.c 
	gcov -b srco/heap_sort.c 
	gcov -b srco/selection_sort.c 
	gcov -b srco/insertion_sort.c
	gcov -b srco/bubble_sort.c
	gcov -b srco/radix_sort.c
	gcov -b srco/counting_sort.c
	gcov -b srco/sort.c
	gcov -b identifier.c
