# Variáveis de configuração
GCCFLAGS = -g -Wall -Wfatal-errors -fprofile-arcs -ftest-coverage
ALL = identifier
GCC = gcc


# Compilação do projeto principal
all: 
	$(GCC) $(GCCFLAGS) -o app srco/quick_sort.c srco/merge_sort.c srco/heap_sort.c srco/selection_sort.c srco/insertion_sort.c srco/bubble_sort.c srco/radix_sort.c srco/counting_sort.c srco/sort.c main.c
	compile run
# Limpeza dos arquivos gerados
clean:
	rm -f app
	rm -fr $(ALL) *.o cov* *.dSYM *.gcda *.gcno *.gcov
	$(CLEANUP) $(TARGET1)
	

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


CFLAGS=-std=c99
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -Wpointer-arith
CFLAGS += -Wcast-align
CFLAGS += -Wwrite-strings
CFLAGS += -Wswitch-default
CFLAGS += -Wunreachable-code
CFLAGS += -Winit-self
CFLAGS += -Wmissing-field-initializers
CFLAGS += -Wno-unknown-pragmas
CFLAGS += -Wstrict-prototypes
CFLAGS += -Wundef
CFLAGS += -Wold-style-definition

TARGET_BASE1=all_tests
TARGET1 = $(TARGET_BASE1)$(TARGET_EXTENSION)
SRC_FILES1=\
  src/unity.c \
  extras/fixture/src/unity_fixture.c \
  examples/foo/src/sort.c \
  examples/foo/test/TestFoo.c \
  examples/foo/test/test_runners/TestFoo_Runner.c \
  examples/foo/test/test_runners/all_tests.c
INC_DIRS=-Isrc -I/src -I/extras/fixture/src
SYMBOLS=


compile:
	$(C_COMPILER) $(CFLAGS) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES1) -o $(TARGET1)

run:
	- ./$(TARGET1) -v

ci: CFLAGS += -Werror
ci: compile
