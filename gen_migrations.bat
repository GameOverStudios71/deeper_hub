rmdir databases /s/q
cd generators
cd schemas_from_tables
python generator.py
cd ..
cd ..
mix clean & mix run