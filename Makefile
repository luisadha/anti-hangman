PREFIX  := /data/data/com.termux/files/usr
MANDIR  := $(PREFIX)/share/man
BINDIR  := $(PREFIX)/bin
SOURCE  := index.html
TARGET  := anti-hangman

install:
	@mkdir -p $(BINDIR)
	@mkdir -p $(MANDIR)/man1

	@install -m755 $(SOURCE)		$(BINDIR)/$(TARGET)
	@install -m644 man/$(TARGET).1		$(MANDIR)/man1/
	@echo "✅ Successfully installed to $(PREFIX)"

uninstall:
	@rm -f $(BINDIR)/$(TARGET)
	@rm -f $(MANDIR)/man1/$(TARGET).1
	@echo "✅ Successfully uninstall"
