all:
	cd wrapper && \
	g++ -fPIC -shared cursor.cc -o wrapper.so -I/usr/lib/llvm-9/include -L/usr/lib/llvm-9/lib -lclang

clean:
	rm wrapper/*.so