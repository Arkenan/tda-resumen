if [ $1 ]; then
  pandoc $1.md -s -S -o $1.pdf
else
  echo "Error, debe ingresar un archivo a convertir"
fi
