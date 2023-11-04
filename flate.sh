#!/bin/zsh

# de-/inflate files to bypass use of git lfs

if [ ! -e partaa ]; then
	echo "deflating..."
	tar -czf total.tar.gz $(ls | grep -v "flate.sh")

	split total.tar.gz -b 40M part
	rm -r $(ls | grep -v "flate.sh" | grep -v "part")
else
	echo "inflating..."
	cat part* > total.tar.gz

	tar -xzf total.tar.gz
	rm part*
	rm total.tar.gz
fi
