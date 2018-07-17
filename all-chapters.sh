cd non-mutating
make all STATS=1
cd ../maxmin
make all STATS=1
cd ../binary-search
make all STATS=1
cd ../mutating
make all STATS=1
cd ../numeric
make all STATS=1
cd ../heap
make all STATS=1
cd ../sorting
make all STATS=1
cd ../classic-sorting
make all STATS=1
cd ../stats
python generate_recap_csv.py
