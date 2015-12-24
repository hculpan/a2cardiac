PLATFORM=apple2enh
PGM=a2card
AC=java -jar AppleCommander-1.3.5.13.jar

CC65BASE=/Users/harryculpan/src/cc65
CC65_HOME=$(CC65BASE)/bin

$(PGM): $(PGM).c $(PGM).po
	$(CC65_HOME)/cl65 -t $(PLATFORM) -O $(PGM).c
	$(AC) -d $(PGM).po $(PGM)
	$(AC) -cc65 $(PGM).po $(PGM) BIN < $(PGM)

all: $(PGM) $(PGM).po

$(PGM).po:
#	$(AC) -pro140 $(PGM).po $(PGM)
	cp prodos-raw/blank.po ./$(PGM).po
	$(AC) -p $(PGM).po PRODOS SYS < prodos-raw/PRODOS
	$(AC) -p $(PGM).po BASIC.SYSTEM SYS < prodos-raw/BASIC.SYSTEM

clean:
	rm -f $(PGM)
	rm -f *.o

clean-disk:
	rm -f $(PGM).po

clean-all: clean clean-disk
