llvm10:
	cd wrapper && \
	g++ -fPIC -shared cursor.cc string.cc -o wrapper.so -I/usr/lib/llvm-10/include -L/usr/lib/llvm-10/lib -lclang

llvm9:
	cd wrapper && \
	g++ -fPIC -shared cursor.cc string.cc -o wrapper.so -I/usr/lib/llvm-9/include -L/usr/lib/llvm-9/lib -lclang

clean:
	rm wrapper/*.so