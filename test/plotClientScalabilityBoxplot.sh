#!/bin/zsh
# Plot scalability tests.
re='^[0-9]+$'

echo "csparql taquery cqels" > .clientscalability-bp.data
#for i in $(seq 1 1 200); do
    line=""
    file="csparql-client-output/output.txt"
    tail -n +2 $file | awk '{print $9}' >> .tmp-cbp-csparql
    file="taquery-client-output/output.txt"
    tail -n +2 $file | awk '{print $9}' >> .tmp-cbp-taquery
    file="cqels-client-output/output.txt"
    tail -n +2 $file | awk '{print $9}' >> .tmp-cbp-cqels
    #done

paste -d ' ' <(cat .tmp-cbp-csparql) <(cat .tmp-cbp-taquery) <(cat .tmp-cbp-cqels) >> .clientscalability-bp.data   
gnuplot plotClientScalabilityBoxplot.gplot > clientScalabilityBoxplot.png

rm .tmp-cbp-csparql
rm .tmp-cbp-taquery
rm .tmp-cbp-cqels
