# Script para generar 40 imagenes aleatorias
for i in {1..40}; do
	curl https://picsum.photos/id/488/200/300 > imagenes/img-$i.jpg
done

