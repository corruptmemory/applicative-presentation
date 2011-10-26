SRC = src
TEXSRC = texsrc
DOTSRC = dotsrc
DOTPDF = dotpdf

HASKELL_TEX := $(patsubst $(SRC)/%.hs,$(TEXSRC)/%.hs.tex,$(wildcard $(SRC)/*.hs))
DOT_PDF := $(patsubst $(DOTSRC)/%.dot,$(DOTPDF)/%.pdf,$(wildcard $(DOTSRC)/*.dot))

# all: applicative.pdf force
all: applicative.pdf force

applicative.pdf: applicative.tex $(HASKELL_TEX) $(DOT_PDF) force
	xelatex $<

$(TEXSRC)/%.hs.tex: $(SRC)/%.hs force
	highlight -d texsrc -P -O latex -f -s edit-anjuta -k tt -S Haskell -i $< -c haskell.sty

$(DOTPDF)/%.pdf: $(DOTSRC)/%.dot force
	dot -Tpdf -o $@ $<

clean:
	-rm -f *.pdf *.ps *.bbl *.log *.aux *.toc *.out *.blg *.snm *.nav *~ $(TEXSRC)/* $(DOTPDF)/*

.PHONY: force