output: *.o
	gcc *.o -o output

*.o: *.c
	gcc -c *.c

clean:
	rm -f *.o output

run: output
	./output
