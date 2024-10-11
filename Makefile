GCCFLAGS = -g -Wall -Wfatal-errors 
ALL = identifier
GCC = gcc

all: 
	gcc -o app src/quick_sort.c src/merge_sort.c src/heap_sort.c src/selection_sort.c src/insertion_sort.c src/bubble_sort.c src/radix_sort.c src/counting_sort.c src/sort.c main.c

clean:
	rm -f app

gcc:
	"$(GCC) $@.c"

address:
	$(GCC) $(GCCFLAGS) -fsanitize=address $@.c -o $@

valgrind:
	$(GCC) $(GCCFLAGS) $@.c -o $@
    valgrind --leak-check=full --show-leak-kinds=all ./$@

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem $@.c