CRYPTOBJS =  encrypt.o fileIO.o

all : crypt

%.o : %.s
	as -g -o $@ $<

crypt : $(CRYPTOBJS)
	ld -g -o crypt $(CRYPTOBJS)
