# Variáveis de configuração
GCCFLAGS = -g -Wall -Wfatal-errors -fprofile-arcs -ftest-coverage
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
	./cov  # Executa o programa para gerar dados de cobertura
	gcov -b main.c
	gcov -b cov-identifier.gcda
	gcov -b src/quick_sort.c 
	gcov -b src/merge_sort.c 
	gcov -b src/heap_sort.c 
	gcov -b src/selection_sort.c 
	gcov -b src/insertion_sort.c
	gcov -b src/bubble_sort.c
	gcov -b src/radix_sort.c
	gcov -b src/counting_sort.c
	gcov -b src/sort.c
	gcov -b identifier.c
